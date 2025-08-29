import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import '../lib/routes.dart';

void main() async {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(getRoutes());

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('✅ Servidor rodando em http://localhost:8080');
}
/*--- IGNORE ---

import 'package:mysql1/mysql1.dart';
import '../lib/config/database.dart';

void main() async {
  try {
    final conn = await DatabaseConfig.connect();
    print('✅ Conectado ao banco de dados!');

    var results = await conn.query('SELECT * FROM cliente');
    for (var row in results) {
      print('Cliente: ${row['nome']}, Email: ${row['email']}');
    }

    await conn.close();
  } catch (e) {
    print('❌ Erro na conexão: $e');
  }
}
*/