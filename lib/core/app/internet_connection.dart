// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// enum NetworkStatus { none, mobile, wifi }

// class ConnectivityController {
//   ConnectivityController._();
//   static final ConnectivityController instance = ConnectivityController._();
//   ValueNotifier<bool> isConnected = ValueNotifier(false);
//   final Connectivity _connectivity = Connectivity();
//   Future<void> init() async {
//     final result = await _connectivity.checkConnectivity();
//     isInternetConnected(result);
//     _connectivity.onConnectivityChanged.listen(isInternetConnected);
//   }

//   bool isInternetConnected(List<ConnectivityResult> result) {
//     if (result.contains(ConnectivityResult.mobile) ||
//         result.contains(ConnectivityResult.wifi)) {
//       isConnected.value = true;
//       return true;
//     }
//     return false;
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker {
  factory InternetChecker() => instance;
  InternetChecker._();
  static final InternetChecker instance = InternetChecker._();
  StreamSubscription<InternetStatus>? _subscription;
// ignore: lines_longer_than_80_chars
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>.broadcast();
  Stream<bool> get onConnectionChange => _connectionStatusController.stream;
  Future<void> init() async {
    _subscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      final hasInternet = status == InternetStatus.connected;
      _connectionStatusController.add(hasInternet);
    });
  }

  void dispose() {
    _subscription?.cancel();
    _connectionStatusController.close();
  }
}
