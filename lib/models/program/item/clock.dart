import 'dart:async';
import 'dart:math';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/utils/url.dart';
import 'package:common/utils/id.dart';

import 'package:common/data/data_repo.dart';

/// Represents an image embedded in a page
class ClockItem implements PageItem {
  String id;

  @override
  final type = PageItemType.clock;

  String name;

  int _left = 0;

  int _top = 0;

  int _size = 0;

  String _color;

  String _url;

  String _textColor;

  String _hourColor;

  String _minuteColor;

  Duration _timezone;

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

  int get size => _size;

  set size(dynamic value) {
    if (value is String) {
      _size = int.tryParse(value) ?? 0;
    } else {
      _size = value;
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

  final _viewChange = StreamController<Null>();

  Stream<Null> _viewStream;

  Stream<Null> get onViewChange => _viewStream;

  String get color => _color;

  set color(String value) {
    _color = value;
    _viewChange.add(null);
  }

  String get url => _url;

  set url(String value) {
    _url = value;
    _viewChange.add(null);
  }

  String get textColor => _textColor;

  set textColor(String value) {
    _textColor = value;
    _viewChange.add(null);
  }

  String get hourColor => _hourColor;

  set hourColor(String value) {
    _hourColor = value;
    _viewChange.add(null);
  }

  String get minuteColor => _minuteColor;

  set minuteColor(String value) {
    _minuteColor = value;
    _viewChange.add(null);
  }

  Duration get timezone => _timezone;

  set timezone(Duration value) {
    _timezone = value;
    _viewChange.add(null);
  }

  ClockItem({
    this.id,
    this.name: 'Clock',
    int left: 0,
    int top: 0,
    int size: 100,
    String color: 'transparent',
    String textColor: 'black',
    String hourColor: 'black',
    String minuteColor: 'black',
    String url: 'none',
    Duration timezone: const Duration(),
    this.dataRepository,
  }) {
    this.left = left;
    this.top = top;
    this.size = size;

    this.color = color;
    this.textColor = textColor;
    this.hourColor = hourColor;
    this.minuteColor = minuteColor;
    this.url = url;
    this.timezone = timezone;

    _rectStream = _rectChange.stream.asBroadcastStream();
    _viewStream = _viewChange.stream.asBroadcastStream();
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = ClockItemSerializer();

  String get imageUrl {
    if (!isValidMediaUrl(url)) return 'none';
    return 'url($url)';
  }

  void collectUrls(Map<String, bool> urls) {
    if (isDownloadableMediaUrl(url)) urls[url] = false;
  }

  ClockItem duplicate({String setId, String setName}) {
    return ClockItem(
      id: setId ?? newId,
      name: setName ?? this.name,
      left: this.left,
      top: this.top,
      size: this.size,
      color: this.color,
      textColor: this.textColor,
      hourColor: this.hourColor,
      minuteColor: this.minuteColor,
      url: this.url,
      timezone: this.timezone,
      dataRepository: this.dataRepository,
    );
  }
}
