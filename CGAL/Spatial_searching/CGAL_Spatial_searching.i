%module CGAL_Spatial_searching

%include "../common.i"
%import  "../Common/Macros.h"
%import  "../Kernel/Point_2.h"
%import  "../Kernel/Point_3.h"
%include "../Common/Input_iterator.h"

//include files
%{
  #include "../Kernel/typedefs.h"
  #include "../Kernel/Point_2.h"
  #include "../Kernel/Point_3.h"
  #include "Kd_tree.h"
  #include "NN_search.h"
  #include "Fuzzy_objects.h"
%}

%include "config.i"

//definitions
%include "Kd_tree.h"
%include "NN_search.h"
%include "Fuzzy_objects.h"


%{
  #include "typedefs.h"
%}
%include "typedefs.h"

%pragma(java) jniclassimports=%{import CGAL.Kernel.Point_2; import CGAL.Kernel.Point_3;  import java.util.Iterator; import java.util.Collection;%}

%include "std_pair.i"
%typemap(javaimports)       std::pair<Point_2,double> %{import CGAL.Kernel.Point_2;%}
%template(Point_with_transformed_distance_2) std::pair<Point_2,double>;
%typemap(javaimports)       std::pair<Point_3,double> %{import CGAL.Kernel.Point_3;%}
%template(Point_with_transformed_distance_3) std::pair<Point_3,double>;

//typemap for point input iterator
Typemap_for_Input_iterator(Query_iterator_helper<Point_2>::input,Point_2,Point_2::cpp_base,SWIGTYPE_p_Point_2,"(LCGAL/Kernel/Point_2;)J",insert_range)
Typemap_for_Input_iterator(Query_iterator_helper<Point_3>::input,Point_3,Point_3::cpp_base,SWIGTYPE_p_Point_3,"(LCGAL/Kernel/Point_3;)J",insert_range)
#ifdef SWIGPYTHON
Typemap_for_Input_iterator_additional_function(Kd_tree_wrapper::Kd_tree_wrapper)
#endif

//Fuzzy objects
%typemap(javaimports)       Fuzzy_sphere_wrapper%{import CGAL.Kernel.Point_2;%}
%template(Fuzzy_sphere_2)   Fuzzy_sphere_wrapper <CGAL_FS_2,Point_2>;
%typemap(javaimports)       Fuzzy_iso_box_wrapper%{import CGAL.Kernel.Point_2;%}
%template(Fuzzy_iso_box_2)  Fuzzy_iso_box_wrapper<CGAL_FB_2,Point_2>;
%typemap(javaimports)       Fuzzy_sphere_wrapper%{import CGAL.Kernel.Point_3;%}
%template(Fuzzy_sphere_3)   Fuzzy_sphere_wrapper <CGAL_FS_3,Point_3>;
%typemap(javaimports)       Fuzzy_iso_box_wrapper%{import CGAL.Kernel.Point_3;%}
%template(Fuzzy_iso_box_3)  Fuzzy_iso_box_wrapper<CGAL_FB_3,Point_3>;

//typemaps for output iterator
%define Kd_tree_output_iterator_2 Query_iterator_helper<Point_2>::output %enddef
Typemap_for_Output_iterator(Kd_tree_output_iterator_2,Point_2,Point_2::cpp_base,SWIGTYPE_p_Point_2,"LCGAL/Kernel/Point_2;")
%define Kd_tree_output_iterator_3 Query_iterator_helper<Point_3>::output %enddef
Typemap_for_Output_iterator(Kd_tree_output_iterator_3,Point_3,Point_3::cpp_base,SWIGTYPE_p_Point_3,"LCGAL/Kernel/Point_3;")

%include "declare_spatial_searching_objects.i"
Declare_spatial_searching_objects(Orthogonal_incremental,OI,Point_2,2)
Declare_spatial_searching_objects(Incremental,I,Point_2,2)
Declare_spatial_searching_objects(K,K,Point_2,2)
Declare_spatial_searching_objects(Orthogonal,OK,Point_2,2)

Declare_spatial_searching_objects(Orthogonal_incremental,OI,Point_3,3)
Declare_spatial_searching_objects(Incremental,I,Point_3,3)
Declare_spatial_searching_objects(K,K,Point_3,3)
Declare_spatial_searching_objects(Orthogonal,OK,Point_3,3)