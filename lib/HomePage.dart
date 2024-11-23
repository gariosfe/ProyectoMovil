import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),  // Pantalla principal
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _notificationCount = 3;  // Contador de notificaciones

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla Principal"),
        actions: [
          // IconButton de notificación sin Badge
          IconButton(
            icon: Icon(Icons.notifications),  // Icono de notificaciones
            onPressed: () {
              setState(() {
                _notificationCount++;  // Incrementa el contador de notificaciones
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Coloca los widgets de forma vertical
        children: [
          // Contenido principal en la parte superior
          Expanded(
            child: Center(
              child: Text("¡Bienvenido a la app!"),
            ),
          ),
          // Barra cuadrada en la parte inferior
          Container(
            height: 60.0,  // Altura fija para la barra
            color: const Color.fromARGB(255, 214, 204, 149),  // Color de la barra
            width: double.infinity,  // Hace que ocupe todo el ancho
            child: Center(
              child: Text(
                "Barra en la parte inferior",  // Texto dentro de la barra
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),  // Color del texto
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
