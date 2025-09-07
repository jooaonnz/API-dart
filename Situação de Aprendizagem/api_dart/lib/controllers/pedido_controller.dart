import 'dart:convert';
import 'package:api_dart/models/Pedido.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../services/pedido_service.dart';

class PedidoController {
  final _service = PedidoService();

  Router get router {
    final router = Router();

    // GET - Listar todos
    router.get('/pedido', (Request req) async {
      final pedido = await _service.getAll();
      return Response.ok(
        jsonEncode(pedido.map((c) => c.toMap()).toList()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    // POST - Criar
    router.post('/pedido', (Request req) async {
      final body = await req.readAsString();
      final data = jsonDecode(body);
      final pedido = await _service.create(
        data['dataPedido'],
        data['clienteId'],
      );

      return Response.ok(
        jsonEncode(pedido.toMap()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    // PUT - Atualizar/*
    //router.put('/pedido/<id>', (Request req, String id) async {
    // final body = await req.readAsString();
    //final data = jsonDecode(body);
    //await _service.update(
    //int.parse(id),
    //data['dateOrder'],
    //data['clientId'],
    //data['bookId'],
    ///);
    //return Response.ok(jsonEncode({'message': ' Pedido atualizado'}));
    //});

    // DELETE - Deletar
    router.delete('/pedido/<id>', (Request req, String id) async {
      await _service.delete(int.parse(id));
      return Response.ok(jsonEncode({'message': 'Pedido deletado'}));
    });

    return router;
  }
}
