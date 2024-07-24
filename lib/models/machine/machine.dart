import 'package:common/models/has_access.dart';

class InfoField {
  String name;
  String value;

  InfoField({this.name = '', this.value = ''});

  Map<String, dynamic> toJson() => {'name': name, 'value': value};

  static InfoField fromMap(Map map) =>
      InfoField(name: map['name'], value: map['value']);

  static List<InfoField> fromList(List list) =>
      list.cast<Map>().map(InfoField.fromMap).toList();
}

class Monitor extends HasAccess {
  String id;
  String name;
  String owner;
  final Map<String, int> members = {};
  final List<InfoField> fields = [];

  Monitor(
      {required this.id,
      required this.name,
      required this.owner,
      Map<String, int>? members,
      List<InfoField>? fields}) {
    this.members.addAll(members ?? {});
    this.fields.addAll(fields ?? []);
  }

  Map toJson() => {
        'id': id,
        'name': name,
        'owner': owner,
        'members': members,
        'fields': fields,
      };

  String toString() => toJson().toString();

  static Monitor fromMap(Map map) => Monitor(
        id: map['id'],
        name: map['name'],
        owner: map['owner'],
        members: map['members'],
        fields: InfoField.fromList(map['fields'] as List),
      );
}

class MonitorCreator {
  String name;
  final List<InfoField> fields = [];

  MonitorCreator({this.name = '', List<InfoField>? fields}) {
    this.fields.addAll(fields ?? []);
  }

  void reset() {
    name = "";
    fields.clear();
  }

  Map toJson() => {'name': name, 'fields': fields};

  String toString() => toJson().toString();

  static MonitorCreator fromMap(Map map) => MonitorCreator(
      name: map['name'], fields: InfoField.fromList(map['fields'] as List));
}
