#ifndef SWIG_CGAL_TRIANGULATION_2_CONSTRAINED_TRIANGULATION_PLUS_2_H
#define SWIG_CGAL_TRIANGULATION_2_CONSTRAINED_TRIANGULATION_PLUS_2_H

#include "Constrained_triangulation_2.h"
#include <CGAL/Constrained_triangulation_plus_2.h>

#ifndef SWIG
template<class T1,class T2>
struct Iterator_helper<std::pair<T1,T2> >{
  template <class T>
  static std::pair<T1,T2> convert(const T& i){
    return std::pair<T1,T2>(T1(i->first.first),T2(i->first.second));
  }
  
  static std::pair<T1,T2>
  default_value(){return std::pair<T1,T2>(T1(NULL),T2(NULL));}
};
#endif

template <class CDT_plus_2, class Vertex_handle>
class CDTP_context{
  typename CDT_plus_2::Context data;
public:
  typedef typename CDT_plus_2::Context cpp_base;
  typedef CGAL_Vertices_in_constraint_iterator<CDT_plus_2,Vertex_handle>  Vertices_in_constraint_iterator;

  const cpp_base& get_data() const { return data; } 
  cpp_base& get_data_ref() { return data; }
  CDTP_context(){}
  CDTP_context(const cpp_base& p):data(p){}
  Vertices_in_constraint_iterator vertices() {return Vertices_in_constraint_iterator(data.vertices_begin(),data.vertices_end());}
  Vertices_in_constraint_iterator current() {return Vertices_in_constraint_iterator(data.current(),data.vertices_end());}
};

template < class Base_triangulation_wrapper, class Vertex_handle >
class Constrained_triangulation_plus_2_wrapper: public Base_triangulation_wrapper
{
  typedef Base_triangulation_wrapper Base;
public:
  typedef typename Base_triangulation_wrapper::cpp_base                 cpp_base;
  typedef std::pair<Vertex_handle,Vertex_handle>                        Constraint_handle;
  typedef CGAL_Constraint_iterator<cpp_base,Constraint_handle>          Constraint_iterator;
  typedef CGAL_Subconstraint_iterator<cpp_base,Constraint_handle>       Subconstraint_iterator;
  typedef CGAL_Vertices_in_constraint_iterator<cpp_base,Vertex_handle>  Vertices_in_constraint_iterator;
  typedef CDTP_context<cpp_base,Vertex_handle>                          Context;
  typedef CGAL_Context_iterator<cpp_base,Context>                       Context_iterator;


  Constrained_triangulation_plus_2_wrapper():Base(){}
  Constrained_triangulation_plus_2_wrapper(Constraint_range range):Base(){
    for (Input_constraint_iterator it=range.first;it!=range.second;++it)
      this->data.push_back(*it);
  }
  
// Queries
  FORWARD_CALL_2(int,number_of_enclosing_constraints,Vertex_handle,Vertex_handle)
  Constraint_iterator constraints(){return Constraint_iterator( this->data.constraints_begin(),this->data.constraints_end() );}
  Subconstraint_iterator subconstraints(){return Subconstraint_iterator( this->data.subconstraints_begin(),this->data.subconstraints_end() );}
  Vertices_in_constraint_iterator vertices_in_constraint(const Vertex_handle& va,const Vertex_handle& vb){ return Vertices_in_constraint_iterator(this->data.vertices_in_constraint_begin(va.get_data(),vb.get_data()),this->data.vertices_in_constraint_end(va.get_data(),vb.get_data()));}
  FORWARD_CALL_2(Context,context,Vertex_handle,Vertex_handle)
  Context_iterator contexts(const Vertex_handle& va,Vertex_handle& vb) {return Context_iterator(this->data.contexts_begin(va.get_data(),vb.get_data()),this->data.contexts_end(va.get_data(),vb.get_data()));}
  
};

#endif //SWIG_CGAL_TRIANGULATION_2_CONSTRAINED_TRIANGULATION_PLUS_2_H


// Creation
//   Constrained_triangulation_plus_2<Tr> ctp ( Geom_traits gt=Geom_traits());
//   Constrained_triangulation_plus_2<Tr> ctp ( Constrained_triangulation_plus_2 ct);
// Assignment
//   void   ctp.swap ( Constrained_triangulation_plus_2 tr)
