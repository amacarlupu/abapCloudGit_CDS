@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_14
  with parameters
    pCountryCode : land1
  as select from /dmo/travel as Travel

  association [1..1] to zi_cds_13 as _Agency on _Agency.AgencyId = $projection.AgencyId
{
  key travel_id                                             as TravelId,
      Travel.agency_id                                      as AgencyId,
      //      _Agency(pCountryCode: 'US').Name as AgencyName
      _Agency(pCountryCode: $parameters.pCountryCode ).Name as AgencyName
}
