@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association Filter with Path Expression'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_16_v2
  as select from /dmo/travel
  association [0..*] to I_CurrencyText as _Currency on _Currency.Currency = $projection.Currency
{
  key travel_id     as TravelID,
      @Semantics.amount.currencyCode: 'Currency'
      total_price   as Price,
      currency_code as Currency,
      //      _Currency[ Language = $session.system_language ].CurrencyName
     // Esta forma sobrescrime la cardinalidad del CDS, pero solo afecta a ese campo, no a toda la vista.
      _Currency[1: Language = $session.system_language ].CurrencyName
}
