import 'package:get/get.dart';

class FirstController extends GetxController {
  RxList _list = [].obs;

  RxList get list => _list;

  void setValue(int value) {
    _list.add(value);
    print(_list);
  }
}
