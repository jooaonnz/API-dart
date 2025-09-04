import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/cliente_service.dart';

class ClienteController {
  final _service = ClienteService();

  Router get router {
    final router = Router();

    // GET - Listar todos
    router.get('/cliente', (Request req) async {
      final clientes = await _service.getAll();
      return Response.ok(
        jsonEncode(clientes.map((c) => c.toMap()).toList()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    // POST - Criar
    router.post('/cliente', (Request req) async {
      final body = await req.readAsString();
      final data = jsonDecode(body);
      final cliente = await _service.create(
        data['nome'],
        data['dataNascimente'],
        data['numero'],
        data['email'],
      );

      return Response.ok(
        jsonEncode(cliente.toMap()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    // PUT - Atualizar
    router.put('/cliente/<id>', (Request req, String id) async {
      final body = await req.readAsString();
      final data = jsonDecode(body);
      await _service.update(
        int.parse(id),
        data['nome'],
        data['dataNascimento'],
        data['numero'],
        data['email'],
      );
      return Response.ok(jsonEncode({'message': 'Cliente atualizado'}));
    });

    // DELETE - Deletar
    router.delete('/cliente/<id>', (Request req, String id) async {
      await _service.delete(int.parse(id));
      return Response.ok(jsonEncode({'message': 'Cliente deletado'}));
    });

    return router;
  }
}
