@AbapCatalog.sqlViewName: 'Z02C_TRAVELTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Consumption View'

@VDM.viewType: #CONSUMPTION
@OData.publish: true

@Search.searchable: true

@Metadata.allowExtensions: true

@ObjectModel: {
    semanticKey: ['TravelAgency', 'TravelNumber'],
    transactionalProcessingDelegated: true,
    updateEnabled: true,
    createEnabled: true }

define view Z02_C_TRAVELTP
  as select from z02_i_traveltp
  association[1..*] to z02_C_TRAVELITEMTP as _travelitems on $projection.TravelAgency = _travelitems.TravelAgency and $projection.TravelNumber = _travelitems.TravelNumber
{
  key TravelAgency,
  key TravelNumber,

      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.8
               }

      TravelDescription,
      Customer,
      StartDate,
      EndDate,
      Status,
      ChangedAt,
      ChangedBy,
      _Customer,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _travelitems
}
