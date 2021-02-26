CLASS zcl_02_a_set_to_cancelled DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.

  METHODS /bobf/if_frw_action~execute
    REDEFINITION .
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_a_set_to_cancelled IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.
    DATA it_table TYPE zt02i_traveltp.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
*        iv_before_image         = abap_false
*        iv_fill_data            = abap_true
*        it_requested_attributes =
      IMPORTING
        eo_message              = eo_message
        et_data                 = it_table
        et_failed_key           = et_failed_key
*        et_node_cat             =
    ).

    if eo_message is not bound.
        eo_message = /bobf/cl_frw_factory=>get_message( ).
    endif.

    LOOP AT it_table ASSIGNING FIELD-SYMBOL(<travel>).
        IF <travel>-status = 'C'.
            eo_message->add_cm( NEW cm_devs4d435(
              textid                  = cm_devs4d435=>already_cancelled
              severity                = cm_devs4d435=>co_severity_error
              ms_origin_location      = VALUE #( bo_key = is_ctx-bo_key node_key = is_ctx-node_key key = <travel>-key )
              travelnumber            = <travel>-travelnumber
            ) ).
        ELSE.
            <travel>-status = 'C'.

            io_modify->update(
              EXPORTING
                iv_node           = is_ctx-node_key
                iv_key            = <travel>-key
*                iv_root_key       =
                is_data           = REF #( <travel> )
*                it_changed_fields =
            ).

            eo_message->add_cm( NEW cm_devs4d435(
              textid                  = cm_devs4d435=>cancel_success
              severity                = cm_devs4d435=>co_severity_success
              ms_origin_location      = VALUE #( bo_key = is_ctx-bo_key node_key = is_ctx-node_key key = <travel>-key )
              travelnumber            = <travel>-travelnumber
              startdate               = <travel>-startdate
            ) ).
        ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
