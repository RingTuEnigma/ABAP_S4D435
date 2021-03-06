CLASS zcl_02_v_sequence_of_dates DEFINITION
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



CLASS zcl_02_v_sequence_of_dates IMPLEMENTATION.


  METHOD /bobf/if_frw_validation~execute.

    DATA travels_new TYPE zt02i_traveltp.
    DATA travels_old TYPE zt02i_traveltp.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
        iv_before_image         = abap_true
      IMPORTING
        eo_message              = eo_message
        et_data                 = travels_new
    ).

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
        iv_before_image         = abap_true
      IMPORTING
        eo_message              = eo_message
        et_data                 = travels_old
    ).

    LOOP AT travels_new REFERENCE INTO DATA(travel_new).

      IF eo_message IS NOT BOUND.
        eo_message = /bobf/cl_frw_factory=>get_message( ).
      ENDIF.

      IF travel_new->enddate < travel_new->startdate.
        et_failed_key = VALUE #( BASE et_failed_key ( key = travel_new->key ) ).

        DATA(message) = NEW zcm_40_travel(
            textid = zcm_40_travel=>dates_wrong_sequence
            severity = zcm_40_travel=>co_severity_error ).
      ENDIF.

      IF travel_new->enddate < sy-datlo.
        et_failed_key = VALUE #( BASE et_failed_key ( key = travel_new->key ) ).

        message = NEW zcm_40_travel(
            textid = zcm_40_travel=>end_date_past
            severity = zcm_40_travel=>co_severity_error ).
      ENDIF.

      IF travel_new->startdate < sy-datlo.
        et_failed_key = VALUE #( BASE et_failed_key ( key = travel_new->key ) ).

        message = NEW zcm_40_travel(
            textid = zcm_40_travel=>start_date_past
            severity = zcm_40_travel=>co_severity_error ).
      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
