import 'dart:async';

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
      name = core.substring(0, nameIdx);

      core = core.substring(nameIdx).trim();

      while (core.length != 0) {
        core = findArg(core, args).trim();
      }
    }

    return DataLink(name.split('/'), args);
  }

  String get path => segments.join('/');
  
  String toString() {
    final sb = StringBuffer('{{ ');
    
    sb.write(path);
    for(final argKey in args.keys) {
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
  final List</* String | DataLink */ dynamic> elements;

  DataText(this.elements);

  static DataText parse(String str) {
    final regex = RegExp("\{\{.*\}\}");
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

abstract class DataSource {
  final _paramsPos = <String, int>{};

  List<String> get template;

  DataSource() {
    for (int i = 0; i < template.length; i++) {
      String param = template[i];
      if (!param.startsWith(":")) continue;

      _paramsPos[param] = i;
    }
  }

  bool matches(List<String> paths) {
    if (paths.length != template.length) return false;

    for (int i = 0; i < template.length; i++) {
      final temp = template[i];
      if (!temp.startsWith(":")) if (paths[i] != temp) return false;
    }

    return true;
  }

  String get(DataLink link);

  String getParam(String param, Iterable<String> paths) {
    final pos = _paramsPos[param];
    if (pos == null) throw Exception("Param not found!");
    return paths.elementAt(pos);
  }

  FutureOr<void> start();

  FutureOr<void> stop();
}

class DataRepository {
  final List<DataSource> sources;

  DataRepository(this.sources);

  String substitute(DataLink link) {
    final match =
        sources.firstWhere((d) => d.matches(link.segments), orElse: () => null);
    if (match == null) return "";

    return match.get(link);
  }

  FutureOr<void> start() async {
    for (DataSource source in sources) {
      try {
        await source.start();
      } catch (e) {}
    }
  }

  FutureOr<void> stop() async {
    for (DataSource source in sources) {
      try {
        await source.stop();
      } catch (e) {}
    }
  }

  FutureOr<void> restart() async {
    await stop();
    await start();
  }

  List<DataDefTree> get definitions {
    final ret = <DataDefTree>[];

    for(DataSource ds in sources) {

      // TODO
    }

    return ret;
  }
}

abstract class DataDefTree {}

class DataDefBranch implements DataDefTree {
  final List<DataDefTree> next;

  DataDefBranch(this.next);
}

class DataDefLeaf implements DataDefTree {
  List<DataDefParam> params;
}

class DataDefParam {
  String name;

  String description;
}