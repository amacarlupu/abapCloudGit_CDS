@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
//NOT_ALLOWED evita el chekeo sobre autorizacion de datos
@EndUserText.label: 'CDS for Hierarchy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//CDS moderno exige que las asociaciones se definan sobre la proyección, no sobre la fuente.
define view entity ZI_CDS_22
  as select from zemployee_lgl
  association [0..1] to ZI_CDS_22 as _Manager on _Manager.Employee = $projection.Manager
{
  key employee as Employee,
      manager  as Manager,
      nombre   as Nombre,
      _Manager
}
