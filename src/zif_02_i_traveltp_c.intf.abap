interface ZIF_02_I_TRAVELTP_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF Z02_I_TRAVELITEMTP,
 CREATE_Z02_I_TRAVELITEMTP      TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9E88FD6299A90D31',
 DELETE_Z02_I_TRAVELITEMTP      TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9E88FD6299A98D31',
 SAVE_Z02_I_TRAVELITEMTP        TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9E88FD6299AA0D31',
 UPDATE_Z02_I_TRAVELITEMTP      TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9E88FD6299A94D31',
 VALIDATE_Z02_I_TRAVELITEMTP    TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9E88FD6299A9CD31',
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELTP,
 CREATE_Z02_I_TRAVELTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68CFB9B5',
 DELETE_Z02_I_TRAVELTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68D039B5',
 ISSUE_MESSAGE                  TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DE9D8D4E33C048E',
 LOCK_Z02_I_TRAVELTP            TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68CEF9B5',
 SAVE_Z02_I_TRAVELTP            TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68D0B9B5',
 SET_TO_CANCELLED               TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DEC687863530A93',
 UNLOCK_Z02_I_TRAVELTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68CF39B5',
 UPDATE_Z02_I_TRAVELTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68CFF9B5',
 VALIDATE_Z02_I_TRAVELTP        TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD80B1C68D079B5',
      END OF Z02_I_TRAVELTP,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF Z02_I_TRAVELTP,
        BEGIN OF LOCK_Z02_I_TRAVELTP,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF LOCK_Z02_I_TRAVELTP,
        BEGIN OF UNLOCK_Z02_I_TRAVELTP,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF UNLOCK_Z02_I_TRAVELTP,
      END OF Z02_I_TRAVELTP,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF Z02_I_TRAVELITEMTP,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EDB9E88FD6299A1AD31',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EDB9E88FD6299A1CD31',
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELTP,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EDB9DD80B1C68D199B5',
      END OF Z02_I_TRAVELTP,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF Z02_I_TRAVELITEMTP,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299A8AD31',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299A8ED31',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299AA4D31',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299AA6D31',
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELITEMTP_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299AA8D31',
      END OF Z02_I_TRAVELITEMTP_MESSAGE,
      BEGIN OF Z02_I_TRAVELITEMTP_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299AAAD31',
      END OF Z02_I_TRAVELITEMTP_PROPERTY,
      BEGIN OF Z02_I_TRAVELTP,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD80B1C68CED9B5',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD80B1C68CE99B5',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD80B1C68CF99B5',
 _TRAVELITEMS                   TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9E88FD6299A84D31',
      END OF Z02_I_TRAVELTP,
      BEGIN OF Z02_I_TRAVELTP_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD80B1C68D119B5',
      END OF Z02_I_TRAVELTP_LOCK,
      BEGIN OF Z02_I_TRAVELTP_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD80B1C68D0F9B5',
      END OF Z02_I_TRAVELTP_MESSAGE,
      BEGIN OF Z02_I_TRAVELTP_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD80B1C68D139B5',
      END OF Z02_I_TRAVELTP_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF Z02_I_TRAVELITEMTP,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELTP,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF Z02_I_TRAVELTP,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '005056044E851EDB9DD80B1C68CDF9B5' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'Z02_I_TRAVELTP' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF Z02_I_TRAVELITEMTP,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9E88FD6299A1ED31',
 ADMINISTRATIVE_DATA            TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9E88FD6299A20D31',
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELTP,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9DD80B1C68D1B9B5',
 ADMINISTRATIVE_DATA            TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9E88FD6299A18D31',
 TRAVELAGENCY                   TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9E858EB9BD74C522',
 TRAVELNUMBER                   TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9E859434A803E555',
      END OF Z02_I_TRAVELTP,
    END OF SC_DETERMINATION .
  constants:
    BEGIN OF SC_GROUP,
 Z02_I_TRAVELTP                 TYPE /BOBF/OBM_GROUP_KEY VALUE '005056044E851EEB9E82799A41F41DDF',
    END OF SC_GROUP .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 Z02_I_TRAVELITEMTP             TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9E88FD6299A10D31',
 Z02_I_TRAVELITEMTP_MESSAGE     TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9E88FD6299A88D31',
 Z02_I_TRAVELITEMTP_PROPERTY    TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9E88FD6299A8CD31',
 Z02_I_TRAVELTP                 TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD80B1C68CE39B5',
 Z02_I_TRAVELTP_LOCK            TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD80B1C68CEB9B5',
 Z02_I_TRAVELTP_MESSAGE         TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD80B1C68CE79B5',
 Z02_I_TRAVELTP_PROPERTY        TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD80B1C68CF79B5',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF Z02_I_TRAVELITEMTP,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  ITEMGUID                       TYPE STRING VALUE 'ITEMGUID',
  TRAVELAGENCY                   TYPE STRING VALUE 'TRAVELAGENCY',
  TRAVELNUMBER                   TYPE STRING VALUE 'TRAVELNUMBER',
  ITEMNUMBER                     TYPE STRING VALUE 'ITEMNUMBER',
  TRAVELGUID                     TYPE STRING VALUE 'TRAVELGUID',
  AIRLINEID                      TYPE STRING VALUE 'AIRLINEID',
  CONNECTIONNUMBER               TYPE STRING VALUE 'CONNECTIONNUMBER',
  FLIGHTDATE                     TYPE STRING VALUE 'FLIGHTDATE',
  BOOKINGNUMBER                  TYPE STRING VALUE 'BOOKINGNUMBER',
  FLIGHTCLASS                    TYPE STRING VALUE 'FLIGHTCLASS',
  PASSENGERNAME                  TYPE STRING VALUE 'PASSENGERNAME',
  CREATEDAT                      TYPE STRING VALUE 'CREATEDAT',
  CREATEDBY                      TYPE STRING VALUE 'CREATEDBY',
  CHANGEDAT                      TYPE STRING VALUE 'CHANGEDAT',
  CHANGEDBY                      TYPE STRING VALUE 'CHANGEDBY',
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELTP,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  TRAVELAGENCY                   TYPE STRING VALUE 'TRAVELAGENCY',
  TRAVELNUMBER                   TYPE STRING VALUE 'TRAVELNUMBER',
  TRAVELDESCRIPTION              TYPE STRING VALUE 'TRAVELDESCRIPTION',
  CUSTOMER                       TYPE STRING VALUE 'CUSTOMER',
  STARTDATE                      TYPE STRING VALUE 'STARTDATE',
  ENDDATE                        TYPE STRING VALUE 'ENDDATE',
  STATUS                         TYPE STRING VALUE 'STATUS',
  CHANGEDAT                      TYPE STRING VALUE 'CHANGEDAT',
  CHANGEDBY                      TYPE STRING VALUE 'CHANGEDBY',
      END OF Z02_I_TRAVELTP,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF Z02_I_TRAVELITEMTP,
 Z02_I_TRAVELITEMTP             TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '005056044E851EDB9E88FD6299A82D31',
      END OF Z02_I_TRAVELITEMTP,
      BEGIN OF Z02_I_TRAVELTP,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '005056044E851EDB9DD80B1C68CE59B5',
      END OF Z02_I_TRAVELTP,
    END OF SC_NODE_CATEGORY .
  constants:
    BEGIN OF SC_VALIDATION,
      BEGIN OF Z02_I_TRAVELTP,
 CUSTOMER_EXISTS                TYPE /BOBF/VAL_KEY VALUE '005056044E851EEB9E828911914DDE17',
 MANDATORY_FIELDS               TYPE /BOBF/VAL_KEY VALUE '005056044E851EEB9E82851D05109E11',
 SEQUENCE_OF_DATES              TYPE /BOBF/VAL_KEY VALUE '005056044E851EDB9E83A959D9A320F8',
      END OF Z02_I_TRAVELTP,
    END OF SC_VALIDATION .
endinterface.
