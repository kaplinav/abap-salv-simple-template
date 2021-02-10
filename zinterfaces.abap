*&---------------------------------------------------------------------*
*&  interfaces
*&---------------------------------------------------------------------*

interface isel_screen.
endinterface. "isel_screen.

interface ialv_screen.
types:
begin of t_texts,
	short_10 type scrtext_s,
	medium_20 type scrtext_m,
	long_40 type scrtext_l,
end of t_texts.
endinterface. " ialv_screen.

interface idata_src.
endinterface. " idata_src.