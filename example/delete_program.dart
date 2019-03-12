import 'package:http/io_client.dart';
import 'package:common/api/api.dart';
import 'package:common/models.dart';
import 'package:jaguar_resty/jaguar_resty.dart';

final cookieJar = CookieJar();

main() async {
  globalClient = IOClient();

  final authApi = AuthApi(Route("http://localhost:10000").before(cookieJar));
  final programApi =
      ProgramApi(Route("http://localhost:10000").before(cookieJar));

  await authApi
      .login(Login(username: 'tejainece@gmail.com', password: 's3cr3t'));

  final programs = await programApi.getAll("");

  await programApi.delete(programs.first.id);
}
