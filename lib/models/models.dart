import 'package:common/serializer/serializer.dart';

export 'has_access.dart';
export 'channel/channel.dart';
export 'program/program.dart';

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);
}

/// Model used to create a new program
class ProgramCreator {
  /// Name of the program
  String name;

  /// Width of the program
  int width;

  /// Height of the program
  int height;

  ProgramCreator({this.name: '', this.width, this.height});

  void reset() {
    name = '';
    width = 100;
    height = 100;
  }

  void validate() {
    if (name == null || name.isEmpty)
      throw ValidationException("Name cannot be empty!");

    if (name.trim().length > name.length)
      throw ValidationException(
          "Name should not contain space at the beginning or end!");

    if (name.length > 20)
      throw ValidationException("Maximum character limit for name is 20!");

    if (width == null || width < 0)
      throw ValidationException("Width should be a positive number!");

    if (height == null || height < 0)
      throw ValidationException("Height should be a positive number!");
  }

  static final serializer = ProgramCreatorSerializer();
}

/*
class Program {
  String id;

  String name;

  String owner;

  List<String> writers;

  List<String> readers;

  ProgramDesign design;

  bool hasReadAccess(String accessorId) =>
      accessorId != null &&
      (owner == accessorId ||
          readers.contains(accessorId) ||
          writers.contains(accessorId));

  bool hasWriteAccess(String accessorId) =>
      accessorId != null &&
      (owner == accessorId || writers.contains(accessorId));
}
*/

/*
class Player {
  String id;

  String name;

  String owner;

  List<String> writers;

  List<String> readers;

  List<Frame> frames;

  bool hasReadAccess(String accessorId) =>
      accessorId != null &&
      (owner == accessorId ||
          readers.contains(accessorId) ||
          writers.contains(accessorId));

  bool hasWriteAccess(String accessorId) =>
      accessorId != null &&
      (owner == accessorId || writers.contains(accessorId));
}
*/

class User {
  String id;

  String email;

  String name;
}

class Signup {
  String email;

  String name;

  String password;

  Signup({this.email, this.name, this.password});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  void validate() {
    // TODO
  }

  static final serializer = SignupSerializer();
}

class Login {
  String username;

  String password;

  Login({this.username, this.password});

  Map<String, dynamic> toJson() => serializer.toMap(this);

  void validate() {
    // TODO
  }

  static final serializer = LoginSerializer();

  String toString() => toJson().toString();
}
