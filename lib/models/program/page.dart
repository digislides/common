import 'package:common/utils/id.dart';
import 'package:common/utils/url.dart';

import 'package:common/models/program/program.dart';
import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

export 'package:common/models/program/item/item.dart';

abstract class Sizable {
  int width;
  int height;
}

class Page implements Sizable {
  String id;

  String name;

  int width;

  int height;

  String color;

  String image;

  Fit fit;

  int _duration = 5;

  int transition;

  num transitionDuration;

  final items = <PageItem>[];

  Page({
    this.id,
    this.name: 'Page',
    this.width: 0,
    this.height: 0,
    this.color: 'white',
    this.image,
    this.fit: Fit.cover,
    int duration: 5,
    this.transition: 0,
    this.transitionDuration: 0,
    List<PageItem> items,
  }) {
    if (items != null) this.items.addAll(items);
    this._duration = duration;
  }

  String get imageUrl {
    if (!isValidMediaUrl(image)) return 'none';
    return 'url($image)';
  }

  int get duration => _duration;

  set duration(dynamic value) {
    if (value is String) {
      _duration = int.tryParse(value) ?? 5;
    } else {
      _duration = value;
    }
  }

  void addNewItem(PageItem item) {
    item.id = newId;
    items.add(item);
  }

  void removeItem(String itemId) {
    items.removeWhere((item) => item.id == itemId);
  }

  void moveItemTo(String itemId, int newPos) {
    final item = items.firstWhere((i) => i.id == itemId, orElse: () => null);
    int oldIndex = items.indexOf(item);
    items[oldIndex] = null;
    if (newPos < items.length) {
      items.insert(newPos, item);
    } else {
      items.add(item);
    }
    items.removeWhere((p) => p == null);
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = PageSerializer();

  void collectUrls(Map<String, bool> urls) {
    if (isDownloadableMediaUrl(image)) urls[image] = false;
    for (PageItem item in items) {
      item.collectUrls(urls);
    }
  }
}
