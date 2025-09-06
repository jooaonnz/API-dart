import 'package:mysql1/mysql1.dart';

class Connection {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306, //3896
      user: 'root', // seu usuário
      password: 'root', // sua senha
      db: 'biblioteca', // banco de dados
      characterSet: CharacterSet.UTF8MB4, //novo
    );

    return await MySqlConnection.connect(settings);
  }
}
