// ------------------------------------------------------------------------------
// Copyright (c) 2014 GeometryFactory (FRANCE)
// Distributed under the Boost Software License, Version 1.0. (See accompany-
// ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
// ------------------------------------------------------------------------------


%module (package="CGAL") CGAL_Box_intersection_d

%include "SWIG_CGAL/common.i"
Decl_void_type()

SWIG_CGAL_add_java_loadLibrary(CGAL_Box_intersection_d)

%import  "SWIG_CGAL/Common/Macros.h"
%import  "SWIG_CGAL/Kernel/CGAL_Kernel.i"
%include "SWIG_CGAL/Common/Iterator.h"
%include "SWIG_CGAL/Common/Wrapper_iterator_helper.h"

//include files
%{
  #include <SWIG_CGAL/Common/Iterator.h>
%}

%pragma(java) jniclassimports=
%{
  import java.util.Iterator;
  import CGAL.Kernel.Bbox_2;
  import CGAL.Kernel.Bbox_3;
%}

%pragma(java) moduleimports=
%{
  import java.util.Iterator;
%}


%include "std_pair.i"
SWIG_CGAL_declare_identifier_of_template_class(Pair_of_int,std::pair<int,int>)

SWIG_CGAL_set_as_java_iterator(SWIG_CGAL_Iterator,Pair_of_int,)
SWIG_CGAL_declare_identifier_of_template_class(Ids_iterator,SWIG_CGAL_Iterator<std::vector< std::pair<int,int> >::iterator,std::pair<int,int> >)

%typemap(javaimports) Collect_ids_callback %{import java.util.Iterator;%}
%typemap(javaimports) Box_with_id_2 %{import CGAL.Kernel.Bbox_2;%}
%typemap(javaimports) Box_with_id_3 %{import CGAL.Kernel.Bbox_3;%}

%include "SWIG_CGAL/Box_intersection_d/Box_with_id.h"
%include "SWIG_CGAL/Box_intersection_d/Callbacks.h"
%include "SWIG_CGAL/Box_intersection_d/enum.h"


SWIG_CGAL_input_iterator_typemap_in(Wrapper_iterator_helper<Box_with_id_2>::input,Box_with_id_2,Box_with_id_2,Box_with_id_2::cpp_base,SWIGTYPE_p_Box_with_id_2,"(LCGAL/Box_intersection_d/Box_with_id_2;)J",box_intersection_d)
SWIG_CGAL_input_iterator_typemap_in(Wrapper_iterator_helper<Box_with_id_3>::input,Box_with_id_3,Box_with_id_3,Box_with_id_3::cpp_base,SWIGTYPE_p_Box_with_id_3,"(LCGAL/Box_intersection_d/Box_with_id_3;)J",box_intersection_d)
#ifdef SWIGPYTHON
SWIG_CGAL_input_iterator_typemap_in_python_extra_function(box_intersection_all_pairs_d)
SWIG_CGAL_input_iterator_typemap_in_python_extra_function(box_self_intersection_d)
SWIG_CGAL_input_iterator_typemap_in_python_extra_function(box_self_intersection_all_pairs_d)
#endif

//includes
%{
  #include <SWIG_CGAL/Box_intersection_d/Box_with_id.h>
  #include <SWIG_CGAL/Box_intersection_d/Callbacks.h>
  #include <SWIG_CGAL/Box_intersection_d/enum.h>
  #include <SWIG_CGAL/Common/Wrapper_iterator_helper.h>
  #include <CGAL/box_intersection_d.h>
  #include <vector>
%}

%include "SWIG_CGAL/Box_intersection_d/macros.i"
declare_box_intersection_d_box_functions(Box_with_id_2,Collect_ids_callback)
// Commented for now to avoid the error:
//   name clash , has the same erasure
//declare_box_intersection_d_box_functions(Box_with_id_3,Collect_ids_callback)