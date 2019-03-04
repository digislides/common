import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'package:common/models/models.dart';

part 'serializer.jser.dart';

final repo = JsonRepo(serializers: [
  SignupSerializer(),
  LoginSerializer(),
  ProgramCreatorSerializer(),
  ProgramSerializer(),
  ProgramDesignSerializer(),
  PublishedProgramSerializer(),
  ChannelCreatorSerializer(),
  ChannelPublicSerializer(),
  ChannelSerializer(),
]);

class FitFieldProcessor implements FieldProcessor<Fit, int> {
  const FitFieldProcessor();

  @override
  Fit deserialize(int value) {
    if (value == null) return Fit.values[0];
    return Fit.values[value];
  }

  @override
  int serialize(Fit value) => value?.id;
}

class VideoFitFieldProcessor implements FieldProcessor<VideoFit, int> {
  const VideoFitFieldProcessor();

  @override
  VideoFit deserialize(int value) {
    if (value == null) return VideoFit.values[0];
    return VideoFit.values[value];
  }

  @override
  int serialize(VideoFit value) => value?.id;
}

class AlignFieldProcessor implements FieldProcessor<Align, int> {
  const AlignFieldProcessor();

  @override
  Align deserialize(int value) {
    if (value == null) return Align.values[0];
    return Align.values[value];
  }

  @override
  int serialize(Align value) => value?.id;
}

@GenSerializer()
class SignupSerializer extends Serializer<Signup> with _$SignupSerializer {
  static final serializer = SignupSerializer();
}

@GenSerializer()
class LoginSerializer extends Serializer<Login> with _$LoginSerializer {
  static final serializer = LoginSerializer();
}

@GenSerializer()
class UserSerializer extends Serializer<User> with _$UserSerializer {
  static final serializer = UserSerializer();
}

@GenSerializer()
class ProgramCreatorSerializer extends Serializer<ProgramCreator>
    with _$ProgramCreatorSerializer {
  static final serializer = ProgramCreatorSerializer();
}

@GenSerializer(
  fields: {
    'publishedAt': Field(processor: MillisecondsProcessor()),
  },
)
class ProgramSerializer extends Serializer<Program> with _$ProgramSerializer {}

@GenSerializer()
class PublishedProgramSerializer extends Serializer<PublishedProgram>
    with _$PublishedProgramSerializer {}

@GenSerializer(serializers: [FrameSerializer])
class ProgramDesignSerializer extends Serializer<ProgramDesign>
    with _$ProgramDesignSerializer {}

@GenSerializer(ignore: ['onRectChange'])
class FrameSerializer extends Serializer<Frame> with _$FrameSerializer {}

@GenSerializer(fields: {'fit': Field(processor: FitFieldProcessor())})
class PageSerializer extends Serializer<Page> with _$PageSerializer {}

class PageItemSerializer extends Serializer<PageItem> {
  @override
  PageItem fromMap(Map map) {
    if (map == null) return null;
    final type = map['type'];
    if (type is! int) return null;
    if (type == PageItemType.text.index)
      return TextItemSerializer.serializer.fromMap(map);
    if (type == PageItemType.image.index)
      return ImageItemSerializer.serializer.fromMap(map);
    if (type == PageItemType.video.index)
      return VideoItemSerializer.serializer.fromMap(map);
    if (type == PageItemType.clock.index)
      return ClockItemSerializer.serializer.fromMap(map);
    if (type == PageItemType.weather.index)
      return WeatherItemSerializer.serializer.fromMap(map);
    throw Exception("Unknown item!");
  }

  @override
  Map<String, dynamic> toMap(PageItem model) {
    if (model == null) return null;
    if (model is TextItem) return TextItemSerializer.serializer.toMap(model);
    if (model is ImageItem) return ImageItemSerializer.serializer.toMap(model);
    if (model is VideoItem) return VideoItemSerializer.serializer.toMap(model);
    if (model is ClockItem) return ClockItemSerializer.serializer.toMap(model);
    if (model is WeatherItem)
      return WeatherItemSerializer.serializer.toMap(model);
    throw Exception("Unknown item!");
  }
}

@GenSerializer(fields: {'align': Field(processor: AlignFieldProcessor())})
class FontPropertiesSerializer extends Serializer<FontProperties>
    with _$FontPropertiesSerializer {}

@GenSerializer(ignore: ['onRectChange'])
class TextItemSerializer extends Serializer<TextItem>
    with _$TextItemSerializer {
  static final serializer = TextItemSerializer();
}

@GenSerializer(
    ignore: ['onRectChange'],
    fields: {'fit': Field(processor: FitFieldProcessor())})
class ImageItemSerializer extends Serializer<ImageItem>
    with _$ImageItemSerializer {
  static final serializer = ImageItemSerializer();
}

@GenSerializer(
    ignore: ['onRectChange'],
    fields: {'fit': Field(processor: VideoFitFieldProcessor())})
class VideoItemSerializer extends Serializer<VideoItem>
    with _$VideoItemSerializer {
  static final serializer = VideoItemSerializer();
}

@GenSerializer(ignore: ['onRectChange', 'size'], fields: {})
class ClockItemSerializer extends Serializer<ClockItem>
    with _$ClockItemSerializer {
  static final serializer = ClockItemSerializer();
}

@GenSerializer(ignore: ['onRectChange'], fields: {})
class WeatherItemSerializer extends Serializer<WeatherItem>
    with _$WeatherItemSerializer {
  static final serializer = WeatherItemSerializer();
}

@GenSerializer()
class ChannelSerializer extends Serializer<Channel> with _$ChannelSerializer {}

@GenSerializer()
class ChannelPublicSerializer extends Serializer<ChannelPublic>
    with _$ChannelPublicSerializer {}

@GenSerializer()
class ChannelCreatorSerializer extends Serializer<ChannelCreator>
    with _$ChannelCreatorSerializer {}
