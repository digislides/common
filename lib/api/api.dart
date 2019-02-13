import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:common/models.dart';
import 'package:common/serializer/serializer.dart';

part 'api.jretro.dart';

@GenApiClient(path: '/auth')
class AuthApi extends ApiClient with _$AuthApiClient {
  final Route base;

  AuthApi(this.base) {
    jsonConverter = repo;
  }

  @PostReq(path: '/signup')
  Future<void> signup(@AsJson() Signup model) => super.signup(model);

  @PostReq(path: '/login')
  Future<StringResponse> login(@AsJson() Login model) => super.login(model);
}

@GenApiClient(path: '/program')
class ProgramApi extends ApiClient with _$ProgramApiClient {
  final Route base;

  ProgramApi(this.base) {
    jsonConverter = repo;
  }

  @PostReq()
  Future<Program> create(@AsJson() ProgramCreator model) => super.create(model);

  @PutReq(path: '/:id')
  Future<void> save(@PathParam() String id, @AsJson() ProgramDesign data) =>
      super.save(id, data);

  @PostReq(path: '/publish/:id')
  Future<void> publish(@PathParam() String id, @AsJson() ProgramDesign data) =>
      super.publish(id, data);

  @GetReq(path: '/:id')
  Future<Program> getById(@PathParam() String id) => super.getById(id);

  @GetReq()
  Future<List<Program>> getAll(@QueryParam() String search) =>
      super.getAll(search);

  @DeleteReq(path: '/:id')
  Future<void> delete(@PathParam() String id) => super.delete(id);

  // TODO transferOwnership

  // TODO getAll

  // TODO duplicate
}

@GenApiClient(path: '/channel')
class ChannelApi extends ApiClient with _$ChannelApiClient {
  final Route base;

  ChannelApi(this.base) {
    jsonConverter = repo;
  }

  @PostReq()
  Future<Channel> create(@AsJson() ChannelCreator model) => super.create(model);

  /*
  @PutReq(path: '/:id')
  Future<void> save(@PathParam() String id, @AsJson() Channel data) =>
      super.save(id, data);
      */

  @GetReq(path: '/:id')
  Future<Channel> getById(@PathParam() String id) => super.getById(id);

  @GetReq()
  Future<List<Channel>> getAll(@QueryParam() String search) =>
      super.getAll(search);

  @DeleteReq(path: '/:id')
  Future<void> delete(@PathParam() String id) => super.delete(id);
}
