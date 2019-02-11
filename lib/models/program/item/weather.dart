import 'dart:async';
import 'dart:math';

import 'package:common/models/program/item/item.dart';

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

  WeatherItem({
    this.id,
    this.name: 'Weather',
    int left: 0,
    int top: 0,
    int width: 100,
    int height: 100,
    this.color: 'transparent',
  }) {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    _rectStream = _rectChange.stream.asBroadcastStream();
  }
}
