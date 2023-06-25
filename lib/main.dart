import 'package:flutter_authentication_client/screens/home_screen.dart';
import 'package:flutter_authentication_client/screens/login.dart';
import 'package:flutter_authentication_client/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        Login.route: (context) => const Login(),
        Register.route: (context) => const Register(),
        HomeScreen.route: (context) => const HomeScreen(),
      },
      initialRoute: Login.route,
    );
  }
}