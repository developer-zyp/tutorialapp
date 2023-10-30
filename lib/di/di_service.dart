import 'package:get/get.dart';
import 'package:tutorialapp/network/api/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:tutorialapp/repository/country_repository.dart';
import 'package:tutorialapp/screens/getxstmt/first_controller.dart';
import 'package:tutorialapp/screens/getxstmt/home_controller.dart';

Future<void> init() async {
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true, logPrint: (log) => print(log)));
  Get.lazyPut(() => ApiService(dio));
  Get.lazyPut<CountryRepository>(() => CountryRepository(apiService: Get.find()));
}
