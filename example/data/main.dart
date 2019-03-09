import 'package:common/data_text/data_text.dart';

import 'package:open_weather_api/simple.dart';

class WeatherData extends Data {
  final List<String> template = ['weather', ':place', ':param'];

  final weathers = <String, Weather>{};

  String toData(Weather weather, String param) {
    switch (param) {
      case 'temperature':
        return weather.temp?.toString();
      default:
        return '';
    }
  }

  @override
  String get(DataLink link) {
    final String places = getParam(":place", link.segments);
    final String param = getParam(":param", link.segments);
    final weather = weathers[places];
    return toData(weather, param);
  }
}

main() {
  final data = ParsedDataText.parse("""
Stockholm {{ weather/Stockholm/temperature }} *C
Berlin    {{ weather/Berlin/temperature }} *C""");

  final weather = WeatherData();
  weather.weathers['Stockholm'] = Weather(temp: 22.0);
  weather.weathers['Berlin'] = Weather(temp: 25.0);

  final repo = DataRepository([weather]);

  print("<");
  print(data.substitute(repo));
  print(">");
}
