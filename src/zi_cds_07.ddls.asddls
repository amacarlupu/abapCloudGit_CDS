@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AVG - Type Convertion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
// Este CDS contiene la logica paa tratar la conversion del del tipo decimal, en campo "total_price"
define view entity zi_cds_07
  as select from /dmo/travel
{
  key travel_id,
      agency_id,
      cast(total_price as abap.dec( 16, 2 )) as total_price,
      currency_code
}
