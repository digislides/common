import 'package:bson_objectid/bson_objectid.dart';

import 'package:common/models/program/item/item.dart';

class FontProperties {
  /// Size of the font
  int size;

  Align align;

  String family;

  String color;

  bool bold;

  bool italic;

  bool underline;

  // bool lineThrough;

  FontProperties({
    this.size: 16,
    this.align: Align.left,
    this.family,
    this.color: 'black',
    this.bold: false,
    this.italic: false,
    this.underline: false,
    // this.lineThrough: false
  });
}

class TextItem implements PageItem {
  String id;

  @override
  final type = PageItemType.text;

  String name;

  int left;

  int top;

  int width;

  int height;

  String bgColor;

  String text;

  final FontProperties font;

  TextItem(
      {this.id,
      this.name: 'Text',
      this.left: 0,
      this.top: 0,
      this.width: 0,
      this.height: 0,
      this.bgColor: 'transparent',
      this.text: 'Text',
      FontProperties font})
      : font = font ?? FontProperties() {
    id ??= new ObjectId().toHexString();
  }
}
