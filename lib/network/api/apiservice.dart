import 'package:retrofit/retrofit.dart';
import 'package:tutorialapp/model/country/Country.dart';
import 'package:tutorialapp/network/api_constants.dart';
import 'package:dio/dio.dart';

part 'apiservice.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET(ApiConstants.allCountriesEndPoint)
  Future<List<Country>> getAllCountries();


}
