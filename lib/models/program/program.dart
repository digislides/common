import 'package:common/utils/id.dart';

import 'package:common/models/program/design.dart';
import 'package:common/models/has_access.dart';

import 'package:common/serializer/serializer.dart';

export 'package:common/models/program/design.dart';

class Program extends HasAccess {
  String id;

  String owner;

  Map<String, int> members;

  String name;

  ProgramDesign design;

  Program({this.id, this.name: 'Program', this.design}) {
    id ??= newId;
  }

  static final serializer = ProgramSerializer();
}
