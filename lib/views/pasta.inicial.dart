import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_compras/models/produto.model.dart';
import 'package:lista_compras/repositories/produto.repository.dart';

class PastaInicial extends StatefulWidget {
  @override
  _PastaInicialState createState() => _PastaInicialState();
}

class _PastaInicialState extends State<PastaInicial> {
  final repository = ProdutoRepository();
  List<Produto> produtos;

  @override
  initState() {
    super.initState();
    this.produtos = repository.read();
  }

  Future adicionarProduto(BuildContext context) async {
    var result = await Navigator.of(context).pushNamed("/novo");
    if (result == true) {
      setState(() {
        this.produtos = repository.read();
      });
    }
  }

  Future atualizarProduto(BuildContext context, Produto produto) async {
    var result =
        await Navigator.of(context).pushNamed("/atualizar", arguments: produto);
    if (result == true) {
      setState(() {
        this.produtos = repository.read();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        title: Text("Lista de compras"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (_, indice) {
            var produto = produtos[indice];
            return Dismissible(
              key: Key(produto.name),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (_) => repository.delete(produto.name),
              child: Column(children: [
                CheckboxListTile(
                  title: Text(
                    produto.name,
                    style: TextStyle(
                      decoration: produto.finalizado
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(produto.quantidade),
                  value: produto.finalizado,
                  onChanged: (value) {
                    setState(() => produto.finalizado = value);
                  },
                ),
                TextButton(
                  onPressed: () => atualizarProduto(context, produto),
                  child: Text(
                    "Editar",
                    style: TextStyle(color: Colors.green[300]),
                  ),
                )
              ]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => adicionarProduto(context),
      ),
    );
  }
}
