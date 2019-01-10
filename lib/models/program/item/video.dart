import 'package:bson_objectid/bson_objectid.dart';

import 'package:common/models/program/item/item.dart';

/// Represents an image embedded in a page
class VideoItem implements PageItem {
  String id;

  @override
  final type = PageItemType.video;

  String name;

  int left;

  int top;

  int width;

  int height;

  String bgColor;

  String url;

  Fit fit;

  VideoItem(
      {this.id,
      this.name: 'Video',
      this.left: 0,
      this.top: 0,
      this.width: 0,
      this.height: 0,
      this.bgColor: 'transparent',
      this.url,
      this.fit: Fit.cover}) {
    id ??= ObjectId().toHexString();
  }
}
