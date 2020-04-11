class Produto {
  final int codigo;
  final String nome;
  final double preco;
  final double desconto;

  Produto({
    this.codigo,
    this.nome,
    this.preco: 0.0,
    this.desconto: 0.0,
  });

  double get precoComDesconto {
    return (1 - desconto) * preco;
  }
}
