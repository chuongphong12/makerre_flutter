import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makerre_flutter/models/storage_model.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await _secureStorage.read(key: 'access_token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: false,
      );

  IOSOptions _getIosOptions() => const IOSOptions();

  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(
      key: newItem.key,
      value: newItem.value,
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
  }

  Future<String?> readSecureData(String key) async {
    var readData = await _secureStorage.read(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
    return readData;
  }

  Future<void> deleteSecureData(StorageItem item) async {
    await _secureStorage.delete(
      key: item.key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
  }

  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _secureStorage.containsKey(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
    return containsKey;
  }

  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
  }
}
