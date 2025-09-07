import 'package:mysql1/mysql1.dart';
import '../config/connection.dart';
import '../models/pedido.dart';

class PedidoService {
  Future<List<Pedido>> getAll() async {
    final conn = await Connection.connect();
    final results = await conn.query('SELECT * FROM pedido');
    await conn.close();

    return results
        .map(
          (r) => Pedido(
            id: r['id'],
            dateOrder: r['dataPedido'],
            clientId: r['clienteId'],
          ),
        )
        .toList();
  }

  //portugues e ingles no banco de dados na hora do insert verificar os ??
  Future<Pedido> create(int dateOrder, int clientId) async {
    final conn = await Connection.connect();
    var result = await conn.query(
      'INSERT INTO pedido (dataPedido, clienteId) VALUES (?, ?)',
      [dateOrder, clientId],
    );
    await conn.close();

    return Pedido(
      id: result.insertId!,
      dateOrder: dateOrder,
      clientId: clientId,
    );
  }

  //update arrumar
  //fazer regra de negoocia dos demais
  //string nos int
  Future<void> update(int id, int dateOrder, int clientId) async {
    final conn = await Connection.connect();
    await conn.query('UPDATE pedido SET nome=?, email=? WHERE id=?', [
      //add aqui os outros campos
      clientId,
      id,
    ]);
    await conn.close();
  }

  Future<void> delete(int id) async {
    final conn = await Connection.connect();
    await conn.query('DELETE FROM pedido WHERE id=?', [id]);
    await conn.close();
  }
}
