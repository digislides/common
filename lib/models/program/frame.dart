import 'package:common/utils/id.dart';
import 'package:common/models/program/page.dart';

class Frame {
  String id;

  String name;

  List<Page> pages;

  bool fullview;

  int left;

  int top;

  int _width = 0;

  int _height = 0;

  String color;

  String image;

  Frame({
    this.id,
    this.name: 'Frame',
    this.pages,
    this.fullview: false,
    this.left: 0,
    this.top: 0,
    int width,
    int height,
    this.color: 'transparent',
    this.image,
  }) {
    id ??= newId;
    pages ??= <Page>[];
    this.width = width;
    this.height = height;
  }

  int get width => _width;

  set width(int v) {
    _width = v;
    pages.forEach((Page p) {
      p.width = _width;
    });
  }

  int get height => _height;

  set height(int v) {
    _height = v;
    pages.forEach((Page p) {
      p.height = _height;
    });
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
}
