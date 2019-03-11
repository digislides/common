// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$AuthApiClient implements ApiClient {
  final String basePath = "/auth";
  Future<void> signup(Signup model) async {
    var req =
        base.post.path(basePath).path("/signup").json(jsonConverter.to(model));
    await req.go(throwOnErr: true);
  }

  Future<StringResponse> login(Login model) async {
    var req =
        base.post.path(basePath).path("/login").json(jsonConverter.to(model));
    return req.go(throwOnErr: true);
  }
}

abstract class _$ProgramApiClient implements ApiClient {
  final String basePath = "/program";
  Future<Program> create(ProgramCreator model) async {
    var req = base.post.path(basePath).json(jsonConverter.to(model));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<void> save(String id, ProgramDesign data) async {
    var req = base.put
        .path(basePath)
        .path("/:id")
        .pathParams("id", id)
        .json(jsonConverter.to(data));
    await req.go(throwOnErr: true);
  }

  Future<void> publish(String id, ProgramDesign data) async {
    var req = base.post
        .path(basePath)
        .path("/:id/publish")
        .pathParams("id", id)
        .json(jsonConverter.to(data));
    await req.go(throwOnErr: true);
  }

  Future<PublishedProgram> getPublished(String id) async {
    var req =
        base.get.path(basePath).path("/:id/published").pathParams("id", id);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<Program> getById(String id) async {
    var req = base.get.path(basePath).path("/:id").pathParams("id", id);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Program>> getAll(String search) async {
    var req = base.get.path(basePath).query("search", search);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<Program>> getRecent() async {
    var req = base.get.path(basePath);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> delete(String id) async {
    var req = base.delete.path(basePath).path("/:id").pathParams("id", id);
    await req.go(throwOnErr: true);
  }

  Future<void> setName(String id, String name) async {
    var req = base.post
        .path(basePath)
        .path("/:id/name/:name")
        .pathParams("id", id)
        .pathParams("name", name);
    await req.go(throwOnErr: true);
  }
}

abstract class _$ChannelApiClient implements ApiClient {
  final String basePath = "/channel";
  Future<Channel> create(ChannelCreator model) async {
    var req = base.post.path(basePath).json(jsonConverter.to(model));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<Channel> save(String id, ChannelCreator model) async {
    var req = base.put
        .path(basePath)
        .path("/:id")
        .pathParams("id", id)
        .json(jsonConverter.to(model));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<Channel> getById(String id) async {
    var req = base.get.path(basePath).path("/:id").pathParams("id", id);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Channel>> getAll(String search) async {
    var req = base.get.path(basePath).query("search", search);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> delete(String id) async {
    var req = base.delete.path(basePath).path("/:id").pathParams("id", id);
    await req.go(throwOnErr: true);
  }

  Future<String> getVersion(String id) async {
    var req = base.get.path(basePath).path("/:id/version").pathParams("id", id);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<PublishedProgram> getContent(String id) async {
    var req = base.get.path(basePath).path("/:id/content").pathParams("id", id);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<void> setPlaying(String id, String running) async {
    var req = base.put
        .path(basePath)
        .path("/:id/playing")
        .pathParams("id", id)
        .query("running", running);
    await req.go(throwOnErr: true);
  }
}

abstract class _$WeatherApiClient implements ApiClient {
  final String basePath = "/data/weather";
  Future<Weather> getByName(String place) async {
    var req = base.get
        .path(basePath)
        .path("/current/:place")
        .pathParams("place", place);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<HourlyForecasts> getHourlyByName(String place) async {
    var req = base.get
        .path(basePath)
        .path("/hourly/:place")
        .pathParams("place", place);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
