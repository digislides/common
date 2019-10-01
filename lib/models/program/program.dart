import 'package:common/common.dart';
import 'package:common/utils/id.dart';
import 'package:common/utils/published_at_format.dart';

import 'package:common/models/program/design.dart';
import 'package:common/models/has_access.dart';

import 'package:common/serializer/serializer.dart';

export 'package:common/models/program/design.dart';
export 'common.dart';

class Program extends HasAccess {
  String id;

  String owner;

  Map<String, int> members;

  String name;

  ProgramDesign design;

  DateTime publishedAt;

  ProgramDesign published;

  Program(
      {this.id, this.name: 'Program', this.design, this.owner, this.members}) {
    id ??= newId;
  }

  String publishVersion() {
    if (publishedAt == null) return "$id:None";
    return '$id:${publishedAtDateToHuman(publishedAt)}';
  }

  String publishedAtString() {
    if (publishedAt == null) return "None";
    return dateToHuman(publishedAt);
  }

  String publishString() {
    return '$id:${publishedAtString()}';
  }

  static final serializer = ProgramSerializer();

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();
}

class PublishedProgram {
  String id;

  ProgramDesign design;

  PublishedProgram({this.id, this.design});
}
