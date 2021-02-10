*&---------------------------------------------------------------------*
*&  events
*&---------------------------------------------------------------------*

at selection-screen on value-request for screen_field.
sel_screen=>on_f4( ).

start-of-selection.
data(data_src) = new data_src( sel_screen=>get_input( ) ).
data_src->add( ).
end-of-selection.

if lines( data_src->m_entries ) = 0.
  message 'No data' type 'S'.
  return.
endif.

data(alv) = new alv_screen( ref #( data_src->m_entries ) ).
set handler data_src->hndl_save_event for alv.
set handler data_src->hndl_clear_event for alv.
alv->display( ).