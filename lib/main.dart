import 'dart:convert';
import 'package:mercado/API.dart';
import 'package:mercado/model.dart';
import 'package:flutter/material.dart';
import 'package:mercado/cadastro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var filme =  <Filme>[];

  _getFIlme() {
    API.getFilmes().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        filme = list.map((model) => Filme.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getFIlme();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Filmes"),
        ),
        body: ListView.builder(
          itemCount: filme.length,
          itemBuilder: (context, index) {
             return ListTile(
           leading: CircleAvatar(),
           title: Text(filme[index].nome, style: TextStyle(fontSize: 20.0, color: Colors.black)),
           subtitle: Text(filme[index].diretor),
        );

            // return ListTile(title: Text(filme[index].nome));
          },
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