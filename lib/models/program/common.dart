import 'dart:math';

abstract class Sizable {
  int get width;
  void set width(int value);
  int get height;
  void set height(int value);
}

abstract class HasPos {
  Point<int> get pos;
  set pos(Point<int> value);
  int get left;
  set left(int value);
  int get top;
  set top(int value);
}

abstract class HasSize implements Sizable {
  Point<int> get size;
  set size(Point<int> value);
  int get width;
  set width(int value);
  int get height;
  set height(int value);
}

abstract class CanvasItem implements HasSize, HasPos {}
