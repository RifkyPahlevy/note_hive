import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:note_hive/app/data/database/database.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(NotesAdapter());

  await Hive.openBox<Notes>("notes");
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
