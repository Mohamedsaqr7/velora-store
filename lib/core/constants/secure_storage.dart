import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  factory SecureStorage() {
    return secureStorage;
  }
  SecureStorage._internal();
  static final SecureStorage secureStorage = SecureStorage._internal();
  static late FlutterSecureStorage flutterSecureStorage;
  // final FlutterSecureStorage storage = const FlutterSecureStorage();
  var storage = const FlutterSecureStorage();

  /// Saves a [value] with a [key] in the FlutterSecureStorage.

  Future<void> writeSecureData(String key, String value) async {
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await storage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].

  getSecureData(String key) async {
    String value = await storage.read(key: key) ?? 'No data found!';
    debugPrint('Data read from secure storage: $value');
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
