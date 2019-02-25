import 'dart:async';
import 'dart:math';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

class FontProperties {
  /// Size of the font
  int _size;

  Align align;

  String family;

  String color;

  bool bold;

  bool italic;

  bool underline;

  // bool lineThrough;

  FontProperties({
    int size: 16,
    this.align: Align.left,
    this.family,
    this.color: 'black',
    this.bold: false,
    this.italic: false,
    this.underline: false,
    // this.lineThrough: false
  }) {
    this.size = size;
  }

  int get size => _size;

  set size(dynamic value) {
    if (value is String) {
      _size = int.tryParse(value) ?? 0;
    } else {
      _size = value;
    }
  }
}

class TextItem implements PageItem {
  String id;

  @override
  final type = PageItemType.text;

  String name;

  int _left = 0;

  int _top = 0;

  int _width = 0;

  int _height = 0;

  String color;

  String text;

  final FontProperties font;

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

  TextItem(
      {this.id,
      this.name: 'New text',
      int left: 0,
      int top: 0,
      int width: 50,
      int height: 40,
      this.color: 'transparent',
      this.text: 'Text',
      FontProperties font})
      : font = font ?? FontProperties() {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    _rectStream = _rectChange.stream.asBroadcastStream();
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = TextItemSerializer();

  void collectUrls(Map<String, bool> urls) {
  }
}
