import 'package:http/io_client.dart';
import 'package:common/api/api.dart';
import 'package:common/models.dart';
import 'package:jaguar_resty/jaguar_resty.dart';

final cookieJar = CookieJar();

main() async {
  globalClient = IOClient();

  final authApi =
      AuthApi(Route("http://localhost:10000/api").before(cookieJar));
  final programApi =
      ProgramApi(Route("http://localhost:10000/api").before(cookieJar));

  await authApi
      .login(Login(username: 'tejainece@gmail.com', password: 's3cr3t'));

  print(await programApi.getAll(""));

  print(await programApi.getAll("1"));

  print(await programApi.getAll("^Prog.*"));
}
