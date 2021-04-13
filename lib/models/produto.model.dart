class Produto {
  String name;
  String quantidade;
  String id;

  bool finalizado;

  bool emFalta;

  Produto(
      {this.name,
      this.quantidade = "0",
      this.id,
      this.finalizado = false,
      this.emFalta = false});
}
