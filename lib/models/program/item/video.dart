import 'dart:async';
import 'dart:math';

import 'package:bson_objectid/bson_objectid.dart';

import 'package:common/models/program/item/item.dart';

/// Represents an image embedded in a page
class VideoItem implements PageItem {
  String id;

  @override
  final type = PageItemType.video;

  String name;

  int _left = 0;

  int _top = 0;

  int _width = 0;

  int _height = 0;

  String bgColor;

  String url;

  Fit fit;
  final _rectChange = StreamController<Rectangle<int>>();

  Stream<Rectangle<int>> _rectStream;

  Stream<Rectangle<int>> get onRectChange => _rectStream;

  int get left => _left;

  set left(int value) {
    _left = value;
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get top => _top;

  set top(int value) {
    _top = value;
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get width => _width;

  set width(int value) {
    _width = value;
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get height => _height;

  set height(int value) {
    _height = value;
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  VideoItem(
      {this.id,
      this.name: 'Video',
      int left: 0,
      int top: 0,
      int width: 0,
      int height: 0,
      this.bgColor: 'transparent',
      this.url,
      this.fit: Fit.cover}) {
    id ??= ObjectId().toHexString();
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    _rectStream = _rectChange.stream.asBroadcastStream();
  }
}
