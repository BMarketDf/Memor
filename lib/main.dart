import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newproject/page/Creat.dart';
import 'package:newproject/page/Det.dart';
import 'package:newproject/page/Dommend.dart';
import 'package:newproject/page/Done.dart';
import 'package:newproject/page/First.dart';
import 'package:newproject/page/Login.dart';
import 'package:newproject/page/Sing.dart';
import 'package:newproject/page/Swit.dart';
import 'package:newproject/page/masseg.dart';

bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    islogin = true;
  } else {
    islogin = false;
  }
     runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: islogin == false ? '/' : '/Swit',
      routes: {
        '/': (context) => const First(),
        '/LogIn': (context) => const LogIn(),
        '/Creat': (context) => const Creat(),
        '/Sing': (context) => const Sing(),
        '/Done': (context) => const Done(),
        '/Swit': (context) => const Swit(),
        '/Det': (context) => const Det(),
        '/Dommend': (context) => const Dommend(), 
        '/masseg': (context) => masseg(),
      },
    );
  }
}
