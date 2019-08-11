import 'package:common/data/data_repo.dart';

import 'package:open_weather_api/simple.dart';

class WeatherData extends DataSource {
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

  void start() {}

  void stop() {}

  DataDefBranch get definition {
    UnimplementedError();
  }
}

main() {
  final data = DataText.parse("""
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
