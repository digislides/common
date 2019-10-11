import 'dart:async';
import 'dart:math';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/utils/id.dart';

import 'package:common/data/data_repo.dart';

/// Represents an image embedded in a page
class WeatherItem implements PageItem {
  String id;

  @override
  final type = PageItemType.weather;

  String name;

  int _left = 0;

  int _top = 0;

  int _width = 0;

  int _height = 0;

  String color;

  DataRepository dataRepository;

  final _rectChange = StreamController<Rectangle<int>>();

  Stream<Rectangle<int>> _rectStream;

  Stream<Rectangle<int>> get onRectChange => _rectStream;

  int get left => _left;

  set left(dynamic value) {
    if (value is String) {
      _left = int.tryParse(value) ?? 0;
    } else {
      _left = value;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get top => _top;

  set top(dynamic value) {
    if (value is String) {
      _top = int.tryParse(value) ?? 0;
    } else {
      _top = value;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get width => _width;

  set width(dynamic value) {
    if (value is String) {
      _width = int.tryParse(value) ?? 0;
    } else {
      _width = value;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get height => _height;

  set height(dynamic value) {
    if (value is String) {
      _height = int.tryParse(value) ?? 0;
    } else {
      _height = value;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  Point<int> get size => Point<int>(width, height);

  set size(Point<int> value) {
    width = value.x;
    height = value.y;
  }

  Rectangle<int> get rect => Rectangle<int>(left, top, width, height);

  set rect(Rectangle<int> value) {
    left = value.left;
    top = value.top;
    width = value.width;
    height = value.height;
  }

  Point<int> get pos => Point<int>(left, top);

  set pos(Point<int> value) {
    left = value.x;
    top = value.y;
  }

  String place;

  WeatherItem({
    this.id,
    this.name: 'Weather',
    int left: 0,
    int top: 0,
    size: 100,
    this.color: 'black',
    this.dataRepository,
    this.place,
  }) {
    this.left = left;
    this.top = top;
    this.size = Point<int>(size, size);
    _rectStream = _rectChange.stream.asBroadcastStream();
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = WeatherItemSerializer();

  void collectUrls(Map<String, bool> urls) {}

  WeatherItem duplicate({String setId, String setName}) {
    return WeatherItem(
      id: setId ?? newId,
      name: setName ?? this.name,
      left: this.left,
      top: this.top,
      size: this.size,
      color: this.color,
      dataRepository: this.dataRepository,
      place: this.place,
    );
  }
}

class WeatherIconType {
  final String id;

  final String name;

  final String char;

  const WeatherIconType(this.id, this.name, this.char);

  static const clearSky = WeatherIconType("01d", "Clear sky", '\uf00d');

  static const fewClouds = WeatherIconType("02d", "Few clouds", '\uf00c');

  static const scatteredClouds =
      WeatherIconType("03d", "Scattered clouds", '\uf00c');

  static const brokenClouds = WeatherIconType("04d", "Broken clouds", '\uf00c');

  static const showerRain = WeatherIconType("09d", "Shower rain", '\uf00b');

  static const rain = WeatherIconType("10d", "Rain", '\uf008');

  static const thunderstorm = WeatherIconType("11d", "Thunderstorm", '\uf010');

  static const snow = WeatherIconType("13d", "Snow", '\uf00a');

  static const mist = WeatherIconType("50d", "Mist", '\uf003');

  static const clearSkyNight = WeatherIconType("01n", "Clear sky", '\uf02e');

  static const fewCloudsNight = WeatherIconType("02n", "Few clouds", '\uf081');

  static const scatteredCloudsNight =
      WeatherIconType("03n", "Scattered clouds", '\uf081');

  static const brokenCloudsNight =
      WeatherIconType("04n", "Broken clouds", '\uf081');

  static const showerRainNight =
      WeatherIconType("09n", "Shower rain", '\uf02b');

  static const rainNight = WeatherIconType("10n", "Rain", '\uf028');

  static const thunderstormNight =
      WeatherIconType("11n", "Thunderstorm", '\uf02b');

  static const snowNight = WeatherIconType("13n", "Snow", '\uf02a');

  static const mistNight = WeatherIconType("50n", "Mist", '\uf04a');

  static const values = <String, WeatherIconType>{
    "01d": WeatherIconType.clearSky,
    "02d": WeatherIconType.fewClouds,
    "03d": WeatherIconType.scatteredClouds,
    "04d": WeatherIconType.brokenClouds,
    "09d": WeatherIconType.showerRain,
    "10d": WeatherIconType.rain,
    "11d": WeatherIconType.thunderstorm,
    "13d": WeatherIconType.snow,
    "50d": WeatherIconType.mist,
    "01n": WeatherIconType.clearSkyNight,
    "02n": WeatherIconType.fewCloudsNight,
    "03n": WeatherIconType.scatteredCloudsNight,
    "04n": WeatherIconType.brokenCloudsNight,
    "09n": WeatherIconType.showerRainNight,
    "10n": WeatherIconType.rainNight,
    "11n": WeatherIconType.thunderstormNight,
    "13n": WeatherIconType.snowNight,
    "50n": WeatherIconType.mistNight,
  };

  static final labels = <String>[
    WeatherIconType.clearSky.name,
    WeatherIconType.fewClouds.name,
    WeatherIconType.scatteredClouds.name,
    WeatherIconType.brokenClouds.name,
    WeatherIconType.showerRain.name,
    WeatherIconType.rain.name,
    WeatherIconType.thunderstorm.name,
    WeatherIconType.snow.name,
    WeatherIconType.mist.name,
    WeatherIconType.clearSkyNight.name,
    WeatherIconType.fewCloudsNight.name,
    WeatherIconType.scatteredCloudsNight.name,
    WeatherIconType.brokenCloudsNight.name,
    WeatherIconType.showerRainNight.name,
    WeatherIconType.rainNight.name,
    WeatherIconType.thunderstormNight.name,
    WeatherIconType.snowNight.name,
    WeatherIconType.mistNight.name,
  ];
}

final dummyWeather = Weather(
    temp: 21,
    wind: Wind(speed: 25, ),
    name: 'Stockholm',
    humidity: 33,
    rain: 12,
    snow: 15,
    condition: Condition(icon: WeatherIconType.clearSky.id));
