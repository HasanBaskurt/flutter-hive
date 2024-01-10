import 'package:flutter/material.dart';
import 'package:hive_app/app_storage.dart';
import 'package:hive_app/view/home.dart';

void main() async {
  await AppStorage.appStorageInitialize();
  runApp(const HiveApp());
}

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: Home());
  }
}
