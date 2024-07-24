export 'has_access.dart';
export 'channel/channel.dart';
export 'program/program.dart';
export 'program/page_schedule.dart';
export 'package:open_weather_api/simple.dart';
export 'machine/machine.dart';
export 'media/media.dart';

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);
}

class User {
  final String id;
  final String email;
  final String name;
  User({required this.id, required this.email, required this.name});

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
      };

  static User fromMap(Map map) =>
      User(id: map['id'], email: map['email'], name: map['name']);
}

class Signup {
  final String email;
  final String name;
  final String password;

  Signup({required this.email, required this.name, required this.password});

  Map<String, dynamic> toJson() =>
      {'email': email, 'name': name, 'password': password};

  void validate() {
    if (email.isEmpty) {
      throw SignupError()..email = "Required!";
    }
    if (name.isEmpty) {
      throw SignupError()..name = "Required!";
    }
    if (password.isEmpty) {
      throw SignupError()..password = "Required!";
    }
  }

  static Signup fromMap(Map map) =>
      Signup(email: map['email'], name: map['name'], password: map['password']);
}

class SignupError {
  String? email;
  String? name;
  String? password;
  String? passwordRepeat;
  SignupError({this.email, this.name, this.password, this.passwordRepeat});
}

class Login {
  final String username;
  final String password;
  Login({required this.username, required this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};

  void validate() {
    if (username.isEmpty) {
      throw LoginError()..username = "Required!";
    }
    if (password.isEmpty) {
      throw LoginError()..password = "Required!";
    }
  }

  String toString() => toJson().toString();

  static Login fromMap(Map map) =>
      Login(username: map['username'], password: map['password']);
}

class LoginError {
  String? username;
  String? password;
  LoginError({this.username, this.password});
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
