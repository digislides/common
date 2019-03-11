import 'package:http/io_client.dart';
import 'package:common/api/api.dart';
import 'package:common/models.dart';
import 'package:jaguar_resty/jaguar_resty.dart';

final cookieJar = CookieJar();

main() async {
  globalClient = IOClient();

  final weatherApi =
      WeatherApi(Route("http://localhost:10000").before(cookieJar));

  final weather = await weatherApi.getByName("Stockholm");
  print(weather);

  final hourly = await weatherApi.getHourlyByName("Stockholm");
  print(hourly);
}
