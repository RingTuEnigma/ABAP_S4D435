@AbapCatalog.sqlViewName: 'Z02I_TRITEMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Item Transactional View'

@VDM.viewType: #TRANSACTIONAL

@ObjectModel: {
    semanticKey: ['TravelAgency', 'TravelNumber'],
    writeActivePersistence: 'Z02_V_TRITEM'
}

define view Z02_I_TRAVELITEMTP
  as select from Z02_I_TRAVELITEM
  association [1..1] to z02_i_traveltp as _travels on  $projection.TravelAgency = _travels.TravelAgency
                                                   and $projection.TravelNumber = _travels.TravelNumber
{     
      @ObjectModel.readOnly: true
  key TravelAgency,
      @ObjectModel.readOnly: true
  key TravelNumber,
      @ObjectModel.readOnly: true
      TravelGuid,
      ItemNumber,
      @ObjectModel.mandatory: true
      AirlineID,
      @ObjectModel.mandatory: true
      ConnectionNumber,
      @ObjectModel.mandatory: true
      FlightDate,
      @ObjectModel.readOnly: true
      BookingNumber,
      @ObjectModel.mandatory: true
      FlightClass,
      @ObjectModel.mandatory: true
      PassengerName,
      CreatedAt,
      CreatedBy,
      ChangedAt,
      ChangedBy,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _travels
}
