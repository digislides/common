import 'package:common/models/program/page.dart';

import 'package:common/models/program/item/text.dart';
import 'package:common/models/program/item/image.dart';
import 'package:common/models/program/item/video.dart';

export 'package:common/models/program/item/text.dart';
export 'package:common/models/program/item/image.dart';
export 'package:common/models/program/item/video.dart';

enum PageItemType { text, image, video }

class Fit {
  final int id;

  final String name;

  const Fit._(this.id, this.name);

  static const normal = const Fit._(0, 'Normal');
  static const contain = const Fit._(1, 'Contain');
  static const cover = const Fit._(2, 'Cover');
  static const tile = const Fit._(3, 'Tile');

  static List<Fit> get values => [normal, contain, cover, tile];

  static Fit find(index) {
    if (index is int) {
      if (index < 0 || index > 3) index = 0;
      return values[index];
    }
    return normal;
  }
}

enum Align { left, center, right }

/*
PageItem createItem(int type, Map v) {
  if (type == PageItemType.text.index) return TextItem()..fromMap(v);
  if (type == PageItemType.image.index) return ImageItem()..fromMap(v);
  if (type == PageItemType.video.index) return VideoItem()..fromMap(v);
  // TODO
  return null;
}
*/

abstract class PageItem implements Sizable {
  String get id;

  PageItemType get type;

  String name;

  int left;

  int top;

  int width;

  int height;

  String bgColor;

  // TODO clone
}
