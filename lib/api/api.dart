import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:common/models.dart';
import 'package:common/serializer/serializer.dart';

part 'api.jretro.dart';

final base = Route("");

final authApi = AuthApi(base);

final programApi = ProgramApi(base);

final channelApi = ChannelApi(base);

final weatherApi = WeatherApi(base);

final mediaImageApi = MediaImageApi(base);

@GenApiClient(path: '/api/auth')
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

@GenApiClient(path: '/api/program')
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

  @PostReq(path: '/:id/publish')
  Future<void> publish(@PathParam() String id, @AsJson() ProgramDesign data) =>
      super.publish(id, data);

  @GetReq(path: '/:id/published')
  Future<PublishedProgram> getPublished(@PathParam() String id) =>
      super.getPublished(id);

  @GetReq(path: '/:id')
  Future<Program> getById(@PathParam() String id) => super.getById(id);

  @GetReq()
  Future<List<Program>> getAll(@QueryParam() String search) =>
      super.getAll(search);

  @GetReq()
  Future<List<Program>> getRecent() => super.getRecent();

  @DeleteReq(path: '/:id')
  Future<void> delete(@PathParam() String id) => super.delete(id);

  @PostReq(path: '/:id/name/:name')
  Future<void> setName(@PathParam() String id, @PathParam() String name) =>
      super.setName(id, name);

  // TODO transferOwnership

  // TODO duplicate
}

@GenApiClient(path: '/api/channel')
class ChannelApi extends ApiClient with _$ChannelApiClient {
  final Route base;

  ChannelApi(this.base) {
    jsonConverter = repo;
  }

  @PostReq()
  Future<Channel> create(@AsJson() ChannelCreator model) => super.create(model);

  // TODO duplicate

  @PutReq(path: '/:id')
  Future<Channel> save(
          @PathParam() String id, @AsJson() ChannelCreator model) =>
      super.save(id, model);

  @GetReq(path: '/:id')
  Future<Channel> getById(@PathParam() String id) => super.getById(id);

  @GetReq()
  Future<List<Channel>> getAll(@QueryParam() String search) =>
      super.getAll(search);

  @DeleteReq(path: '/:id')
  Future<void> delete(@PathParam() String id) => super.delete(id);

  @GetReq(path: '/:id/version')
  Future<String> getVersion(@PathParam() String id) => super.getVersion(id);

  @GetReq(path: '/:id/content')
  Future<PublishedProgram> getContent(@PathParam() String id) =>
      super.getContent(id);

  @PutReq(path: '/:id/playing')
  Future<void> setPlaying(
          @PathParam() String id, @QueryParam() String running) =>
      super.setPlaying(id, running);
}

@GenApiClient(path: '/api/data/weather')
class WeatherApi extends ApiClient with _$WeatherApiClient {
  final Route base;

  WeatherApi(this.base) {
    jsonConverter = repo;
  }

  @GetReq(path: '/current/:place')
  Future<Weather> getByName(@PathParam() String place) =>
      super.getByName(place);

  @GetReq(path: '/hourly/:place')
  Future<HourlyForecasts> getHourlyByName(@PathParam() String place) =>
      super.getHourlyByName(place);
}

@GenApiClient(path: '/api/media/image')
class MediaImageApi extends ApiClient with _$MediaImageApiClient {
  final Route base;

  MediaImageApi(this.base) {
    jsonConverter = repo;
  }

  @PostReq()
  Future<MediaImage> create(@AsMultipart() MediaCreator model,
          @AsMultipartField() MultipartFile file) =>
      super.create(model, file);

  @GetReq()
  Future<List<MediaImage>> getAll(@QueryParam() String search) =>
      super.getAll(search);

  /*
  @PutReq(path: '/:id')
  Future<Channel> save(
      @PathParam() String id, @AsJson() ChannelCreator model) =>
      super.save(id, model);

  @GetReq(path: '/:id')
  Future<Channel> getById(@PathParam() String id) => super.getById(id);

  @DeleteReq(path: '/:id')
  Future<void> delete(@PathParam() String id) => super.delete(id);
      */
}
