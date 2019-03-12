import 'dart:async';
import 'dart:math';

import 'package:common/utils/url.dart';

import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/data_text/data_repo.dart';

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

  String color;

  String url;

  VideoFit fit;

  bool muted;

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

  VideoItem({
    this.id,
    this.name: 'Video',
    int left: 0,
    int top: 0,
    int width: 100,
    int height: 100,
    this.color: 'transparent',
    this.url,
    this.fit: VideoFit.auto,
    this.muted: true,
    this.dataRepository,
  }) {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    _rectStream = _rectChange.stream.asBroadcastStream();
  }

  String get videoUrl {
    if (!isValidMediaUrl(url)) return 'none';
    return '$url';
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = VideoItemSerializer();

  void collectUrls(Map<String, bool> urls) {
    if (isDownloadableMediaUrl(url)) urls[url] = false;
  }
}
