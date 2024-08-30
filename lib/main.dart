import 'package:flutter/material.dart';
import 'package:qr_code/pages/createqr.dart';
import 'package:qr_code/pages/homepage.dart';
import 'package:qr_code/pages/scanqr.dart';
import 'package:qr_code/pages/splashpage.dart';

void main() {

  var app = MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: "splash_page",
    routes: {
      'splash_page': (context) => const Splashpage(),
      'home_page': (context) => const Homepage(),
      'scanqr': (context) => const ScanQr(),
      'createqr': (context) => const CreateQr(),
    },

    title: "QR Code Scanner",

    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 224, 159, 236),
            brightness: Brightness.dark
        ),
    ),

    home: const Homepage(),

  );

  runApp(app);

}