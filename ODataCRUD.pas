  method EMPLOYEESETSET_CREATE_ENTITY.
**TRY.
*CALL METHOD SUPER->EMPLOYEESETSET_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    IO_TECH_REQUEST_CONTEXT =
*    IT_NAVIGATION_PATH      =
**    IO_DATA_PROVIDER        =
**  IMPORTING
**    ER_ENTITY               =
*    .
** CATCH /IWBEP/CX_MGW_BUSI_EXCEPTION .
** CATCH /IWBEP/CX_MGW_TECH_EXCEPTION .
**ENDTRY.
data: ls_data type ZCL_ZODATA_P_MPC=>TS_EMPLOYEESET,
          lo_message_container TYPE REF TO /iwbep/if_message_container,
          lv_msg_text  type bapi_msg.

    IO_DATA_PROVIDER->READ_ENTRY_DATA( importing es_data = ls_data ).

    update zemployee from ls_data.

    if sy-subrc eq 0.
      lv_msg_text = 'Data updated successfully'.
      CALL METHOD lo_message_container->add_message_text_only
      EXPORTING
        iv_msg_type = 'S'
        iv_msg_text = lv_msg_text.

    else.
      lv_msg_text = 'Data not found.'.
      CALL METHOD lo_message_container->add_message_text_only
      EXPORTING
        iv_msg_type = 'E'
        iv_msg_text = lv_msg_text.

      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
      message_container = lo_message_container.
endif.
  endmethod.
  
  
    method EMPLOYEESETSET_GET_ENTITY.
**TRY.
*CALL METHOD SUPER->EMPLOYEESETSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    IO_REQUEST_OBJECT       =
**    IO_TECH_REQUEST_CONTEXT =
*    IT_NAVIGATION_PATH      =
**  IMPORTING
**    ER_ENTITY               =
**    ES_RESPONSE_CONTEXT     =
*    .
** CATCH /IWBEP/CX_MGW_BUSI_EXCEPTION .
** CATCH /IWBEP/CX_MGW_TECH_EXCEPTION .
**ENDTRY.

    DATA: LS_KEY LIKE LINE OF IT_KEY_TAB.

    READ TABLE IT_KEY_TAB INTO LS_KEY index 1.

    select * from zemployee into ER_ENTITY where Name = ls_key-value.
      endselect.


  endmethod.
  
  
    method EMPLOYEESETSET_GET_ENTITYSET.
**TRY.
*CALL METHOD SUPER->EMPLOYEESETSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    IO_TECH_REQUEST_CONTEXT  =
**  IMPORTING
**    ET_ENTITYSET             =
**    ES_RESPONSE_CONTEXT      =
*    .
** CATCH /IWBEP/CX_MGW_BUSI_EXCEPTION .
** CATCH /IWBEP/CX_MGW_TECH_EXCEPTION .
**ENDTRY.

    SELECT * FROM ZEMPLOYEE INTO TABLE ET_ENTITYSET.
  endmethod.
  
  
     method EMPLOYEESETSET_UPDATE_ENTITY.
**TRY.
*CALL METHOD SUPER->EMPLOYEESETSET_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    IO_TECH_REQUEST_CONTEXT =
*    IT_NAVIGATION_PATH      =
**    IO_DATA_PROVIDER        =
**  IMPORTING
**    ER_ENTITY               =
*    .
** CATCH /IWBEP/CX_MGW_BUSI_EXCEPTION .
** CATCH /IWBEP/CX_MGW_TECH_EXCEPTION .
**ENDTRY.
    data: ls_data type ZCL_ZODATA_P_MPC=>TS_EMPLOYEESET,
          lo_message_container TYPE REF TO /iwbep/if_message_container,
          lv_msg_text  type bapi_msg.

    IO_DATA_PROVIDER->READ_ENTRY_DATA( importing es_data = ls_data ).

    update zemployee from ls_data.

    IF SY-SUBRC EQ 0.

      lo_message_container = me->mo_context->get_message_container( ).

      lo_message_container->add_message( iv_msg_type = 'S'
        iv_msg_id = 'ZZZ'
        iv_msg_number = 45
        iv_msg_text = 'DATA UPDATED Successfully'
        iv_is_leading_message = abap_false
        iv_add_to_response_header = abap_true
      ).
    ENDIF.
*    if sy-subrc eq 0.
*      lv_msg_text = 'Data updated successfully'.
*      CALL METHOD lo_message_container->add_message_text_only
*      EXPORTING
*        iv_msg_type = 'S'
*        iv_msg_text = lv_msg_text.
*
*    else.
*      lv_msg_text = 'Data not found.'.
*      CALL METHOD lo_message_container->add_message_text_only
*      EXPORTING
*        iv_msg_type = 'E'
*        iv_msg_text = lv_msg_text.
*
*      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
*      EXPORTING
*      message_container = lo_message_container.
*endif.
*

  endmethod.
  
  
   method EMPLOYEESETSET_DELETE_ENTITY.
**TRY.
*CALL METHOD SUPER->EMPLOYEESETSET_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    IO_TECH_REQUEST_CONTEXT =
*    IT_NAVIGATION_PATH      =
*    .
** CATCH /IWBEP/CX_MGW_BUSI_EXCEPTION .
** CATCH /IWBEP/CX_MGW_TECH_EXCEPTION .
**ENDTRY.
    data: ls_key_tab type /IWBEP/S_MGW_NAME_VALUE_PAIR.

    READ TABLE IT_KEY_TAB INDEX 1 INTO LS_KEY_TAB.



    DELETE from ZEMPLOYEE WHERE NAME = ls_key_tab-value.

  endmethod.