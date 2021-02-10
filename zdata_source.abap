*&---------------------------------------------------------------------*
*&  class data source
*&---------------------------------------------------------------------*

class data_src definition .
public section.
" interfaces
interfaces if_fsbp_const_range .
interfaces idata_src.
interfaces isel_screen.
" aliases
" types
" constants
" data definition
" methods
methods add.

methods constructor
  importing
    im_input type t_input.

methods hndl_clear_event for event clear of alv_screen
  importing
    rows.

methods hndl_save_event for event save of alv_screen.

protected section.
" types
" constants
" data definition
" methods

private section.
" aliases
aliases sign_include for if_fsbp_const_range~sign_include.
aliases option_equal for if_fsbp_const_range~option_equal.
" types
" constants
" data definition
" methods
endclass . " data_src

class data_src implementation .
method add.
endmethod. " add.

method constructor .
endmethod. " constructor .

method hndl_clear_event.
endmethod. " hndl_clear_event.

method hndl_save_event.
endmethod. " hndl_save_event.
endclass. " data_src