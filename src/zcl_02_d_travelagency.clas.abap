CLASS zcl_02_d_travelagency DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_d_travelagency IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA travel TYPE zs02i_traveltp.

    travel-travelagency = cl_s4d435_model=>get_agency_by_user( sy-uname ).

    LOOP AT it_key REFERENCE INTO DATA(key).
      io_modify->update(
        EXPORTING
          iv_node           = is_ctx-node_key
          iv_key            = key->key
          is_data           = REF #( travel )
          it_changed_fields = VALUE #( ( if_d435c_i_traveltp_c=>sc_node_attribute-d435c_i_traveltp-travelagency ) )
      ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
