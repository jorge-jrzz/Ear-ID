import 'package:flutter/material.dart';
import 'InterfaceCamera.dart';
import 'main.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ajustes",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ear ID y código"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            IconEar(),
            CardInterface1(),
            Espaciado1(),
            CardInterface2(),
          ],
        ),
      ),
    );
  }
}

class IconEar extends StatelessWidget {
  const IconEar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        child: Icon(
          Icons.hearing,
          size: 80,
        ),
      ),
    );
  }
}

class CardInterface1 extends StatelessWidget {
  const CardInterface1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      width: 30,
      child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.phone_iphone,
                size: 30,
              ),
              title: Text("Desbloquear el Dispostivo"),
              trailing: Icon(Icons.toggle_off, size: 30),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance,
                size: 30,
              ),
              title: Text("BEBA"),
              trailing: Icon(Icons.toggle_off, size: 30),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet,
                size: 30,
              ),
              title: Text("Cartera y Apple Pay"),
              trailing: Icon(Icons.toggle_off, size: 30),
            )
          ])),
    );
  }
}

class Espaciado1 extends StatelessWidget {
  const Espaciado1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
      height: 65,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      width: 30,
      child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
              title: Text("Agregar oreja", style: TextStyle(fontSize: 18.0)),
              textColor: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InterfaceCamera(cameras: cameras)),
                );
              },
            ),
          ])),
    );
  }
}
