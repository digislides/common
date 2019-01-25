import 'package:common/models/has_access.dart';

import 'package:common/serializer/serializer.dart';

class Channel extends HasAccess {
  String id;

  String owner;

  Map<String, int> members;

  String name;

  String program;

  static final serializer = ChannelSerializer();
}

class ChannelCreator {
  String name;

  String program;

  static final serializer = ChannelCreatorSerializer();
}