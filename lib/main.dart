import 'package:flutter/material.dart';
import 'package:mercado/cadastro.dart';
import 'package:mercado/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void callApis(){
  http.get("http://localhost:8080/crudGamesBackEnd/api?casoDeUso=ManterFilme").then((result){
    print(result.body);
  });
}
// Future<Filme> fetchAlbum() async {
//   final response = await http.get('localhost:8080/crudGamesBackEnd/api?casoDeUso=ManterFilme');

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print("----------------->");
//     print(jsonDecode(response.body));
//     print("----------------->");
//     // return Filme.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
  @override
  Widget build(BuildContext context) {
    this.callApis();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cadastro()),
        ),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
