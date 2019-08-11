import 'dart:async';

import 'definition.dart';
import 'parsed.dart';

export 'definition.dart';
export 'parsed.dart';

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

  DataDefBranch get definition;
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

  DataDefBranch get definitions {
    final ret = <String, DataDefBranch>{};

    for (DataSource ds in sources) {
      final DataDefBranch def = ds.definition;
      ret[def.name] = def;
    }

    return DataDefBranch(name: 'Top level', next: ret, segments: ['Top level']);
  }
}
