class AllCurrenciesModel {
  AllCurrenciesModel({
    this.results,
  });

  Map<String, Result>? results;

  factory AllCurrenciesModel.fromMap(Map<String, dynamic> json) => AllCurrenciesModel(
    results: Map.from(json["results"]).map((k, v) => MapEntry<String, Result>(k, Result.fromMap(v))),
  );

  Map<String, dynamic> toMap() => {
    "results": Map.from(results??{}).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
  };
}

class Result {
  Result({
    this.alpha3,
    this.currencyId,
    this.currencyName,
    this.currencySymbol,
    this.id,
    this.name,
  });

  String? alpha3;
  String? currencyId;
  String? currencyName;
  String? currencySymbol;
  String? id;
  String? name;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    alpha3: json["alpha3"],
    currencyId: json["currencyId"],
    currencyName: json["currencyName"],
    currencySymbol: json["currencySymbol"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "alpha3": alpha3,
    "currencyId": currencyId,
    "currencyName": currencyName,
    "currencySymbol": currencySymbol,
    "id": id,
    "name": name,
  };
}
