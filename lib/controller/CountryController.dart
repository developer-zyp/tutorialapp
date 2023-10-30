import 'package:get/get.dart';
import 'package:tutorialapp/model/country/Country.dart';
import 'package:tutorialapp/repository/country_repository.dart';

class CountryController extends GetxController {
  CountryRepository repo;

  CountryController({required this.repo});

  List<Country> countryList = [];

  Future<void> loadCountryList() async {
    countryList = await repo.getAllCountries();
  }
}
