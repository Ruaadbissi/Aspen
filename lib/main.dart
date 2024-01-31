import 'package:aspen/firebase_options.dart';
import 'package:aspen/home/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue.shade300,
      statusBarColor: Colors.grey,
    ));
    return Sizer(builder:(context,orientation,deviceType)
    {
      return MaterialApp(
        title: "Aspen task",
        debugShowCheckedModeBanner: false,
        home: const homeScreen(),
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: "montserrat",
        ),
      );
    });
  }
}

