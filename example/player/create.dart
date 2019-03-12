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

  print(await channelApi.create(
      ChannelCreator(name: 'Medis', program: '5c61395bce58db4183a87a95')));

  print(await channelApi.create(
      ChannelCreator(name: 'Program1', program: '5c61395bce58db4183a87a95')));

  print(await channelApi.create(
      ChannelCreator(name: 'Program2', program: '5c61395bce58db4183a87a95')));

  print(await channelApi.create(
      ChannelCreator(name: 'Program5', program: '5c61395bce58db4183a87a95')));
}
