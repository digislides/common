import 'package:http/io_client.dart';
import 'package:common/api/api.dart';
import 'package:common/models.dart';
import 'package:jaguar_resty/jaguar_resty.dart';

final cookieJar = CookieJar();

main() async {
  globalClient = IOClient();

  final authApi = AuthApi(Route("http://localhost:10000").before(cookieJar));
  final channelApi =
      ChannelApi(Route("http://localhost:10000").before(cookieJar));

  await authApi
      .login(Login(username: 'tejainece@gmail.com', password: '1234as'));

  final chan = await channelApi.getAll("Program");

  await channelApi.save(
      chan.first.id, ChannelCreator(name: 'Save', program: chan.first.program));
}
