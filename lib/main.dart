import 'package:flutter/material.dart';
import 'package:wakala_app/login_screen.dart';
import 'package:wakala_app/wakalas_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn =
      prefs.containsKey('isLoggedIn') ? prefs.getBool('isLoggedIn')! : false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterViz Demo',
      home: isLoggedIn ? WakalasList() : LoginScreen(),
    );
  }
}
