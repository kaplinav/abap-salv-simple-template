*&---------------------------------------------------------------------*
*&  selection screen definition
*&---------------------------------------------------------------------*

class sel_screen definition.
public section.
" interfaces
interfaces isel_screen.
" aliases
aliases t_input for isel_screen~t_input.
" types
" constants
" data definition
" methods
class-methods class_constructor.

class-methods get_input
  returning
    value(r) type t_input.

class-methods pai.
class-methods pbo.
class-methods on_f4.

private section.
" interfaces
" types
" constants
" data definition
" methods
class-methods process_screen.
endclass. " sel_screen

selection-screen begin of block b01 with frame.
selection-screen end of block b01.

class sel_screen implementation.
method class_constructor.
endmethod. " class_constructor.

method get_input.
endmethod. " get_input.

method pai.
endmethod. " pai.

method pbo.
endmethod. " pbo.

" loop at screen
method process_screen.
endmethod. " process_screen

method on_subtype_f4.
endmethod. " on_subtype_f4
endclass. " sel_screen