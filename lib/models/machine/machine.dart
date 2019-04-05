import 'package:common/serializer/serializer.dart';

import 'package:common/models/has_access.dart';

class InfoField {
  String name = "";

  String value = "";

  InfoField({this.name, this.value});
}

class Monitor extends HasAccess {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<InfoField> fields = [];

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MonitorSerializer();
}

class MonitorCreator {
  String name = "";

  List<InfoField> fields = [];

  MonitorCreator();

  void reset() {
    name = "";
    fields.clear();
  }

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MonitorCreatorSerializer();
}