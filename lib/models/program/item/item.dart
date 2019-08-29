import 'dart:async';
import 'dart:math';

import 'package:common/models/program/page.dart';

import 'package:common/data/data_repo.dart';

export 'package:common/models/program/item/text.dart';
export 'package:common/models/program/item/image.dart';
export 'package:common/models/program/item/video.dart';
export 'package:common/models/program/item/clock.dart';
export 'package:common/models/program/item/weather.dart';
export 'widget.dart';

enum PageItemType { text, image, video, clock, weather, widget }

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

class VideoFit {
  final int id;

  final String name;

  final String css;

  const VideoFit._(this.id, this.name, this.css);

  static const auto = const VideoFit._(0, 'Auto', 'scale-down');
  static const contain = const VideoFit._(1, 'Contain', 'contain');
  static const cover = const VideoFit._(2, 'Cover', 'cover');
  static const fill = const VideoFit._(3, 'Fill', 'fill');
  static const original = const VideoFit._(4, 'Original', 'none');

  static List<VideoFit> get values => [auto, contain, cover, fill, original];

  static const namedValues = {
    'auto': auto,
    'contain': contain,
    'cover': cover,
    'fill': fill,
    'original': original,
    'Auto': auto,
    'Contain': contain,
    'Cover': cover,
    'Fill': fill,
    'Original': original,
  };

  static VideoFit map(value) {
    if (value is int) return values[value];
    return namedValues[value];
  }

  static VideoFit find(index) {
    if (index is int) {
      if (index < 0 || index > 3) index = 0;
      return values[index];
    }
    return auto;
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

class VAlign {
  final int id;

  final String name;

  final String css;

  const VAlign(this.id, this.name, this.css);

  static const top = VAlign(0, 'Top', 'flex-start');

  static const middle = VAlign(1, 'Middle', 'center');

  static const bottom = VAlign(2, 'Bottom', 'flex-end');

  static List<VAlign> values = [top, middle, bottom];

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

  Point<int> pos;

  Rectangle<int> rect;

  Stream<Rectangle<int>> get onRectChange;

  DataRepository dataRepository;

  // TODO clone

  void collectUrls(Map<String, bool> urls);

  PageItem duplicate({String setId, String setName});
}
