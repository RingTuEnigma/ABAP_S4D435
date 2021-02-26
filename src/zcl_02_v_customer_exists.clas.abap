CLASS zcl_02_v_customer_exists DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_v_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_validation~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_v_customer_exists IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA travels TYPE zt02i_traveltp.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = travels
    ).

    SELECT FROM d435_i_customer
    FIELDS customer
    INTO TABLE @DATA(customer_ids).
    IF sy-subrc <> 0.
    ENDIF.

    LOOP AT travels REFERENCE INTO DATA(travel).

      TRY.
          DATA(customer) = customer_ids[ customer = travel->customer ].
        CATCH cx_sy_itab_line_not_found.
          et_failed_key = VALUE #( BASE et_failed_key ( key = travel->customer ) ).

          IF eo_message IS NOT BOUND.
            eo_message = /bobf/cl_frw_factory=>get_message( ).
          ENDIF.

          eo_message->add_cm( NEW cm_devs4d435( textid = cm_devs4d435=>customer_not_exist severity = cm_devs4d435=>co_severity_error
          customer = travel->customer ms_origin_location = VALUE #( bo_key = is_ctx-bo_key node_key = is_ctx-node_key  key = travel->key  attributes = VALUE #( ( `CUSTOMER` ) ) ) ) ).
      ENDTRY.

    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
