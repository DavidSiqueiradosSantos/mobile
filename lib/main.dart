import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateful",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nome = "";

  @override
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(title: Text("Olá! "), content: Text(nome),
          actions: [
            TextButton(
                child: Text('Sair'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
            )
          ],);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Atividade Mobile"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite seu nome..."),
                  onChanged: (String str) {
                    setState(() {
                      nome = str;
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      _showDialog(context);
                    },
                    child: const Text("Clique!"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}