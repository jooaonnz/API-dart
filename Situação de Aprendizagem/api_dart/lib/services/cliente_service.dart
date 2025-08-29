import 'package:mysql1/mysql1.dart';
import '../config/connection.dart';
import '../models/cliente.dart';

class ClienteService {
  Future<List<Cliente>> getAll() async {
    final conn = await DatabaseConfig.connect();
    final results = await conn.query('SELECT * FROM clientes');
    await conn.close();

    return results
        .map(
          (r) => Cliente(
            id: r['id'],
            name: r['name'],
            dateOfBirth: r['dateOfBirth'],
            phoneNumber: r['phoneNumber'],
            email: r['email'],
          ),
        )
        .toList();
  }

  //portugues e ingles no banco de dados na hora do insert verificar os ??
  Future<Cliente> create(
    String name,
    int dateOfBirh,
    int phoneNumber,
    String email,
  ) async {
    final conn = await DatabaseConfig.connect();
    var result = await conn.query(
      'INSERT INTO cliente (nome, dataNacimento, numero ,email) VALUES (?, ?)', //ver oque significa cada linha
      [name, dateOfBirh, phoneNumber, email],
    );
    await conn.close();

    return Cliente(
      id: result.insertId, //,ver isso aqui
      name: name,
      dateOfBirth: dateOfBirh,
      phoneNumber: phoneNumber,
      email: email,
    );
  }

  //fazer regra de negoocia dos demais

  Future<void> update(
    int id,
    String name,
    int dateOfBirh,
    int phoneNumber,
    String email,
  ) async {
    final conn = await DatabaseConfig.connect();
    await conn.query('UPDATE cliente SET nome=?, email=? WHERE id=?', [
      //add aqui os outros campos
      name,
      email,
      id,
    ]);
    await conn.close();
  }

  Future<void> delete(int id) async {
    final conn = await DatabaseConfig.connect();
    await conn.query('DELETE FROM cliente WHERE id=?', [
      id,
    ]); //add aqui os outros campos
    await conn.close();
  }
}
