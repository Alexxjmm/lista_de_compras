import 'package:flutter/material.dart';
import 'package:lista_compras/views/add.produto.dart';
import 'package:lista_compras/views/atualizar.produto.dart';
import 'package:lista_compras/views/pasta.inicial.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => PastaInicial(),
        "/novo": (context) => AddProduto(),
        "/atualizar": (context) => AtualizarProduto(),
      },
      initialRoute: '/',
    );
  }
}
