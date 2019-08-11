import 'package:common/data/data_repo.dart';

abstract class DataDefTree {
  String get name;

  String get description;

  List<String> get segments;

  String get path;
}

class DataDefBranch implements DataDefTree {
  final String name;

  final List<String> segments;

  final Map<String, DataDefTree> next;

  final String description;

  DataDefBranch({this.name, this.segments, this.next, this.description});

  String get path => segments.join('/');

  @override
  String toString() {
    final sb = StringBuffer();

    for (final branch in next.values) {
      sb.writeln(branch.toString());
    }

    return sb.toString();
  }

  DataDefLeaf query(DataLink link) {
    DataDefTree cur = this;
    for (String seg in link.segments) {
      if (cur is DataDefBranch) {
        final n = (cur as DataDefBranch).next[seg];
        if(n == null) {
          throw Exception();
        }
        cur = n;
      } else {
        throw Exception();
      }
    }

    if(cur is! DataDefLeaf) {
      throw Exception();
    }

    // TODO

    return cur;
  }
}

class DataDefLeaf implements DataDefTree {
  final String name;

  final List<String> segments;

  final List<DataDefArg> args;

  final String description;

  DataDefLeaf({this.name, this.segments, this.args, this.description});

  String get path => segments.join('/');

  @override
  String toString() {
    final sb = StringBuffer();

    sb.write(path);

    for (final def in args) {
      sb.write(' ');
      sb.write(def.toString());
    }

    return sb.toString();
  }
}

class DataDefArg {
  final String name;

  final String description;

  final DataValue type;

  DataDefArg({this.name, this.description, this.type});

  @override
  String toString() {
    final sb = StringBuffer();

    sb.write(name);
    sb.write(":'");
    sb.write(description);
    sb.write("'");

    return sb.toString();
  }
}

abstract class DataValue {}

class StringValue implements DataValue {
  StringValue();
}

class SelectValue implements DataValue {
  final List<String> values;

  SelectValue(this.values);
}
