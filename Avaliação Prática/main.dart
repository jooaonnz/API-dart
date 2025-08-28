import 'produto.dart';

void main() {
  //Produtos da loja
  var product = Produto();
  product.name = 'Camiseta';
  product.price = 89.50;

  var product2 = Produto();
  product2.name = 'Bermuda';
  product2.price = 59.99;

  //Exibir os produtos já definidos
  print('Produtos da loja');
  print('Nome__________|Valor__________');
  product.displayValue();
  product2.displayValue();
}
