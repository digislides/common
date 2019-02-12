import 'package:common/utils/id.dart';

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
    if (image == null || image.trim().isEmpty) return 'none';
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

  /*
  void fromMap(Map map) {
    id = map['id'];
    name = map['name'] ?? 'Page';
    color = map['color'] ?? 'white';
    image = map['image'];
    fit = Fit.find(map['fit']);
    duration = map['duration'] ?? 0;
    // TODO transition
    // TODO transitionDuration
    items.assignAll(((map['items'] ?? <Map>[]) as List)
        .map((m) {
      if (m['type'] is int) {
        return createItem(m['type'], m);
      }
      return null;
    })
        .where((v) => v is PageItem)
        .toList()
        .cast<PageItem>());
  }
  */

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = PageSerializer();
}
