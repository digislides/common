import 'data_repo.dart';

class DataLink {
  final List<String> segments;

  final Map<String, String> args;

  DataLink(this.segments, this.args);

  static DataLink parse(String str) {
    String core = str.substring(2, str.length - 2).trim();

    String name;
    final args = <String, String>{};

    final int nameIdx = core.indexOf(RegExp('[ \t]'));
    if (nameIdx == -1) {
      name = core;
    } else {
      print(core);
      print(nameIdx);
      name = core.substring(0, nameIdx);

      core = core.substring(nameIdx).trim();

      print(core);

      while (core.isNotEmpty) {
        core = findArg(core, args).trim();
      }
    }

    return DataLink(name.split('/'), args);
  }

  String get path => segments.join('/');

  String toString() {
    final sb = StringBuffer('{{ ');

    sb.write(path);
    for (final argKey in args.keys) {
      sb.write(' ');
      sb.write('$argKey="${args[argKey]}"');
    }

    sb.write(' }}');

    return sb.toString();
  }

  static String findArgName(String core) {
    final Match match = RegExp(r'([a-zA-Z0-9_]+)=').firstMatch(core);
    if (match == null) throw Exception('Invalid shortcode (err 1)! $core');
    return match.group(1);
  }

  static String findArgValue(String core) {
    if (core.startsWith('"')) {
      final Match match = RegExp(r'("[^\s]+")[\s]?').firstMatch(core);
      if (match == null) throw Exception('Invalid shortcode (err 2)!');

      return match.group(1);
    } else {
      final Match match = RegExp(r'([^\s]+)[\s]?').firstMatch(core);
      if (match == null) throw Exception('Invalid shortcode (err 3)!');

      return match.group(1);
    }
  }

  static String findArg(String core, Map<String, String> values) {
    final String key = findArgName(core);
    core = core.substring(key.length + 1);
    final String value = findArgValue(core);

    values[key] =
    !value.startsWith('"') ? value : value.substring(1, value.length - 1);

    return core.substring(value.length);
  }
}

class DataText {
  final List< /* String | DataLink */ dynamic> elements;

  DataText(this.elements);

  static DataText parse(String str) {
    final regex = RegExp("\{\{[^(\}\})]*\}\}");
    final matches = regex.allMatches(str);

    int index = 0;

    final elements = [];
    for (final match in matches) {
      String part = str.substring(index, match.start);
      elements.add(part);
      index = match.end;

      final decl = str.substring(match.start, match.end);
      elements.add(DataLink.parse(decl));
    }
    elements.add(str.substring(index));
    return DataText(elements);
  }

  String substitute(DataRepository repo) {
    final sb = StringBuffer();

    for (var item in elements) {
      if (item is String)
        sb.write(item);
      else
        sb.write(repo.substitute(item));
    }

    return sb.toString();
  }
}