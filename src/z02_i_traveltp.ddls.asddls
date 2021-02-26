@AbapCatalog.sqlViewName: 'Z02I_TRAVELTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Transactional View'

@VDM.viewType: #TRANSACTIONAL

@ObjectModel: { modelCategory: #BUSINESS_OBJECT,
                compositionRoot: true,
                representativeKey: 'TravelNumber',
                semanticKey: ['TravelAgency', 'TravelNumber'],
                transactionalProcessingEnabled: true,
                writeActivePersistence: 'Z02_V_TRAVEL',
                updateEnabled: true,
                createEnabled: true }

define view z02_i_traveltp
  as select from z02_i_travel
  association[0..*] to Z02_I_TRAVELITEMTP as _travelitems on $projection.TravelAgency = _travelitems.TravelAgency and $projection.TravelNumber = _travelitems.TravelNumber

{
      @ObjectModel.readOnly:true
      @ObjectModel.mandatory: true
  key TravelAgency,
      @ObjectModel.readOnly:true
      @ObjectModel.mandatory: true
  key TravelNumber,
      TravelDescription,
      @ObjectModel.mandatory: true
      @ObjectModel.foreignKey.association: '_Customer'
      Customer,
      @ObjectModel.mandatory: true
      StartDate,
      @ObjectModel.mandatory: true
      EndDate,
      @ObjectModel.readOnly:true
      Status,
      @Semantics.systemDateTime.lastChangedAt: true
      ChangedAt,
      @Semantics.user.lastChangedBy: true
      ChangedBy,
      _Customer,
      @ObjectModel.association.type: [ #TO_COMPOSITION_CHILD ]
      _travelitems
}
