code biblioteca.dart
/// Classe que representa um Livro.
class Livro {
  String id; // Identificador único do livro
  String titulo; // Título do livro
  String autor; // Autor do livro
  int anoPublicacao; // Ano de publicação do livro
  String genero; // Gênero do livro
  /// Construtor da classe Livro.
  Livro(this.id, this.titulo, this.autor, this.anoPublicacao, this.genero);
  /// Método para exibir as informações do livro de forma organizada.
  @override
  String toString() {
    return 'ID: $id\nTítulo: $titulo\nAutor: $autor\nAno de Publicação: $anoPublicacao\nGênero: $genero\n';
  }
}
/// Classe que representa uma biblioteca virtual.
class Biblioteca {
  List<Livro> livros = []; // Lista de livros na biblioteca

  /// Método para cadastrar novos livros na biblioteca.
  void cadastrarLivro(Livro livro) {
    livros.add(livro);
    print('Livro cadastrado: ${livro.titulo}');
  }
  /// Método para remover livros com base em um critério (título, autor ou ID).
  void removerLivro(String criterio) {
    // Contando quantos livros seriam removidos
    int removidos = livros
        .where((livro) =>
            livro.titulo == criterio ||
            livro.autor == criterio ||
            livro.id == criterio)
        .length;
    // Removendo os livros que correspondem ao critério
    livros.removeWhere((livro) =>
        livro.titulo == criterio ||
        livro.autor == criterio ||
        livro.id == criterio);

    if (removidos > 0) {
      print('Livro(s) removido(s) com o critério: $criterio');
    } else {
      print('Nenhum livro encontrado para remover com o critério: $criterio');
    }
  }
  /// Método para listar todos os livros disponíveis na biblioteca.
  void listarLivros() {
    if (livros.isEmpty) {
      print('Nenhum livro disponível na biblioteca.');
      return;
    }
    print('Livros disponíveis na biblioteca:\n');
    for (var livro in livros) {
      print(livro);
    }
  }
}
/// Função principal onde a execução do programa começa.
void main() {
  // Criando uma instância da biblioteca
  Biblioteca biblioteca = Biblioteca();
  // Cadastrando alguns livros
  biblioteca.cadastrarLivro(Livro(
      '1', 'Psicologia das Cores', 'Eva  Heller', 2013, 'Ciências Sociais'));
  biblioteca.cadastrarLivro(Livro(
      '2',
      'Reading Images: the grammar of visual desing',
      'Gunther Kress and Theo van Leeuwen',
      2006,
      'Gramática'));
  biblioteca.cadastrarLivro(
      Livro('3', 'Dom Casmurro', 'Machado de Assis', 1899, 'Romance'));
  biblioteca.cadastrarLivro(Livro('4', 'Abusado: o dono do morro Dona Marta',
      'Caco Barcellos', 2003, 'Jornalismo literário'));
  // Listando livros
  biblioteca.listarLivros();
  // Removendo um livro
  biblioteca.removerLivro('Dom Casmurro');
  // Listando livros novamente
  biblioteca.listarLivros();
  // Tentando remover um livro que não existe
  biblioteca.removerLivro('Não Existe');
}
