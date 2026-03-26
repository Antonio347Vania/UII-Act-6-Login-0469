import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const SorianaVaniaApp());
}

class SorianaVaniaApp extends StatelessWidget {
  const SorianaVaniaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soriana Vania',
      theme: ThemeData(useMaterial3: true),
      // Definimos las rutas para navegar sin errores
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const PantallaTienda(),
      },
    );
  }
}

// Esta es la pantalla a la que llegas después del Login
class PantallaTienda extends StatelessWidget {
  const PantallaTienda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7C02F),
        title: const Text("Tienda Soriana Vania"),
      ),
      body: const Center(
        child: Text("¡Bienvenido! Aquí irán tus 14 productos verdes."),
      ),
    );
  }
}