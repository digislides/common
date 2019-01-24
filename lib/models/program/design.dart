import 'frame.dart';
import 'page.dart';

import 'package:common/serializer/serializer.dart';

export 'frame.dart';
export 'page.dart';

class ProgramDesign {
  int _width = 0;

  int _height = 0;

  List<Frame> frames;

  ProgramDesign({int width: 0, int height: 0, this.frames}) {
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
  void newFrame(
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

  // TODO remove frame

  // TODO reorder frame

  // TODO duplicate frame

  static final serializer = ProgramDesignSerializer();
}
