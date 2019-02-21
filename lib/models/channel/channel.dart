import 'package:common/models/has_access.dart';

import 'package:common/serializer/serializer.dart';

class Channel extends HasAccess {
  String id;

  String owner;

  Map<String, int> members;

  String name;

  String program;

  Channel({this.id, this.name, this.program});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = ChannelSerializer();
}

class ChannelCreator {
  String name;

  String program;

  ChannelCreator({this.name, this.program});

  void reset() {
    name = '';
    program = null;
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = ChannelCreatorSerializer();
}

class ChannelPublic {
  String id;

  String name;

  ChannelPublic({this.id, this.name});

  factory ChannelPublic.from(Channel chan) =>
      ChannelPublic(id: chan.id, name: chan.name);

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = ChannelPublicSerializer();
}
