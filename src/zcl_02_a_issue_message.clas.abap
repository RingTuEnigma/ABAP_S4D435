CLASS zcl_02_a_issue_message DEFINITION
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



CLASS zcl_02_a_issue_message IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.
    IF eo_message IS NOT BOUND.
        eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    DATA(message) = NEW zcm_02_travel(
      textid                  = zcm_02_travel=>zcm_02_travel
      severity                = zcm_02_travel=>co_severity_success
    ).

    eo_message->add_cm( message ).

    ev_static_action_failed = abap_false.



  ENDMETHOD.
ENDCLASS.
