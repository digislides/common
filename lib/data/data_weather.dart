import 'dart:async';
import 'dart:convert';

import 'data_repo.dart';
import 'package:common/models.dart';
import 'package:common/api/api.dart';

class WeatherData extends DataSource {
  final List<String> template = ['weather', ':place'];

  final _weathers = <String, Weather>{};

  Timer _timer;

  WeatherData() {
    _timer = Timer.periodic(Duration(minutes: 10), (_) async {
      await _update();
    });
  }

  void register(String place) {
    _weathers[place] = null;
  }

  void registerAll(Iterable<String> places) {
    for (final place in places) {
      _weathers[place] = null;
    }
  }

  Future<void> start() async {
    await _update();
  }

  void stop() {
    if (_timer != null) _timer.cancel();
  }

  Future<void> _update() async {
    for (String weather in _weathers.keys) {
      try {
        _weathers[weather] = await weatherApi.getByName(weather);
      } catch (e) {}
    }
  }

  String toData(Weather weather, String param) {
    switch (param) {
      case 'temperature':
        return weather.temp?.toString();
      case '':
        return jsonEncode(weather);
      default:
        return '';
    }
  }

  @override
  String get(DataLink link) {
    final String places = getParam(":place", link.segments);
    final String param = link.args['param'];
    final weather = _weathers[places];
    if (weather == null) return "";
    return toData(weather, param);
  }

  Map<String, DataDefLeaf> _makeLeafs(String place) {
    return {
      'temperature': DataDefLeaf(
          name: 'Temperature',
          segments: ['weather', place, 'temperature'],
          args: [],
          description: 'Weather temperature')
    };
  }

  DataDefBranch get definition {
    final ret = <String, DataDefTree>{};

    for (final place in _weathers.keys) {
      final placeBranch = DataDefBranch(
          name: place,
          segments: ['weather', place],
          description: 'Weather information for $place',
          next: _makeLeafs(place));
      ret[place] = placeBranch;
    }

    return DataDefBranch(
        name: 'weather',
        next: ret,
        description: 'Weather data source',
        segments: ['weather']);
  }
}
