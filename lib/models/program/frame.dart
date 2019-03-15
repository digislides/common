import 'dart:async';
import 'dart:math';
import 'package:common/utils/url.dart';
import 'package:common/utils/id.dart';
import 'package:common/models/program/page.dart';
import 'package:common/serializer/serializer.dart';

import 'package:common/data/data_repo.dart';

class Frame {
  String id;

  String name;

  final pages = <Page>[];

  int _left = 0;

  int _top = 0;

  int _width = 0;

  int _height = 0;

  String color;

  String image;

  Fit fit;

  Transition transition;

  DataRepository _dataRepository;

  set dataRepository(DataRepository value) {
    _dataRepository = value;

    for (Page page in pages) page.dataRepository = _dataRepository;
  }

  DataRepository get dataRepository => _dataRepository;

  Frame({
    this.id,
    this.name: 'Frame',
    int left: 0,
    int top: 0,
    int width: 0,
    int height: 0,
    this.color: 'transparent',
    this.image,
    this.fit: Fit.cover,
    this.transition: Transition.none,
    Iterable<Page> pages,
    DataRepository dataRepository,
  }) {
    id ??= newId;
    if (pages != null) this.pages.addAll(pages);
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;

    if (dataRepository != null) this.dataRepository = dataRepository;

    _rectStream = _rectChange.stream.asBroadcastStream();
  }

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
    for (Page page in pages) page.width = _width;
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  int get height => _height;

  set height(dynamic value) {
    if (value is String) {
      _height = int.tryParse(value) ?? 0;
    } else {
      _height = value;
    }
    for (Page page in pages) page.height = _height;
    _rectChange.add(Rectangle<int>(left, top, width, height));
  }

  void addNewPage({String name: 'New page'}) {
    pages.add(Page(
        id: newId,
        name: name,
        width: width,
        height: height,
        dataRepository: dataRepository));
  }

  void duplicatePage(String pageId) {
    final page = pages.firstWhere((p) => p.id == pageId, orElse: () => null);
    if (page == null) return;

    pages.add(page.duplicate(setName: page.name + '_dup'));
    // TODO insert after [page]
  }

  void removePage(String id) {
    pages.removeWhere((p) => p.id == id);
  }

  void removePagesById(Set<String> ids) {
    pages.removeWhere((p) => ids.contains(p.id));
  }

  void movePageTo(String pageId, int newPos) {
    final page = pages.firstWhere((p) => p.id == pageId, orElse: () => null);
    int oldIndex = pages.indexOf(page);
    pages[oldIndex] = null;
    if (newPos < pages.length) {
      pages.insert(newPos, page);
    } else {
      pages.add(page);
    }
    pages.removeWhere((p) => p == null);
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = FrameSerializer();

  String get imageUrl {
    if (!isValidMediaUrl(image)) return 'none';
    return 'url($image)';
  }

  void collectUrls(Map<String, bool> urls) {
    if (isDownloadableMediaUrl(image)) urls[image] = false;
    for (Page page in pages) {
      page.collectUrls(urls);
    }
  }

  Frame duplicate({String setId, String setName}) {
    return Frame(
      id: setId ?? newId,
      name: setName ?? this.name,
      left: this.left,
      top: this.top,
      width: this.width,
      height: this.height,
      image: this.image,
      pages: this.pages.map((p) => p.duplicate()),
      dataRepository: this.dataRepository,
    );
  }
}
