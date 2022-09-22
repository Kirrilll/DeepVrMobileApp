import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/stored_data.dart';

class StorageService {
  late SharedPreferences _storage;

  Future<StorageService> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _storage = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setData(StoredData data) async {
    return await _storage.setString('data', data.toJson());
  }

  StoredData? getData() {
    final result = _storage.getString('data');
    return result != null ? StoredData.fromJson(result) : null;
  }

  Future<void> clear() async {
    await _storage.clear();
  }
}
