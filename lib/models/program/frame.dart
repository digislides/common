import 'dart:async';
import 'dart:math';

import 'package:common/utils/id.dart';
import 'package:common/models/program/page.dart';
import 'package:common/serializer/serializer.dart';

class Frame {
  String id;

  String name;

  List<Page> pages;

  int _left = 0;

  int _top = 0;

  int _width = 0;

  int _height = 0;

  String image;

  Frame({
    this.id,
    this.name: 'Frame',
    this.pages,
    int left: 0,
    int top: 0,
    int width: 0,
    int height: 0,
    this.image,
  }) {
    id ??= newId;
    pages ??= <Page>[];
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;

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
    pages.add(Page(id: newId, name: name, width: width, height: height));
  }

  void removePage(String id) {
    pages.removeWhere((p) => p.id == id);
  }

  void removePagesById(Set<String> ids) {
    pages.removeWhere((p) => ids.contains(p.id));
  }

  /* TODO
  void duplicatePage(String pageId) {
    final page = pages.firstWhere((p) => p.id == pageId, orElse: () => null);
    if (page == null) return;
    Page dupPage = page.clone();
    // Add new page to pages
    int pos = pages.indexOf(page);
    pages.insert(pos + 1, dupPage);
  }
  */

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

  void newPage(
          {String id,
          String name: 'New page',
          String color: 'white',
          String image,
          List<PageItem> items}) =>
      pages.add(Page(
          id: id,
          name: name,
          width: this.width,
          height: this.height,
          color: color,
          image: image,
          items: items));

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = FrameSerializer();

  void collectUrls(Map<String, bool> urls) {
    for (Page page in pages) {
      page.collectUrls(urls);
    }
  }
}
