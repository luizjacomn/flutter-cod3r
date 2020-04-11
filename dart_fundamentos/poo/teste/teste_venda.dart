import '../modelo/venda.dart';
import '../modelo/cliente.dart';
import '../modelo/produto.dart';
import '../modelo/venda_item.dart';

void main() {
  final venda = Venda(
    cliente: Cliente(
      nome: 'Maria José',
      cpf: '123.123.123-12',
    ),
    itens: <VendaItem>[
      VendaItem(
        produto: Produto(
          codigo: 1,
          nome: 'Mouse',
          preco: 29.99,
          desconto: 0.2,
        ),
      ),
      VendaItem(
        produto: Produto(
          codigo: 2,
          nome: 'Teclado',
          preco: 139.99,
        ),
      ),
      VendaItem(
        produto: Produto(
          codigo: 3,
          nome: 'Caixa de Som',
          preco: 89.99,
          desconto: 0.15,
        ),
        quantidade: 2,
      )
    ],
  );
  
  print('${venda.total.toStringAsFixed(2)}');
}
