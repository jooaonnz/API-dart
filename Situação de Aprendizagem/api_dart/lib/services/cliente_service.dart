import 'package:mysql1/mysql1.dart';
import '../config/connection.dart';
import '../models/cliente.dart';

class ClienteService {
  Future<List<Cliente>> getAll() async {
    final conn = await Connection.connect();
    final results = await conn.query('SELECT * FROM cliente');
    await conn.close();

    return results
        .map(
          (r) => Cliente(
            id: r['id'],
            name: r['nome'],
            dateOfBirth: r['dataNascimento'],
            phoneNumber: r['numero'],
            email: r['email'],
          ),
        )
        .toList();
  }

  //portugues e ingles no banco de dados na hora do insert verificar os ??
  Future<Cliente> create(
    String name,
    DateTime dateOfBirth,
    String phoneNumber,
    String email,
  ) async {
    final conn = await Connection.connect();

    try {
      print([name, dateOfBirth, phoneNumber, email]);

      String dateStr = dateOfBirth.toIso8601String().split('T')[0];

      var result = await conn.query(
        'INSERT INTO cliente (nome, dataNascimento, numero ,email) VALUES (?, ?, ?, ?)',
        [name, dateStr, phoneNumber, email],
      );

      print('Valores enviados para o insert:');
      print([name, dateStr, phoneNumber, email]);

      return Cliente(
        id: result.insertId!,
        name: name,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneNumber,
        email: email,
      );
    } catch (e, stackTrace) {
      // Captura qualquer erro (conexão, query, etc)
      print(' Erro ao criar cliente: $e');
      print(' StackTrace: $stackTrace');
      rethrow;
    } finally {
      await conn.close();
    }
  }

  //fazer regra de negoocia dos demais
  //string nos int
  Future<void> update(
    int id,
    String name,
    int dateOfBirh,
    int phoneNumber,
    String email,
  ) async {
    final conn = await Connection.connect();
    await conn.query('UPDATE cliente SET nome=?, email=? WHERE id=?', [
      //add aqui os outros campos
      name,
      email,
      id,
    ]);
    await conn.close();
  }

  Future<void> delete(int id) async {
    final conn = await Connection.connect();
    await conn.query('DELETE FROM cliente WHERE id=?', [id]);
    await conn.close();
  }
}
