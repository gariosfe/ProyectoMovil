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

          // Rectángulo superior con el logo a la izquierda y el buscador
          Container(
            height: 50.0,
            color: const Color.fromARGB(255, 208, 184, 118),
            width: double.infinity,
            child: Center(
              child: Container(
                height: 25.0,
                width: 300.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,  // Alineación a la izquierda
                  children: [
                    // Logo completamente a la izquierda
                    Padding(
                      padding: EdgeInsets.only(left: 0.0),  // Sin espacio adicional
                      child: Image.asset(
                        'assets/logo.png', // Ruta de la imagen
                        width: 30.0, // Tamaño del logo
                        height: 30.0,
                        fit: BoxFit.contain, // Ajuste para respetar el aspecto
                      ),
                    ),
                    // Campo de búsqueda
                    Expanded(
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
                  ],
                ),
              ),
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
            color: const Color.fromARGB(255, 208, 184, 118),
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
