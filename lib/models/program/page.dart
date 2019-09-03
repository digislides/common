import 'package:common/utils/url.dart';
import 'package:common/utils/id.dart';

import 'package:common/models/program/program.dart';
import 'package:common/models/program/item/item.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/data/data_repo.dart';
import 'page_schedule.dart';

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

  Transition transition;

  DataRepository _dataRepository;

  PageSchedule schedule;

  set dataRepository(DataRepository value) {
    _dataRepository = value;

    for (PageItem item in items) item.dataRepository = _dataRepository;
  }

  DataRepository get dataRepository => _dataRepository;

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
    this.transition: Transition.none,
    Iterable<PageItem> items,
    DataRepository dataRepository,
    this.schedule,
  }) {
    if (items != null) this.items.addAll(items);
    this._duration = duration;

    schedule ??= PageSchedule();

    if (dataRepository != null) this.dataRepository = dataRepository;
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
    item.dataRepository = dataRepository;
    items.add(item);
  }

  void duplicateItem(String itemId) {
    final item =
        items.firstWhere((item) => item.id == itemId, orElse: () => null);
    if (item == null) return;

    items.insert(items.indexOf(item) + 1, item.duplicate(setName: item.name + "_dup"));
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

  Page duplicate({String setId, String setName}) {
    return Page(
      id: setId ?? newId,
      name: setName ?? this.name,
      width: this.width,
      height: this.height,
      color: this.color,
      image: this.image,
      fit: this.fit,
      duration: this.duration,
      transition: this.transition,
      items: this.items.map((i) => i.duplicate()),
      dataRepository: dataRepository,
    );
  }
}

class Transition {
  final int id;

  final String name;

  final String css;

  const Transition(this.id, this.name, this.css);

  static const none = Transition(0, 'None', 'none');

  static const moveFromLeft = Transition(1, 'Move from Left', 'moveFromLeft');

  static const moveFromRight =
      Transition(2, 'Move from Right', 'moveFromRight');

  static const moveFromTop = Transition(3, 'Move from Top', 'moveFromTop');

  static const moveFromBottom =
      Transition(4, 'Move from Bottom', 'moveFromBottom');

  static const slideFromLeft =
      Transition(11, 'Slide from Left', 'slideFromLeft');

  static const slideFromRight =
      Transition(12, 'Slide from Right', 'slideFromRight');

  static const slideFromTop = Transition(13, 'Slide from Top', 'slideFromTop');

  static const slideFromBottom =
      Transition(14, 'Slide from Bottom', 'slideFromBottom');

  static const fadeOut = Transition(100, 'Fade out', 'fadeOut');

  static const fadeIn = Transition(101, 'Fade in', 'fadeIn');

  static const values = <Transition>[
    none,
    moveFromLeft,
    moveFromRight,
    moveFromTop,
    moveFromBottom,
    slideFromLeft,
    slideFromRight,
    slideFromTop,
    slideFromBottom,
    fadeOut,
    fadeIn,
  ];

  static Map<dynamic, Transition> _map;

  static Map<dynamic, Transition> get map {
    if (_map != null) return _map;

    _map = {};

    for (final v in values) {
      _map[v.id] = v;
      _map[v.id.toString()] = v;
      _map[v.name] = v;
    }

    return _map;
  }
}
