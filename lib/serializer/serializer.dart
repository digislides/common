import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:open_weather_api/simple.dart';

import 'package:common/models/models.dart';
import 'package:common/utils/published_at_format.dart';
export 'package:open_weather_api/simple.dart';

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
  ChannelRunningSerializer(),
  SimpleWeatherSerializer(),
  SimpleHourlyForecastsSerializer(),
  // TODO daily forecasts
]);

class Seconds2019Processor implements FieldProcessor<DateTime, int> {
  const Seconds2019Processor();

  int serialize(DateTime value) {
    if (value == null) return null;
    return (value.toUtc().difference(refDate)).inSeconds;
  }

  @override
  DateTime deserialize(int value) {
    if (value == null) return null;
    return refDate.add(Duration(seconds: value));
  }
}

class WeatherThemeProcessor implements FieldProcessor<WeatherTheme, int> {
  const WeatherThemeProcessor();

  @override
  WeatherTheme deserialize(int value) {
    if (value == null) return WeatherTheme.values[0];
    return WeatherTheme.values[value];
  }

  @override
  int serialize(WeatherTheme value) => value?.id;
}

class WeatherIconTypeProcessor
    implements FieldProcessor<WeatherIconType, String> {
  const WeatherIconTypeProcessor();

  @override
  WeatherIconType deserialize(String value) {
    if (value == null) return WeatherIconType.clearSky;
    return WeatherIconType.values[value];
  }

  @override
  String serialize(WeatherIconType value) => value?.id;
}

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

class TransitionFieldProcessor implements FieldProcessor<Transition, int> {
  const TransitionFieldProcessor();

  @override
  Transition deserialize(int value) {
    if (value == null) return Transition.none;
    return Transition.map[value];
  }

  @override
  int serialize(Transition value) => value?.id;
}

class VAlignFieldProcessor implements FieldProcessor<VAlign, int> {
  const VAlignFieldProcessor();

  @override
  VAlign deserialize(int value) {
    if (value == null) return VAlign.values[0];
    return VAlign.values[value];
  }

  @override
  int serialize(VAlign value) => value?.id;
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
    'publishedAt': Field(processor: Seconds2019Processor()),
  },
)
class ProgramSerializer extends Serializer<Program> with _$ProgramSerializer {}

@GenSerializer()
class PublishedProgramSerializer extends Serializer<PublishedProgram>
    with _$PublishedProgramSerializer {}

@GenSerializer(serializers: [FrameSerializer], ignore: ['dataRepository'])
class ProgramDesignSerializer extends Serializer<ProgramDesign>
    with _$ProgramDesignSerializer {}

@GenSerializer(fields: {
  'fit': Field(processor: FitFieldProcessor()),
  'transition': Field(processor: TransitionFieldProcessor())
}, ignore: [
  'onRectChange',
  'dataRepository'
])
class FrameSerializer extends Serializer<Frame> with _$FrameSerializer {}

@GenSerializer(fields: {
  'fit': Field(processor: FitFieldProcessor()),
  'transition': Field(processor: TransitionFieldProcessor())
}, ignore: [
  'dataRepository'
])
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

@GenSerializer(fields: {
  'align': Field(processor: AlignFieldProcessor()),
  'valign': Field(processor: VAlignFieldProcessor())
})
class FontPropertiesSerializer extends Serializer<FontProperties>
    with _$FontPropertiesSerializer {}

@GenSerializer(ignore: ['onRectChange', 'dataRepository', 'pos', 'rect'])
class TextItemSerializer extends Serializer<TextItem>
    with _$TextItemSerializer {
  static final serializer = TextItemSerializer();
}

@GenSerializer(
    ignore: ['onRectChange', 'pos', 'rect', 'dataRepository'],
    fields: {'fit': Field(processor: FitFieldProcessor())})
class ImageItemSerializer extends Serializer<ImageItem>
    with _$ImageItemSerializer {
  static final serializer = ImageItemSerializer();
}

@GenSerializer(
    ignore: ['onRectChange', 'pos', 'rect', 'dataRepository'],
    fields: {'fit': Field(processor: VideoFitFieldProcessor())})
class VideoItemSerializer extends Serializer<VideoItem>
    with _$VideoItemSerializer {
  static final serializer = VideoItemSerializer();
}

@GenSerializer(ignore: [
  'onRectChange',
  'onViewChange',
  'size',
  'pos',
  'rect',
  'dataRepository'
], fields: {
  'timezone': EnDecode(processor: DurationProcessor())
})
class ClockItemSerializer extends Serializer<ClockItem>
    with _$ClockItemSerializer {
  static final serializer = ClockItemSerializer();
}

@GenSerializer(ignore: [
  'onRectChange',
  'onViewChange',
  'size',
  'dataRepository',
  'pos',
  'rect',
], fields: {
  'theme': EnDecode(processor: WeatherThemeProcessor()),
  'dummy': EnDecode(processor: WeatherIconTypeProcessor())
})
class WeatherItemSerializer extends Serializer<WeatherItem>
    with _$WeatherItemSerializer {
  static final serializer = WeatherItemSerializer();
}

@GenSerializer()
class ChannelSerializer extends Serializer<Channel> with _$ChannelSerializer {}

@GenSerializer()
class ChannelRunningSerializer extends Serializer<ChannelRunning>
    with _$ChannelRunningSerializer {}

@GenSerializer()
class ChannelPublicSerializer extends Serializer<ChannelPublic>
    with _$ChannelPublicSerializer {}

@GenSerializer()
class ChannelCreatorSerializer extends Serializer<ChannelCreator>
    with _$ChannelCreatorSerializer {}
