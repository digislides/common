class TimeInterval {
  int _start = 0;

  int _stop = 0;

  TimeInterval();

  int get start => _start;

  set start(v) {
    if (v is int) {
      if (v < 0) v = 0;
      if (v > 24 * 60) v = 24 * 60;
      _start = v;
    } else if (v is String) {
      final vl = v.split(":").map((v) => int.tryParse(v) ?? 0);
      _start = (vl.first * 60) + vl.last;
    }
  }

  String get startStr {
    final ret = "${_2Digs(_start ~/ 60)}:${_2Digs(_start % 60)}";
    return ret;
  }

  int get stop => _stop;

  set stop(v) {
    if (v is int) {
      if (v < 0) v = 0;
      if (v > 24 * 60) v = 24 * 60;
      _stop = v;
    } else if (v is String) {
      final vl = v.split(":").map((v) => int.tryParse(v) ?? 0);
      _stop = (vl.first * 60) + vl.last;
    }
  }

  String get stopStr {
    final ret = "${_2Digs(_stop ~/ 60)}:${_2Digs(_stop % 60)}";
    return ret;
  }

  bool get isValid {
    if (stop > start) return false;
    return true;
  }

  static String _2Digs(int v) {
    String s = v.toString();
    return s.length == 1 ? '0$s' : s;
  }
}

class WeekSchedule {
  int dayMap = 0;

  bool get monday => dayMap & 0x1 != 0;

  bool get tuesday => dayMap & 0x2 != 0;

  bool get wednesday => dayMap & 0x4 != 0;

  bool get thursday => dayMap & 0x8 != 0;

  bool get friday => dayMap & 0x10 != 0;

  bool get saturday => dayMap & 0x20 != 0;

  bool get sunday => dayMap & 0x40 != 0;

  set monday(bool v) {
    if (v)
      dayMap |= 0x1;
    else
      dayMap = dayMap & ~0x1;
  }

  set tuesday(bool v) {
    if (v)
      dayMap |= 0x2;
    else
      dayMap = dayMap & ~0x2;
  }

  set wednesday(bool v) {
    if (v)
      dayMap |= 0x4;
    else
      dayMap &= ~0x4;
  }

  set thursday(bool v) {
    if (v)
      dayMap |= 0x8;
    else
      dayMap &= ~0x8;
  }

  set friday(bool v) {
    if (v)
      dayMap |= 0x10;
    else
      dayMap &= ~0x10;
  }

  set saturday(bool v) {
    if (v)
      dayMap |= 0x20;
    else
      dayMap &= ~0x20;
  }

  set sunday(bool v) {
    if (v)
      dayMap |= 0x40;
    else
      dayMap &= ~0x40;
  }

  List<TimeInterval> times = [];

  bool not = false;

  WeekSchedule();
}

class PageSchedule {
  List<WeekSchedule> schedule = [];
}
