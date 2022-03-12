import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simply_tasking/pages/home_page.dart';
//import 'package:get_storage/get_storage.dart';
//import 'package:simply_tasking/utilities/theme_changer.dart';
import 'package:simply_tasking/utilities/themes.dart';
import 'package:sqflite/sqflite.dart';

import 'database/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDatabase();
  await GetStorage.init();
  runApp(const SimplyTasking());
}

class SimplyTasking extends StatelessWidget {
  const SimplyTasking({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simply Tasking',
      debugShowCheckedModeBanner: false, // removing the debug banner
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
