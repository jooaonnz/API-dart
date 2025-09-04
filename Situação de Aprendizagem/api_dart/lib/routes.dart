import 'package:shelf_router/shelf_router.dart';
import 'controllers/pedido_controller.dart';
import 'controllers/cliente_controller.dart';

Router getRoutes() {
  final router = Router();

  router.mount('/', ClienteController().router);
  
  router.mount('/', PedidoController().router);

  return router;
}
