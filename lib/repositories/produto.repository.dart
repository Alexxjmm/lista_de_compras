import 'package:lista_compras/models/produto.model.dart';

class ProdutoRepository {
  static List<Produto> produtos = List<Produto>();

  ProdutoRepository() {
    if (produtos.isEmpty) {
      produtos.add(Produto(id: "1", name: "Chocolate", quantidade: "1"));
      produtos.add(Produto(id: "2", name: "Pão", quantidade: "1"));
      produtos.add(Produto(id: "3", name: "Coca", quantidade: "1"));
    }
  }

  void create(Produto produto) {
    produtos.add(produto);
  }

  List<Produto> read() {
    return produtos;
  }

  void delete(String texto) {
    final produto = produtos.singleWhere((p) => p.name == texto);
    produtos.remove(produto);
  }

  void update(Produto novoProduto, Produto velhoProduto) {
    final produto = produtos.singleWhere((p) => p.name == velhoProduto.name);

    produto.name = novoProduto.name;
    produto.quantidade = novoProduto.quantidade;
    produto.finalizado = novoProduto.finalizado;
  }
}
