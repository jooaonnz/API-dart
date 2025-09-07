import 'dart:io';

class Pedido {
  final int id;
  final int dateOrder;
  final int clientId;

  Pedido({required this.id, required this.dateOrder, required this.clientId});

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      dateOrder: map['dataPedido'],
      clientId: map['clienteId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'dataPedido': dateOrder, 'clienteId': clientId};
  }
}
