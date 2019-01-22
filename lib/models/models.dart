export 'program/program.dart';

/// Model used to create a new program
class ProgramCreator {
  /// Id of the program
  String id;

  /// Owner of the program
  String owner;

  /// Name of the program
  String name;

  /// Width of the program
  int width;

  /// Height of the program
  int height;
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
