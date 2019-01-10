import 'package:common/utils/id.dart';

import 'package:common/models/program/design.dart';

export 'package:common/models/program/design.dart';

class Program {
  String id;

  String name;

  ProgramDesign design;

  Program({this.id, this.name: 'Program', this.design}) {
    id ??= newId;
  }
}
