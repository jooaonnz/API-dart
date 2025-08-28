class Produto {
  String name = '';
  double _price = 0;

  double get price => _price;

  //Verificar com Set se o valor não é negativo
  set price(double priceNew) {
    if (priceNew < 1) {
      throw new Exception('O valor não pode ser negativo!!');
    } else {
      _price = priceNew;
    }
  }

  //Exbir atributos
  void displayValue() {
    print('$name\______|R\$$_price __________');
    print('');
  }
}
