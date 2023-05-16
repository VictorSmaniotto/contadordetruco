import 'home_page.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp],
  // ); // Define a orientação para retrato (portrait)
  runApp(
    const MaterialApp(
        title: 'Contador de Truco',
        debugShowCheckedModeBanner: false,
        home: HomePage()),
  );
}
