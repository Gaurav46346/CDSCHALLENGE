@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Base View'
define view entity ZR_TRAVEL_BASE_GA
  as select from zga_travel
  association [0..1] to /DMO/I_Overall_Status_VH as _Status on $projection.Status = _Status.OverallStatus
{
  key travel_id                                                                     as TravelId,
      description                                                                   as Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price                                                                   as TotalPrice,
      currency_code                                                                 as CurrencyCode,
      concat_with_space( cast( total_price as abap.char( 25 ) ), currency_code, 1 ) as PriceWithCurrency,
      status                                                                        as Status,
      @Semantics.text: true
      _Status._Text.Text                                                            as OverallStatusText
}
