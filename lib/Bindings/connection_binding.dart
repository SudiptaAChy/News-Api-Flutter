import 'package:get/get.dart';
import 'package:practise/Controller/connectivity_controller.dart';

class ConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityController());
  }
}
