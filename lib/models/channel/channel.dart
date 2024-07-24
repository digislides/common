import 'package:common/models/has_access.dart';

import 'package:common/serializer/serializer.dart';

class ChannelRunning {
  final String running;
  final DateTime when;
  ChannelRunning({required this.running, required this.when});

  Map<String, dynamic> toJson() =>
      {'running': running, 'when': when.toUtc().toIso8601String()};

  String toString() => toJson().toString();

  static ChannelRunning? fromMap(Map? map) => map == null
      ? null
      : ChannelRunning(
          running: map['running'], when: DateTime.parse(map['when']));
}

class Channel extends HasAccess {
  final String id;
  final String owner;
  final Map<String, int> members;
  final String name;
  final String program;
  final ChannelRunning? running;

  Channel(
      {required this.id,
      required this.owner,
      required this.members,
      required this.name,
      required this.program,
      required this.running});

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner': owner,
        'members': members,
        'name': name,
        'program': program,
        'running': running
      };

  String toString() => toJson().toString();

  static Channel fromMap(Map map) => Channel(
        id: map['id'],
        owner: map['owner'],
        members: map['members'],
        name: map['name'],
        program: map['program'],
        running: ChannelRunning.fromMap(map['running']),
      );
}

class ChannelCreator {
  String name;
  String? program;

  ChannelCreator({this.name = '', this.program});

  void reset() {
    name = '';
    program = null;
  }

  Map<String, dynamic> toJson() => {'name': name, 'program': program};

  String toString() => toJson().toString();

  static ChannelCreator fromMap(Map map) =>
      ChannelCreator(name: map['name'], program: map['program']);
}

class ChannelPublic {
  final String id;
  final String name;
  final ChannelRunning? running;

  ChannelPublic({required this.id, required this.name, this.running});

  factory ChannelPublic.from(Channel chan) =>
      ChannelPublic(id: chan.id, name: chan.name);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'running': running};

  String toString() => toJson().toString();

  static ChannelPublic fromMap(Map map) => ChannelPublic(
      id: map['id'],
      name: map['name'],
      running: ChannelRunning.fromMap(map['running']));
}
