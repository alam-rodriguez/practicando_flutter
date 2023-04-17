import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase.dart';
import 'firebase_options.dart';

// Pages
import 'package:practicando_flutter_con_firebase/pages/home_page.dart';
import 'package:practicando_flutter_con_firebase/pages/login_page.dart';
import 'package:practicando_flutter_con_firebase/pages/add_page.dart';
// import 'package:practicando_flutter_con_firebase/pages/edit_page.dart';
import 'package:practicando_flutter_con_firebase/pages/settings_page.dart';
import 'package:practicando_flutter_con_firebase/pages/view_note_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await logearUsuarioAutomaticamente().then((value) {
  //   final email = devuelveEmail();
  //   print(email);
  // });

  var email;
  await FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if(user != null){
      // print(user.email);
      email = user.email;
      // print(email);
    }else {
      email = 'ninguno';
    }
  });

  List data = await getData(email);
  // print(data);

  // runApp(MyApp(email: email, data: data));
  runApp(MyApp(email: email));
}

class MyApp extends StatelessWidget {

  String email;
  // List data;
  //  Map<String, dynamic> data;

  MyApp({
    super.key, 
    required this.email, 
    // required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacticando',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ), 
      initialRoute: email == 'ninguno' ? '/login' : '/home',
      routes: {
        '/login':(context) => Login(),
        '/home':(context) => HomePages(email: email),
        '/settings':(context) => const SettingsPage(),
        '/add':(context) => AddPage(email: email),
        // '/view':(context) => ViewPage(),
      },
    );
  }
}



