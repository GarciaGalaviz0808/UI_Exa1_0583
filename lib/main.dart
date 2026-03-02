import 'package:flutter/material.dart';
import 'mispantallas/Inicio.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';

void main() {
  runApp(const ArtStoreApp());
}

class ArtStoreApp extends StatelessWidget {
  const ArtStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARTSTORE Melanie Garcia',
      theme: ThemeData(primarySwatch: Colors.brown),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/pantalla2': (context) => const Pantalla2(),
        '/pantalla3': (context) => const Pantalla3(),
      },
    );
  }
}