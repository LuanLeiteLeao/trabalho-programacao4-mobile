
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

    
  // factory Filme.fromJson(Map<String, dynamic> json) {
  //   return Filme(
  //      nome: json['nome'],
  //      genero: json['genero'],
  //      duracao: json['duracao'],
  //      sinopse: json['sinopse'],
  //      diretor: json['diretor'],
  //   );
  // }

    @override
    String toString() {
      return 'Filme{nome: $nome, genero: $genero, duracao: $duracao, sinopse: $sinopse, diretor: $diretor}';
    }
}