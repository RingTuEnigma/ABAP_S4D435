@AbapCatalog.sqlViewName: 'Z02I_TRITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Item Interface View'

@VDM.viewType: #BASIC

define view Z02_I_TRAVELITEM
  as select from z02_tritem association[1..1] to z02_i_travel as _travels on $projection.TravelAgency = _travels.TravelAgency 
                                                                         and $projection.TravelNumber = _travels.TravelNumber
{
     key agencynum as TravelAgency,
     key travelid  as TravelNumber,
      tritemno  as ItemNumber,
      trguid    as TravelGuid,
      carrid    as AirlineID,
      connid    as ConnectionNumber,
      fldate    as FlightDate,
      bookid    as BookingNumber,
      class     as FlightClass,
      passname  as PassengerName,
      @Semantics.systemDateTime.createdAt: true
      createdat as CreatedAt,
      @Semantics.user.createdBy: true
      createdby as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      changedat as ChangedAt,
      @Semantics.user.lastChangedBy: true
      changedby as ChangedBy,
      _travels

}
