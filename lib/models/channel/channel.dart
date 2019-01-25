import 'package:common/models/has_access.dart';

class Channel extends HasAccess {
  String id;

  String owner;

  Map<String, int> members;

  String name;

  String program;
}
