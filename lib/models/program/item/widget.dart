import 'dart:async';
import 'dart:math';

import 'package:common/utils/id.dart';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/data/data_repo.dart';

/// Represents an widget embedded in a page
class WidgetItem implements PageItem {
  String id;

  @override
  final type = PageItemType.widget;

  String name;

  int _left = 0;

  int _top = 0;

  int _width = 0;

  int _height = 0;

  /// Does content come from URL or HTML code
  bool isUrl;

  String url;

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

  Point<int> get pos => Point<int>(left, top);

  set pos(Point<int> value) {
    left = value.x;
    top = value.y;
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

  WidgetItem({
    this.id,
    this.name: 'Widget',
    int left: 0,
    int top: 0,
    int width: 100,
    int height: 100,
    this.isUrl: true,
    this.url,
    this.dataRepository,
  }) {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    _rectStream = _rectChange.stream.asBroadcastStream();
  }

  String get asSrcDoc =>
      '<html><head><style>html,body {margin: 0px; padding: 0px;}</style></head><body>${url ?? ''}</body></html>';

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = WidgetItemSerializer();

  void collectUrls(Map<String, bool> urls) {}

  WidgetItem duplicate({String setId, String setName}) {
    return WidgetItem(
      id: setId ?? newId,
      name: setName ?? this.name,
      left: this.left,
      top: this.top,
      width: this.width,
      height: this.height,
      isUrl: this.isUrl,
      url: this.url,
      dataRepository: this.dataRepository,
    );
  }
}
