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

  final channel = await channelApi.getAll("");

  print(channel);

  print(await channelApi.getAll("1"));

  print(await channelApi.getAll("^Prog.*"));

  print(await channelApi.getById(channel.first.id));
}
