import 'package:d92_shift/firebase_options.dart';
import 'package:d92_shift/pages/new_schedule_page.dart';
import 'package:d92_shift/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    // Get.put(AuthController());
  });

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D92 Shift',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      home: NewSchedulePage(),
    );
  }
}
