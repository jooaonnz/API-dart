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
// CODIGO EM ANDAMENTO