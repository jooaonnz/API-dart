import 'dart:io';

class Pedido {
  final int id;
  final int dateOrder;
  final int clientId;
  final int livroId;

  Pedido({
    required this.id,
    required this.dateOrder,
    required this.clientId,
    required this.livroId,
  });

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      dateOrder: map['dateOrder'],
      clientId: map['clientId'],
      livroId: map['livroId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateOrder': dateOrder,
      'clientId': clientId,
      'livroId': livroId,
      
    };
  }
}
