import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:key_guardmanager/key_guardmanager.dart';

class HomeController extends GetxController {
  int _x = 0;

  int get x => _x;

  RxInt _y = 0.obs;

  RxInt get y => _y;

  RxInt z = 0.obs;

  String checkAuth = 'false';

  void totalXY() {
    z.value = _x + _y.value;
  }

  void increaseX() {
    _x++;
    update();
    print(_x);
  }

  void decreaseX() {
    _x--;
    update();
    print(_x);
  }

  void increaseY() {
    _y.value++;
    if (_y.value > 8) {
      _y.value = 0;
    }
  }

  void decreaseY() {
    _y.value--;
    if (_y.value < 0) {
      _y.value = 8;
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformAuth;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformAuth = await KeyGuardmanager.authStatus;
    } on PlatformException {
      platformAuth = 'Failed to get platform auth.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    checkAuth = platformAuth;
    update();
  }
}
