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
  String name;
  String owner;
  final Map<String, int> members = {};
  ProgramDesign design;
  DateTime? publishedAt;
  ProgramDesign? published;

  Program(
      {String? id,
      this.name: 'Program',
      required this.owner,
      Map<String, int>? members,
      required this.design,
      this.publishedAt,
      this.published})
      : id = id ?? newId {
    this.members.addAll(members ?? {});
  }

  String publishVersion() {
    if (publishedAt == null) return "$id:None";
    return '$id:${publishedAtDateToHuman(publishedAt!)}';
  }

  String publishedAtString() {
    if (publishedAt == null) return "None";
    return dateToHuman(publishedAt!);
  }

  String publishString() {
    return '$id:${publishedAtString()}';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'owner': owner,
        'members': members,
        'design': design,
        'publishedAt': seconds2019.serialize(publishedAt),
        'published': published,
      };

  String toString() => toJson().toString();

  static Program fromMap(Map map) => Program(
        id: map['id'],
        name: map['name'],
        owner: map['owner'],
        members: map['member'],
        design: ProgramDesign.fromMap(map['design']),
        publishedAt: seconds2019.deserialize(map['publishedAt']),
        published: ProgramDesign.fromMap(map['published']),
      );
}

class PublishedProgram {
  String id;

  ProgramDesign design;

  PublishedProgram({this.id, this.design});
}

/// Model used to create a new program
class ProgramCreator {
  /// Name of the program
  String name;

  /// Width of the program
  int width;

  /// Height of the program
  int height;

  ProgramCreator({this.name: '', required this.width, required this.height});

  void reset() {
    name = '';
    width = 100;
    height = 100;
  }

  void validate() {
    if (name.isEmpty) throw ValidationException("Name cannot be empty!");

    if (name.trim().length > name.length)
      throw ValidationException(
          "Name should not contain space at the beginning or end!");

    if (name.length > 20)
      throw ValidationException("Maximum character limit for name is 20!");

    if (width < 0)
      throw ValidationException("Width should be a positive number!");

    if (height < 0)
      throw ValidationException("Height should be a positive number!");
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'width': width, 'height': height};

  String toString() => toJson().toString();

  static ProgramCreator fromMap(Map map) => ProgramCreator(
      name: map['name'], width: map['width'], height: map['height']);
}

class Seconds2019 {
  const Seconds2019();

  int? serialize(DateTime? value) {
    if (value == null) return null;
    return (value.toUtc().difference(refDate)).inSeconds;
  }

  DateTime? deserialize(int? value) {
    if (value == null) return null;
    return refDate.add(Duration(seconds: value));
  }
}

const seconds2019 = Seconds2019();
