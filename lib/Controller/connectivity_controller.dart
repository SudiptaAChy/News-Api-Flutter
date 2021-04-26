import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var connectionStatus = 0.obs;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectionStatus();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(updateConnectivityStatus);
  }

  Future<void> getConnectionStatus() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateConnectivityStatus(result);
  }

  void updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      connectionStatus.value = 1;
    } else if (result == ConnectivityResult.wifi) {
      connectionStatus.value = 2;
    } else if (result == ConnectivityResult.none) {
      connectionStatus.value = 0;
    } else {
      connectionStatus.value = -1;
    }
  }
}
