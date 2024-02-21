import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'secondscreen.dart';
import 'InterfaceCamera.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ajustes",
      home: MyCustomNavigator(),
    );
  }
}

class MyCustomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text("Configuración"),
                        centerTitle: false,
                      ),
                      body: ListView(
                        children: <Widget>[
                          CardInterface1(),
                          espaciado1_main(),
                          CardInterface2(),
                          espaciado2_main(),
                          CardInterface3(),
                          espaciado3_main(),
                          CardInterface4(),
                        ],
                      ),
                    ));
          case '/camera':
            return MaterialPageRoute(
                builder: (context) => InterfaceCamera(cameras: cameras));
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
      },
    );
  }
}

class CardInterface1 extends StatelessWidget {
  const CardInterface1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      width: 30,
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.person,
                size: 30,
              ),
              title: Text("Miguel Ángel"),
              subtitle: Text("Apple ID, iCloud+, compras y más"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            ListTile(
              leading: Icon(
                Icons.family_restroom,
                size: 30,
              ),
              title: Text("Familia"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            // IconButton(
            //   icon: Icon(Icons.abc),
            // )
          ],
        ),
      ),
    );
  }
}

class espaciado1_main extends StatelessWidget {
  const espaciado1_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      width: 30,
    );
  }
}

class CardInterface2 extends StatelessWidget {
  const CardInterface2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.only(bottom: 2.0, right: 15.0, left: 12.0),
      width: 30,
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.airplanemode_active,
                size: 30,
              ),
              title: Text("Modo vuelo"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.wifi,
                size: 30,
              ),
              title: Text("Wi-Fi"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.bluetooth,
                size: 30,
              ),
              title: Text("Bluetooth"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.signal_cellular_alt,
                size: 30,
              ),
              title: Text("Red celular"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class espaciado2_main extends StatelessWidget {
  const espaciado2_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      width: 30,
    );
  }
}

class CardInterface3 extends StatelessWidget {
  const CardInterface3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.notifications,
                size: 30,
              ),
              title: Text("Notificaciones"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.vibration,
                size: 30,
              ),
              title: Text("Sonidos y vibración"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.nightlight_round,
                size: 30,
              ),
              title: Text("Enfoque"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.hourglass_empty,
                size: 30,
              ),
              title: Text("Tiempo en pantalla"),
              trailing: Icon(Icons.navigate_next, size: 30),
            )
          ],
        ),
      ),
    );
  }
}

class espaciado3_main extends StatelessWidget {
  const espaciado3_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      width: 30,
    );
  }
}

class CardInterface4 extends StatelessWidget {
  const CardInterface4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text("General"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.toggle_on,
                size: 30,
              ),
              title: Text("Centro de control"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.brightness_4,
                size: 30,
              ),
              title: Text("Pantalla y brillo"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.apps,
                size: 30,
              ),
              title: Text("Pantalla de inicio y biblioteca de apps"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.accessibility,
                size: 30,
              ),
              title: Text("Accesibilidad"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.stream,
                size: 30,
              ),
              title: Text("Fondo de pantalla"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.search,
                size: 30,
              ),
              title: Text("Siri y Buscar"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            const ListTile(
              leading: Icon(
                Icons.fullscreen,
                size: 30,
              ),
              title: Text("Face ID y código"),
              trailing: Icon(Icons.navigate_next, size: 30),
            ),
            ListTile(
              leading: Icon(
                Icons.hearing,
                size: 30,
              ),
              title: Text("Ear ID y código"),
              trailing: Icon(Icons.navigate_next, size: 30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
