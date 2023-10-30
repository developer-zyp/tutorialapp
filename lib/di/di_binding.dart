import 'package:get/get.dart';

import '../screens/getxstmt/first_controller.dart';
import '../screens/getxstmt/home_controller.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FirstController());
  }
}
