import 'package:flutter/material.dart';
import 'package:proyectomovil/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),  // La pantalla Splash que se muestra primero
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navega automáticamente a la siguiente pantalla después de 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Center(  // Centrado de la pantalla
        child: Text(
          'Cargando...',  // Texto opcional mientras se carga
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla Principal"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),  // Icono de notificaciones
            onPressed: () {
              // Acción para incrementar contador de notificaciones u otra
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Coloca los widgets de forma vertical
        children: [
          Expanded(
            child: Center(
              child: Text("¡Bienvenido a la app!"),
            ),
          ),
          // Barra cuadrada en la parte inferior
          Container(
            height: 60.0,  // Altura fija para la barra
            color: Colors.blue,  // Color de la barra
            width: double.infinity,  // Hace que ocupe todo el ancho
            child: Center(
              child: Text(
                "Barra en la parte inferior",  // Texto dentro de la barra
                style: TextStyle(
                  color: Colors.white,  // Color del texto
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

