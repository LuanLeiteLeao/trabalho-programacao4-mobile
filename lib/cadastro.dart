import 'package:flutter/material.dart';
import 'package:mercado/model.dart';
import 'package:mercado/API.dart';
import 'package:mercado/main.dart';

//void main() => runApp(MyApp());

class Cadastro extends StatefulWidget {
  Cadastro({Key key}) : super(key:key);

  @override
   _CadastroState createState() => _CadastroState();

}
  
  class _CadastroState extends State<Cadastro>{
    
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorGenero = TextEditingController();
  final TextEditingController _controladorDuracao = TextEditingController();
  final TextEditingController _controladorSinopse = TextEditingController();
  final TextEditingController _controladorDiretor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Filme'),
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(icon:Icon(Icons.live_tv_rounded), labelText: 'Nome'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorGenero,
                  decoration: InputDecoration(icon:Icon(Icons.folder),labelText: 'Gênero'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorDuracao,
                  decoration: InputDecoration( icon: Icon(Icons.schedule),labelText: 'Duração'),
                  keyboardType: TextInputType.number,
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorSinopse,
                  decoration: InputDecoration(icon:Icon(Icons.comment),labelText: 'Sinopse'),
                  maxLines: null,
                  keyboardType: TextInputType.multiline
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorDiretor,
                  decoration: InputDecoration(icon: Icon(Icons.movie),labelText: 'Diretor'),
                  maxLines: null,
                  keyboardType: TextInputType.multiline
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text('Cadastrar'),
                  onPressed: () {
                    salvar();
                   Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );         
                  },
                ),
              ),
            ],
          ),
        ),
     
    );
  }

  void salvar() {
    final String nome = _controladorNome.text;
    final String genero =  _controladorGenero.text; 
    final String duracao =   _controladorDuracao.text;
    final String sinopse =   _controladorSinopse.text; 
    final String diretor =  _controladorDiretor.text; 
    
    final Filme produtoNovo =  Filme(nome, genero, duracao,sinopse,diretor);
    
    print("--------------------------->");  
    API.postFilmes(produtoNovo);  
    
  }


  }
 
