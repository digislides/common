import 'dart:math';

abstract class Sizable {
  int width;
  int height;
}

abstract class HasPos {
  Point<int> pos;

  int left;

  int top;
}

abstract class HasSize implements Sizable {
  Point<int> size;

  int width;

  int height;
}

abstract class CanvasItem implements HasSize, HasPos {}