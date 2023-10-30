import 'package:tutorialapp/network/api/apiservice.dart';

import '../model/country/Country.dart';

class CountryRepository {
  ApiService apiService;

  CountryRepository({required this.apiService});

  Future<List<Country>> getAllCountries() => apiService.getAllCountries();
}
