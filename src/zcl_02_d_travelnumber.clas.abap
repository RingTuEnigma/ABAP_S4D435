CLASS zcl_02_d_travelnumber DEFINITION
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



CLASS zcl_02_d_travelnumber IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.

    DATA travels TYPE zt02i_traveltp.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        et_data                 = travels
    ).

    LOOP AT travels REFERENCE INTO DATA(travel).

      IF travel->travelnumber IS INITIAL.
        travel->travelnumber = cl_s4d435_model=>get_next_travelid_for_agency( iv_agencynum = travel->travelagency ).

        io_modify->update(
          EXPORTING
            iv_node           = is_ctx-node_key
            iv_key            = travel->key
*            iv_root_key       =
            is_data           = travel
            it_changed_fields = VALUE #( ( if_d435c_i_traveltp_c=>sc_node_attribute-d435c_i_traveltp-travelnumber ) )
        ).

      ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
