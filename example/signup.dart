import 'package:http/io_client.dart';
import 'package:common/api/api.dart';
import 'package:common/models.dart';
import 'package:jaguar_resty/jaguar_resty.dart';

main() async {
  globalClient = IOClient();

  final authApi = AuthApi(Route("http://localhost:10000/api"));

  /*
  await authApi.signup(
      Signup(name: 'Teja', email: 'tejainece@gmail.com', password: 's3cr3t'));
      */

  await authApi.login(Login(username: 'tejainece@gmail.com', password: 's3cr3t'));
}
