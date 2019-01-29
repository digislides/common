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

  Future<void> save(String id, Map<dynamic, dynamic> data) async {
    var req = base.put
        .path(basePath)
        .path("/:id")
        .pathParams("id", id)
        .json(jsonConverter.to(data));
    await req.go(throwOnErr: true);
  }

  Future<Program> getById(String id) async {
    var req = base.get.path(basePath).path("/:id").pathParams("id", id);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Program>> getAll(String search) async {
    var req = base.get.path(basePath).query("search", search);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> delete(String id) async {
    var req = base.delete.path(basePath).path("/:id").pathParams("id", id);
    await req.go(throwOnErr: true);
  }
}
