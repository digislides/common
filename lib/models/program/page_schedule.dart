class TimeInterval {
  final int start;

  final int stop;

  TimeInterval(this.start, this.stop);
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

  List<TimeInterval> times = [];

  bool not = false;

  WeekSchedule();
}

class PageSchedule {
  List<WeekSchedule> schedule = [];
}
