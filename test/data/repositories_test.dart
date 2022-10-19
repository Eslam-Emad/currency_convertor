import 'package:currency_converter/data/model/all_currencies_model.dart';
import 'package:currency_converter/data/repositories/currencies_repository.dart';
import 'package:currency_converter/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  CurrenciesRepository? sut;
  setUpAll(() async {
    await setup();
  });
  setUp(() {
    sut = CurrenciesRepository(sl(), sl(), sl());
  });

  group("test get all currencies ", () {
    test("check data return as AllCurrenciesModel ", () async {
      final data = await sut?.getAllCurrencies();
      expect(data, isA<AllCurrenciesModel>());
    });

    test("check data values in not empty   ", () async {
      final data = await sut?.getAllCurrencies();
      data as AllCurrenciesModel;
      expect(data.results?.values, isNotEmpty);
    });

    test("check that getAllCurrencies function called once", () async {
      final data = await sut?.getAllCurrencies();
      expect(data.results?.values.length, data.results?.keys.length);
    });
  });

  group("test currency convertor ", () {
    test("check currency converted and returned correctly ", () async {
      final data = await sut?.convertCurrency("EGP", "USD");
      expect(data, isA<String>());
    });

    test("test different currency ", () async {
      final data = await sut?.convertCurrency("EGP", "KWD");
      expect(data, isNotEmpty);
    });

    test("test fail case ", () async {
      expect(() async => await sut?.convertCurrency("EG", "KWD"),
          throwsA(isA<String>()));
    });
  });

  group("test currency historical data ", () {
    test("check return historical data ", () async {
      final data = await sut?.getHistoricalCurrency(
        startDate: "2022-09-25",
        endDate: "2022-10-1",
        adversariesCurrencies: "USD_EGP",
      );
      expect(data, isA<Map>());
    });
  });
}
