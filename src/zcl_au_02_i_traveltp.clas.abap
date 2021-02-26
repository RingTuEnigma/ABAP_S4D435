CLASS zcl_au_02_i_traveltp DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_auth_draft_active
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_lib_auth_draft_active~check_instance_authority
        REDEFINITION .
    METHODS /bobf/if_lib_auth_draft_active~check_static_authority
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_au_02_i_traveltp IMPLEMENTATION.


  METHOD /bobf/if_lib_auth_draft_active~check_instance_authority.

    DATA lt_travels TYPE zt02i_traveltp.

    CASE is_ctx-activity.
      WHEN /bobf/cl_frw_authority_check=>sc_activity-create
      OR /bobf/cl_frw_authority_check=>sc_activity-change
      OR /bobf/cl_frw_authority_check=>sc_activity-display.

        DATA(activity) = is_ctx-activity.
      WHEN /bobf/cl_frw_authority_check=>sc_activity-execute.
        CASE is_ctx-action_name.
          WHEN 'SET_TO_CANCELLED'.
            activity = /bobf/cl_frw_authority_check=>sc_activity-change.
          WHEN OTHERS.
            activity = /bobf/cl_frw_authority_check=>sc_activity-display.
        ENDCASE.
    ENDCASE.

    IF activity IS NOT INITIAL.

      io_read->retrieve(
        EXPORTING
          iv_node                 = is_ctx-node_key
          it_key                  = it_key
        IMPORTING
          et_data                 = lt_travels
          et_failed_key           = et_failed_key
      ).

      LOOP AT lt_travels REFERENCE INTO DATA(travel)
      WHERE travelagency IS NOT INITIAL.

        cl_s4d435_model=>authority_check(
          EXPORTING
            iv_agencynum = travel->travelagency
            iv_actvt     = activity
          RECEIVING
            rv_rc        = DATA(sy_subrc)
        ).

        IF sy_subrc <> 0.
          et_failed_key = VALUE #( BASE et_failed_key ( key = travel->key ) ).
        ENDIF.

      ENDLOOP.

    ENDIF.
  ENDMETHOD.


  METHOD /bobf/if_lib_auth_draft_active~check_static_authority.
  ENDMETHOD.
ENDCLASS.
