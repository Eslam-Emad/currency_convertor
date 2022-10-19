/// this is our main endpoints
/// we don't uses it by it's own instead use it with other requests
const String baseEndpoint = "https://free.currconv.com/api/v7/";

/// api key is the key that should sent with every request ,
/// that related to our [baseEndpoint]
const String apiKey = "c595f9fd05afe18bffd5";
const String allCountriesEndpoint = "${baseEndpoint}countries?apiKey=$apiKey";

/// [currencyHistoryEndpoint]
/// endpoint that returnn list of historical data for two currencies
/// [startDate] to select start date
/// [endDate] to select end date
/// notice : "the difference between [startDate] & [endDate] should not be more than 7 days"
/// the shape of [adversariesCurrencies] should be like:
///  "firstCurrency_secondCurrency" -> "EPG_USD"
String currencyHistoryEndpoint(
        {required String startDate,
        required String endDate,
        required String adversariesCurrencies}) =>
    "${baseEndpoint}convert?q=$adversariesCurrencies&compact=ultra&date=$startDate&endDate=$endDate&apiKey=$apiKey";

/// endpoint to convert between two currencies
/// the shape of [adversariesCurrencies] should be like:
///  "firstCurrency_secondCurrency" -> "EPG_USD"
String currencyConvertEndpoint(String adversariesCurrencies) =>
    "${baseEndpoint}convert?q=$adversariesCurrencies&compact=ultra&apiKey=$apiKey";
