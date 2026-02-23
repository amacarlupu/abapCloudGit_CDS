@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_05
  as select from /dmo/travel
{
  key travel_id                  as TravelId,
      cast('' as abap.numc( 4 )) as BookingID
}

//union select distinct /dmo/booking --> Para no traer repetidos.
union select from /dmo/booking
{
  key travel_id  as TravelId,
      booking_id as BookingId
}
