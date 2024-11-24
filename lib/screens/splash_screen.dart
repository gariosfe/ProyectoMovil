import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // La pantalla Splash que se muestra primero
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
      body: Center(
        // Centrado de la pantalla
        child: Text(
          'Cargando...', // Texto opcional mientras se carga
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
        title: Text(" "),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.menuDownOutline),
            onPressed: () {
              // Acción al presionar
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Coloca los widgets de forma vertical
        children: [
          Expanded(
            child: Center(
              child: Text(" "),
            ),
          ),
          // Barra cuadrada en la parte inferior
          Container(
            height: 60.0, // Altura fija para la barra
            color: const Color.fromARGB(255, 208, 184, 118), // Color de la barra
            width: double.infinity, // Hace que ocupe todo el ancho
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuye los íconos uniformemente
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Acción para el icono de menú
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Acción para el icono de favoritos
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo_camera_outlined,
                    size: 36.0, // Aumenta el tamaño del ícono
                  ),
                  onPressed: () {
                    // Acción para el icono de cámara
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_high_rounded),
                  onPressed: () {
                    // Acción para el icono de brillo
                  },
                ),
                IconButton(
                  icon: Icon(Icons.people_sharp),
                  onPressed: () {
                    // Acción para el icono de personas
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
