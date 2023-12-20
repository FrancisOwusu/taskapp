import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/src/app.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  //Todo: Add Widgets Binding
  //Todo: Init Local Storage
  //Todo: Await Native Splash
  //Tod: Initialize Firebase
  //Todo: Initialize Authentication

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  GetStorage.init();
  runApp(const MyApp());
}
