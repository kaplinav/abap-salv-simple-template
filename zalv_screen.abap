*&---------------------------------------------------------------------*
*&  class alv screen
*&---------------------------------------------------------------------*

class alv_screen implementation .
method constructor .

m_ref = im_ref.
field-symbols <table> type standard table.
assign im_ref->* to <table>.

try .

  cl_salv_table=>factory(
    importing
      r_salv_table = m_salv_table
    changing
      t_table = <table> ).

catch cx_salv_msg into data(e).
endtry.

data(events) = m_salv_table->get_event( ).
set handler on_user_command for events.

endmethod. " constructor .

method display.

tune( ).
m_salv_table->display( ).

endmethod. " display.

method is_saving_confirmed.

data answer type char1.

call function 'POPUP_TO_CONFIRM'
  exporting
    "titlebar              = l_msg
    text_question = 'Question'
    text_button_1 = 'Yes'(002)
    text_button_2 = 'No'(005)
    default_button = '1'
    display_cancel_button = ''
  importing
    answer = answer.

if answer = '1'.
  r = abap_true.
endif.

endmethod. " is_saving_confirmed.

method on_user_command.

case e_salv_function.
  when 'CLEAR'.
    data(selections) = m_salv_table->get_selections( ).
    data(rows) = selections->get_selected_rows( ).
    raise event clear exporting rows = rows.
    m_salv_table->refresh( refresh_mode = if_salv_c_refresh=>soft ).
  when 'SAVE'.
    if is_saving_confirmed( ).
      raise event save.
    endif.
  when others.
endcase.

endmethod. " on_user_command.

method set_display_settings.

data(selections) = m_salv_table->get_selections( ).
selections->set_selection_mode( if_salv_c_selection_mode=>row_column ).

data(display_settings) = m_salv_table->get_display_settings( ).
display_settings->set_striped_pattern( if_salv_c_bool_sap=>true ).
display_settings->set_list_header( 'header' ).

endmethod. " set_display_settings.

method set_layout.

data layout_key type salv_s_layout_key.
layout_key-report = sy-repid.

data(layout_settings) = m_salv_table->get_layout( ).
layout_settings->set_key( layout_key ).
layout_settings->set_save_restriction( if_salv_c_layout=>restrict_none ).
layout_settings->set_default( if_salv_c_bool_sap=>true ).

endmethod. " set_layout.

method set_optimize.

data(columns) = m_salv_table->get_columns( ).
columns->set_optimize( ).

endmethod. " set_optimize.

method set_texts.

data texts type t_texts.
texts-short_10 = 'Short'.
texts-medium_20 = 'Medium'.
texts-long_40 = 'Long'.

set_column_texts(
	im_fname = 'COLUMN'
	im_texts = texts ).

set_column_tech( 'TECH_COLUMN' ).

endmethod. " set_texts.

method set_column_tech.

if im_fname is initial.
	return.
endif.

try .
  column ?= columns->get_column( im_fname ).
  column->set_technical( abap_true ).
catch cx_salv_not_found into e.
endtry.

endmethod. " set_column_tech.

method set_column_texts.

if im_fname is initial.
	return.
endif.

if im_texts-short_10 is initial.
	return.
endif.

" text length
" short 10
" medium 20
" long 40

data(texts) = im_texts.
if texts-medium_20 is initial.
	texts-medium_20 = texts-short_10.
endif.

if texts-long_40 is initial.
	texts-long_40 = texts-medium_20.
endif.

data(columns) = m_salv_table->get_columns( ).
data column type ref to cl_salv_column_table.

try .
  column ?= columns->get_column( im_fname ).
  column->set_short_text( texts-short_10 ).
  column->set_medium_text( texts-medium_20 ).
  column->set_long_text( texts-long_40 ).
catch cx_salv_not_found into data(e).
endtry.

endmethod. " set_column_texts.

method set_toolbar.

m_salv_table->set_screen_status(
  pfstatus = 'SALV_STANDARD'
  report = sy-repid
  set_functions = m_salv_table->c_functions_all ).

endmethod. " set_toolbar.

method tune.

set_layout( ).
set_optimize( ).
set_texts( ).
set_toolbar( ).
set_display_settings( ).

endmethod. " tune.
endclass. " alv_screen.