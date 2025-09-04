import 'package:mysql1/mysql1.dart';

class DatabaseConfig {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'eskelsen', // seu usuário
      password: 'password', // sua senha
      db: 'biblioteca', // banco de dados
    );

    return await MySqlConnection.connect(settings);
  }
}

void main() {
  print('teste');
}
