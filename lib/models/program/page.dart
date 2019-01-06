import 'dart:math';
import 'package:bson_objectid/bson_objectid.dart';

import 'package:common/models/program/program.dart';
import 'package:common/models/program/item/item.dart';

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

  int duration;

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
    this.duration: 5,
    this.transition: 0,
    this.transitionDuration: 0,
    List<PageItem> items,
  }) {
    if (items != null) this.items.addAll(items);
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
}
