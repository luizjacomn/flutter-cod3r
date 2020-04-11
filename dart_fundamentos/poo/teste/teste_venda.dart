import '../modelo/cliente.dart';
import '../modelo/produto.dart';
import '../modelo/venda.dart';
import '../modelo/venda_item.dart';

void main() {
  Produto p1 = Produto(codigo: 1, nome: 'Mouse', preco: 29.99, desconto: 0.2);
  Produto p2 = Produto(codigo: 2, nome: 'Teclado', preco: 139.99);
  Produto p3 =
      Produto(codigo: 3, nome: 'Caixa de Som', preco: 89.99, desconto: 0.15);

  Cliente cliente = Cliente(nome: 'Maria José', cpf: '123.123.123-12');

  VendaItem item1 = VendaItem(produto: p1);
  VendaItem item2 = VendaItem(produto: p2);
  VendaItem item3 = VendaItem(produto: p3, quantidade: 2);

  Venda venda = Venda(cliente: cliente, itens: [item1, item2, item3]);
  print('${venda.total.toStringAsFixed(2)}');
}
