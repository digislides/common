import 'dart:async';
import 'dart:math';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/utils/id.dart';

import 'package:common/data/data_repo.dart';

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

  FontProperties duplicate() {
    return FontProperties(
      size: this.size,
      align: this.align,
      family: this.family,
      color: this.color,
      bold: this.bold,
      italic: this.italic,
      underline: this.underline,
    );
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

  String _text;

  final FontProperties font;

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

  Rectangle<int> get rect => Rectangle<int>(left, top, width, height);

  set rect(Rectangle<int> value) {
    left = value.left;
    top = value.top;
    width = value.width;
    height = value.height;
  }

  DataText _dataText;

  String get text => _text;

  set text(String value) {
    _text = value;
    _dataText = DataText.parse(_text);
  }

  String get linkedText {
    return _dataText.substitute(dataRepository);
  }

  TextItem({
    this.id,
    this.name: 'New text',
    int left: 0,
    int top: 0,
    int width: 50,
    int height: 40,
    this.color: 'transparent',
    String text: 'Text',
    FontProperties font,
    this.dataRepository,
  }) : font = font ?? FontProperties() {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    this.text = text;
    _rectStream = _rectChange.stream.asBroadcastStream();
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = TextItemSerializer();

  void collectUrls(Map<String, bool> urls) {}

  TextItem duplicate({String setId, String setName}) {
    return TextItem(
      id: setId ?? newId,
      name: setName ?? this.name,
      left: this.left,
      top: this.top,
      width: this.width,
      height: this.height,
      color: this.color,
      text: this.text,
      font: this.font.duplicate(),
      dataRepository: this.dataRepository,
    );
  }
}
