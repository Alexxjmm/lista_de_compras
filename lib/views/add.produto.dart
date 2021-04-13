import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_compras/models/produto.model.dart';
import 'package:lista_compras/repositories/produto.repository.dart';

class AddProduto extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _produto = Produto();
  final _repository = ProdutoRepository();

  onSave(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); // ~ submit do form do HTML
      _repository.create(_produto);
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Produto"),
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
              onSaved: (value) => _produto.name = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Quantidade",
                border: OutlineInputBorder(),
              ),
              onSaved: (value) => _produto.quantidade = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            TextButton.icon(
              label: Text("Adicionar"),
              onPressed: () => onSave(context),
              icon: Icon(Icons.add),
            ),
          ]),
        ),
      ),
    );
  }
}
