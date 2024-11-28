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
          home: SplashScreen(
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

class SplashScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  SplashScreen({required this.onToggleTheme});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(onToggleTheme: widget.onToggleTheme),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Cargando...',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),

          // Rectángulo superior con el logo a la izquierda, el buscador y el botón de tema
          Container(
            height: 50.0,
            color: const Color.fromARGB(255, 241, 236, 138),
            width: double.infinity,
            child: Row(
              children: [
                // Logo completamente a la izquierda
                Padding(
                  padding: EdgeInsets.only(left: 10.0), // Espaciado a la izquierda
                  child: Image.asset(
                    'assets/logo.png', // Ruta de la imagen
                    width: 30.0, // Tamaño del logo
                    height: 30.0,
                    fit: BoxFit.contain, // Ajuste para respetar el aspecto
                  ),
                ),
                // Campo de búsqueda
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(75, 0, 0, 0),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                // Botón para alternar el tema
                IconButton(
                  icon: Icon(Icons.brightness_6), // Ícono para cambiar tema
                  onPressed: widget.onToggleTheme,
                ),
              ],
            ),
          ),

          // Lista de items con su descripción
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Número de items en la lista
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  elevation: 4.0,
                  child: ListTile(
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Descripción del item ${index + 1}'),
                    leading: Icon(MdiIcons.package), // Ícono para cada item
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      // Acción al presionar el item
                    },
                  ),
                );
              },
            ),
          ),

          // Barra inferior con los iconos
          Container(
            height: 60.0,
            color: const Color.fromARGB(255, 241, 236, 138),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo_camera_outlined,
                    size: 36.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.brightness_high_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.people_sharp),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
