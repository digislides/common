import 'dart:async';
import 'dart:math';

import 'package:common/models/program/page.dart';

export 'package:common/models/program/item/text.dart';
export 'package:common/models/program/item/image.dart';
export 'package:common/models/program/item/video.dart';
export 'package:common/models/program/item/clock.dart';
export 'package:common/models/program/item/weather.dart';

enum PageItemType { text, image, video, clock, weather }

class Fit {
  final int id;

  final String name;

  final String repeatCss;

  final String sizeCss;

  const Fit._(this.id, this.name, this.repeatCss, this.sizeCss);

  static const normal = const Fit._(0, 'Normal', 'no-repeat', 'auto');
  static const contain = const Fit._(1, 'Contain', 'no-repeat', 'contain');
  static const cover = const Fit._(2, 'Cover', 'no-repeat', 'cover');
  static const tile = const Fit._(3, 'Tile', 'repeat', 'auto');

  static List<Fit> get values => [normal, contain, cover, tile];

  static const namedValues = {
    'normal': normal,
    'contain': contain,
    'cover': cover,
    'tile': tile
  };

  static Fit map(value) {
    if (value is int) return values[value];
    return namedValues[(value as String).toLowerCase()];
  }

  static Fit find(index) {
    if (index is int) {
      if (index < 0 || index > 3) index = 0;
      return values[index];
    }
    return normal;
  }
}

class Align {
  final int id;

  final String name;

  final String css;

  const Align(this.id, this.name, this.css);

  static const left = Align(0, 'Left', 'left');

  static const center = Align(1, 'Center', 'center');

  static const right = Align(2, 'Right', 'right');

  static List<Align> values = [left, center, right];

  String toString() => css;
}

abstract class PageItem implements Sizable {
  String id;

  PageItemType get type;

  String name;

  int left;

  int top;

  int width;

  int height;

  String color;

  Stream<Rectangle<int>> get onRectChange;

  // TODO clone

  void collectUrls(Map<String, bool> urls);
}
