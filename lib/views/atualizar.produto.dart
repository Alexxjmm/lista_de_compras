import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_compras/models/produto.model.dart';
import 'package:lista_compras/repositories/produto.repository.dart';

class AtualizarProduto extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _produto = Produto();
  final _repository = ProdutoRepository();

  onSave(BuildContext context, Produto produto) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); // ~ submit do form do HTML
      _repository.update(_produto, produto);
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Produto produto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Produto",
                border: OutlineInputBorder(),
              ),
              initialValue: produto.name,
              onSaved: (value) => _produto.name = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Quantidade",
                border: OutlineInputBorder(),
              ),
              initialValue: produto.quantidade,
              onSaved: (value) => _produto.quantidade = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            TextButton.icon(
              label: Text("Atualizar"),
              onPressed: () => onSave(context, produto),
              icon: Icon(Icons.add),
            ),
          ]),
        ),
      ),
    );
  }
}
