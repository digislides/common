import 'frame.dart';
import 'page.dart';

import 'package:common/serializer/serializer.dart';

export 'frame.dart';
export 'page.dart';

class ProgramDesign {
  int _width = 0;

  int _height = 0;

  List<Frame> frames;

  String color;

  ProgramDesign(
      {int width: 0, int height: 0, this.frames, this.color: 'transparent'}) {
    frames ??= <Frame>[];
    this.width = width;
    this.height = height;
  }

  int get width => _width;

  set width(int v) {
    _width = v;
    frames.where((f) => f.fullview).forEach((f) {
      f.width = _width;
    });
  }

  int get height => _height;

  set height(int v) {
    _height = v;
    frames.where((f) => f.fullview).forEach((f) {
      f.height = _height;
    });
  }

  // TODO add frame
  void addNewFrame(
          {String id,
          String name: 'New frame',
          List<Page> pages,
          bool fullview: false,
          int left: 0,
          int top: 0,
          int width,
          int height,
          String color: 'transparent',
          String image}) =>
      frames.add(Frame(
          id: id,
          name: name,
          pages: pages,
          fullview: fullview,
          left: left,
          top: top,
          width: width ?? this.width,
          height: height ?? this.height,
          color: color,
          image: image));

  void removeFrame(String id) {
    frames.removeWhere((f) => f.id == id);
  }

  void removeFramesById(Set<String> ids) {
    frames.removeWhere((f) => ids.contains(f.id));
  }

  void moveFrameTo(String pageId, int newPos) {
    final page = frames.firstWhere((p) => p.id == pageId, orElse: () => null);
    int oldIndex = frames.indexOf(page);
    frames[oldIndex] = null;
    if (newPos < frames.length) {
      frames.insert(newPos, page);
    } else {
      frames.add(page);
    }
    frames.removeWhere((p) => p == null);
  }

  // TODO duplicate frame

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = ProgramDesignSerializer();
}
