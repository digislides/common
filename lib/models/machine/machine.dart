import 'package:common/serializer/serializer.dart';

import 'package:common/models/has_access.dart';

class Monitor extends HasAccess {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<String> fields;

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MonitorSerializer();
}

class MonitorCreator {
  String name;

  List<String> fields = [];

  MonitorCreator({this.name, this.fields});

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MonitorCreatorSerializer();
}