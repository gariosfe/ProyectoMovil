import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, ThemeMode currentMode, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: HomePage(
            onToggleTheme: () {
              _themeNotifier.value = _themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  HomePage({required this.onToggleTheme});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _notificationCount = 3;  // Contador de notificaciones

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
        actions: [
          // IconButton de notificación
          IconButton(
            icon: Icon(Icons.notifications),  // Icono de notificaciones
            onPressed: () {
              setState(() {
                _notificationCount++;  // Incrementa el contador de notificaciones
              });
            },
          ),
          // IconButton para cambiar entre tema claro y oscuro
          IconButton(
            icon: Icon(Icons.brightness_6),  // Ícono de cambio de tema
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Coloca los widgets de forma vertical
        children: [
          // Contenido principal en la parte superior
          Expanded(
            child: Center(
              child: Text(" "),
            ),
          ),
          // Barra cuadrada en la parte inferior
          Container(
            height: 60.0,  // Altura fija para la barra
            color: const Color.fromARGB(255, 214, 204, 149),  // Color de la barra
            width: double.infinity,  // Hace que ocupe todo el ancho
            child: Center(
              child: Text(
                " ",  // Texto dentro de la barra
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
