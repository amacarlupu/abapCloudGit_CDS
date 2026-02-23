@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Quantity Conversion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_09
  with parameters
    pFromUnit : abap.unit,
    pToUnit   : abap.unit

  as select from zqty_lgl_am
{
  key product             as Product,
      @Semantics.quantity.unitOfMeasure: 'OriginalUnit'
      quantity            as OriginalQuantity,
      unit                as OriginalUnit,

      @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
      unit_conversion( quantity       => quantity,
      //                       source_unit    => unit,
      //                       target_unit    => abap.unit'MI',
                       source_unit    => $parameters.pFromUnit,
                       target_unit    => $parameters.pToUnit,
                       error_handling => 'SET_TO_NULL',
                       client         => $session.client
                        ) as ConvertedQuantity,

      abap.unit'MI'       as ConvertedUnit
}
where
  unit = $parameters.pFromUnit;
