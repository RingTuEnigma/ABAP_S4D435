@AbapCatalog.sqlViewName: 'Z02C_TRITEMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Item Consumption View'

@VDM.viewType: #CONSUMPTION

@Metadata.allowExtensions: true

@ObjectModel: {
    semanticKey: ['TravelAgency', 'TravelNumber'],
    
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
 }


define view z02_C_TRAVELITEMTP
  as select from Z02_I_TRAVELITEMTP
  association[1] to D435_I_FlightVH as _FlightVH 
   on $projection.AirlineID        = _FlightVH.AirlineID
  and $projection.ConnectionNumber = _FlightVH.ConnectionNumber
  and $projection.FlightDate       = _FlightVH.FlightDate
 association[1] to D435_I_FlightClassVH as _FlightClassVH
  on $projection.FlightClass       = _FlightClassVH.FlightClass
 association[1..1] to Z02_C_TRAVELTP as _travels on $projection.TravelAgency = _travels.TravelAgency 
                                                and $projection.TravelNumber = _travels.TravelNumber
    
{
      key TravelAgency,
      key TravelNumber,
      ItemNumber,
      TravelGuid,

      @Consumption.valueHelp: '_FlightVH'
      AirlineID,
      @Consumption.valueHelp: '_FlightVH'
      ConnectionNumber,
      @Consumption.valueHelp: '_FlightVH'

      FlightDate,
      BookingNumber,
      @Consumption.valueHelp: '_FlightClassVH'
      FlightClass,
      PassengerName,
      CreatedAt,
      CreatedBy,
      ChangedAt,
      ChangedBy,

      _FlightVH,
      _FlightClassVH,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _travels
}
