import 'package:date_format/date_format.dart';

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

  DateTime publishedAt;

  ProgramDesign published;

  Program(
      {this.id, this.name: 'Program', this.design, this.owner, this.members}) {
    id ??= newId;
  }

  String publishedAtString() {
    if (publishedAt == null) return "Not published yet!";
    return formatDate(
        publishedAt.toLocal(), [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn]);
  }

  String publishString() {
    if (publishedAt == null) return "none";
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
