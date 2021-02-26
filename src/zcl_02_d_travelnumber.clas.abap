class ZCL_02_D_TRAVELNUMBER definition
  public
  inheriting from /BOBF/CL_LIB_D_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_DETERMINATION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_02_D_TRAVELNUMBER IMPLEMENTATION.


  method /BOBF/IF_FRW_DETERMINATION~EXECUTE.

*      DATA travel TYPE REF TO zs02i_traveltp.
*
*    travel->travelagency = cl_s4d435_model=>get_next_travelid_for_agency( ).
*
*    LOOP AT it_key REFERENCE INTO DATA(key).
*      io_modify->update(
*        EXPORTING
*          iv_node           = is_ctx-node_key
*          iv_key            = key->key
*          is_data           = travel
*          it_changed_fields = VALUE #( ( if_d435c_i_traveltp_c=>sc_node_attribute-d435c_i_traveltp-travelagency ) )
*      ).
*    ENDLOOP.

  endmethod.
ENDCLASS.
