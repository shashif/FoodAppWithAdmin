import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home_screen/home_screen.dart';
import 'package:food_app/widgets/color_widget.dart';
import 'package:provider/provider.dart';

import 'auth/sing_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
    ChangeNotifierProvider<ProductProvider>(create: (context)=>ProductProvider(),),
    ChangeNotifierProvider<UserProvider>(create: (context)=>UserProvider(),),
    ],

    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    ),
    home: HomeScreen(),
    // home: SingIn(),
    )
    ,
    );
  }
}
