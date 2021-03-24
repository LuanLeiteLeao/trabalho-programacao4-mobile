// import 'package:flutter/material.dart';
// import 'package:mercado/cadastro.dart';
// import 'package:mercado/model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
   
//    var filme = <Filme>[]; 

//   void callApis(){
//   http.get("http://localhost:8080/crudGamesBackEnd/api?casoDeUso=ManterFilme").then((result){
    
    
//      Iterable lista = json.decode(result.body);
//      filme = lista.map((model) => Filme.fromJson(model)).toList();

//     print(filme);
//   });
// }
// // Future<Filme> fetchAlbum() async {
// //   final response = await http.get('localhost:8080/crudGamesBackEnd/api?casoDeUso=ManterFilme');

// //   if (response.statusCode == 200) {
// //     // If the server did return a 200 OK response,
// //     // then parse the JSON.
// //     print("----------------->");
// //     print(jsonDecode(response.body));
// //     print("----------------->");
// //     // return Filme.fromJson(jsonDecode(response.body));
// //   } else {
// //     // If the server did not return a 200 OK response,
// //     // then throw an exception.
// //     throw Exception('Failed to load album');
// //   }
// // }
//   @override
//   Widget build(BuildContext context) {
//     this.callApis();
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:()=> Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Cadastro()),
//         ),
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }




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
           leading: CircleAvatar(
             backgroundImage: NetworkImage( 'data:image/jpeg;base64,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'),),
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