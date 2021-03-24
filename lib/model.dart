
class Filme{
  String nome;
  String genero;
  String duracao;
  String sinopse;
  String diretor;
  
    Filme( this.nome,
       this.genero,
       this.duracao,
      this.sinopse,
      this.diretor
      );

    @override
    String toString() {
      return 'Filme{nome: $nome, genero: $genero, duracao: $duracao, sinopse: $sinopse, diretor: $diretor}';
    }

    Filme.fromJson(Map json)
      : nome = json['nome'],
        genero = json['genero'],
        duracao = json['duracao'],
        sinopse = json['sinopse'],
        diretor = json['diretor'];
        
    Map<String, dynamic> toJson() =>
      {
         'nome' : nome,
        'genero' : genero,
        'duracao' : duracao,
        'sinopse' : sinopse,
        'diretor' : diretor,
        'pk' : 0
      };
}