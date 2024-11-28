
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define las rutas de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIVO App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
      // Opcional: Define rutas nombradas
      // routes: {
      //   '/home': (context) => HomeScreen(),
      //   '/register': (context) => RegisterScreen(),
      //   '/welcome': (context) => WelcomeScreen(),
      // },
    );
  }
}
