import 'package:hive_app/model/user.dart';
import 'package:hive_flutter/adapters.dart';

class AppStorage {
  static Future<void> appStorageInitialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    await Hive.openBox('local_box');
  }

  static final Box localBox = Hive.box('local_box');
}
