@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Object Reference'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_04
  as select from /dmo/flight
{
  key carrier_id    as CarrierId,
  key connection_id as ConnectionId,
  key flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price         as Price,
      currency_code as CurrencyCode
}
