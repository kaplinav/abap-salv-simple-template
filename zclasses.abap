*&---------------------------------------------------------------------*
*&  classes
*&---------------------------------------------------------------------*

class alv_screen definition .
public section.
" interfaces
interfaces if_fsbp_const_range .
interfaces ialv_screen.
" types
" constants
" data definition
" events
events clear
  exporting
    value(rows) type salv_t_row.

events save.
" methods
methods constructor
  importing
    im_ref type ref to data.

methods display.

protected section.
" types
" constants
" data definition
" methods

private section.
" aliases
aliases sign_include for if_fsbp_const_range~sign_include.
aliases option_equal for if_fsbp_const_range~option_equal.
aliases t_texts for ialv_screen~t_texts.
" types
" constants
" data definition
data m_ref type ref to data.
data m_salv_table type ref to cl_salv_table .
" methods
methods is_saving_confirmed
  returning
    value(r) type boolean.

methods on_user_command for event added_function of cl_salv_events
  importing
    e_salv_function.

methods set_display_settings.
methods set_layout.
methods set_optimize.
methods set_texts.

methods set_column_tech
	importing
		im_fname type lvc_fname.

methods set_column_texts
	importing
		im_fname type lvc_fname
		im_texts type t_texts.

methods set_toolbar.
methods tune.

endclass . " alv_screen

" class data source implementation
include zdata_source.

" class alv screen
include zalv_screen.