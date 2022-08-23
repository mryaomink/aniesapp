import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mdc_anies/view/screens/section/widgets/yao_nav.dart';

import 'controller/google_sheet.dart';

void main() async {
  await GoogleSheet.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDOFVsSG61u_DjgM6SFk6Ux4NMpfv9d8ew",
      appId: "1:30330903530:web:6ac521389147e98bfc3093",
      messagingSenderId: "30330903530",
      projectId: "anies-dpw",
      storageBucket: "anies-dpw.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Media Center Anies Baswedan',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: const YaoNav());
  }
}
