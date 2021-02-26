@AbapCatalog.sqlViewName: 'Z02I_TRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Interface View'

@VDM.viewType: #BASIC

define view z02_i_travel
  as select from z02_travel
  association[1..1] to D435_I_Customer as _Customer
  on $projection.Customer = _Customer.Customer
  association[0..*] to Z02_I_TRAVELITEM as _travelitems on $projection.TravelAgency = _travelitems.TravelAgency and $projection.TravelNumber = _travelitems.TravelNumber
{
  key agencynum as TravelAgency,
  key travelid  as TravelNumber,
      trdesc    as TravelDescription,
      customid  as Customer,
      stdat     as StartDate,
      enddat    as EndDate,
      status    as Status,
      changedat as ChangedAt,
      changedby as ChangedBy,
      _Customer,
      _travelitems
}
