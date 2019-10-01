import 'dart:async';
import 'dart:math';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/utils/id.dart';

import 'package:common/data/data_repo.dart';

class WeatherTheme {
  final int id;
  final String label;
  final String css;

  const WeatherTheme._(this.id, this.label, this.css);

  String toString() => label;

  static const flatFilled = const WeatherTheme._(0, "Flat filled", 'wi-flat');
  static const flatThin = const WeatherTheme._(1, "Flat thin", 'wi-flat-thin');

  static const values = <WeatherTheme>[flatFilled, flatThin];

  static const map = {
    "Flat filled": flatFilled,
    "Flat thin": flatThin,
  };

  static final labels = <String>[
    flatFilled.label,
    flatThin.label,
  ];
}

/// Represents an image embedded in a page
class WeatherItem implements PageItem {
  String id;

  @override
  final type = PageItemType.weather;

  String name;

  int _left = 0;

  int _top = 0;

  int _size = 0;

  String color;

  WeatherTheme theme;

  WeatherIconType dummy;

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

  int get width => _size;

  set width(dynamic value) {
    if (value is String) {
      _size = int.tryParse(value) ?? 0;
    } else {
      _size = value;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get height => _size;

  set height(dynamic value) {
    if (value is String) {
      _size = int.tryParse(value) ?? 0;
    } else {
      _size = value;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  Point<int> get size => Point<int>(_size, _size);

  set size(dynamic value) {
    if (value is String) {
      _size = int.tryParse(value) ?? 0;
    } else if(value is int) {
      _size = value;
    } else if(value is Point<int>) {
      _size = value.y;
    }
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  Point<int> get pos => Point<int>(left, top);

  set pos(Point<int> value) {
    left = value.x;
    top = value.y;
  }

  Rectangle<int> get rect => Rectangle<int>(left, top, width, height);

  set rect(Rectangle<int> value) {
    left = value.left;
    top = value.top;
    width = value.width;
    height = value.height;
  }

  WeatherItem({
    this.id,
    this.name: 'Weather',
    int left: 0,
    int top: 0,
    size: 100,
    this.color: 'black',
    this.theme: WeatherTheme.flatFilled,
    this.dummy: WeatherIconType.clearSky,
    this.dataRepository,
  }) {
    this.left = left;
    this.top = top;
    this.size = size;
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
      theme: this.theme,
      dummy: this.dummy,
      dataRepository: this.dataRepository,
    );
  }
}

class WeatherIconType {
  final String id;

  final String name;

  const WeatherIconType(this.id, this.name);

  String get css => 'wi-$id';

  static const clearSky = WeatherIconType("01d", "Clear sky");

  static const fewClouds = WeatherIconType("02d", "Few clouds");

  static const scatteredClouds = WeatherIconType("03d", "Scattered clouds");

  static const brokenClouds = WeatherIconType("04d", "Broken clouds");

  static const showerRain = WeatherIconType("09d", "Shower rain");

  static const rain = WeatherIconType("10d", "Rain");

  static const thunderstorm = WeatherIconType("11d", "Thunderstorm");

  static const snow = WeatherIconType("13d", "Snow");

  static const mist = WeatherIconType("50d", "Mist");

  static const clearSkyNight = WeatherIconType("01n", "Clear sky");

  static const fewCloudsNight = WeatherIconType("02n", "Few clouds");

  static const scatteredCloudsNight =
      WeatherIconType("03n", "Scattered clouds");

  static const brokenCloudsNight = WeatherIconType("04n", "Broken clouds");

  static const showerRainNight = WeatherIconType("09n", "Shower rain");

  static const rainNight = WeatherIconType("10n", "Rain");

  static const thunderstormNight = WeatherIconType("11n", "Thunderstorm");

  static const snowNight = WeatherIconType("13n", "Snow");

  static const mistNight = WeatherIconType("50n", "Mist");

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
