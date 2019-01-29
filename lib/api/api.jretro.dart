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
