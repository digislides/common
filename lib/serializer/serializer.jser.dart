// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializer.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SignupSerializer implements Serializer<Signup> {
  @override
  Map<String, dynamic> toMap(Signup model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  Signup fromMap(Map map) {
    if (map == null) return null;
    final obj = new Signup();
    obj.email = map['email'] as String;
    obj.name = map['name'] as String;
    obj.password = map['password'] as String;
    return obj;
  }
}

abstract class _$LoginSerializer implements Serializer<Login> {
  @override
  Map<String, dynamic> toMap(Login model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  Login fromMap(Map map) {
    if (map == null) return null;
    final obj = new Login();
    obj.username = map['username'] as String;
    obj.password = map['password'] as String;
    return obj;
  }
}

abstract class _$UserSerializer implements Serializer<User> {
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'name', model.name);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = new User();
    obj.id = map['id'] as String;
    obj.email = map['email'] as String;
    obj.name = map['name'] as String;
    return obj;
  }
}

abstract class _$ProgramCreatorSerializer
    implements Serializer<ProgramCreator> {
  @override
  Map<String, dynamic> toMap(ProgramCreator model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  ProgramCreator fromMap(Map map) {
    if (map == null) return null;
    final obj = new ProgramCreator();
    obj.name = map['name'] as String;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$ProgramSerializer implements Serializer<Program> {
  final _seconds2019Processor = const Seconds2019Processor();
  Serializer<ProgramDesign> __programDesignSerializer;
  Serializer<ProgramDesign> get _programDesignSerializer =>
      __programDesignSerializer ??= new ProgramDesignSerializer();
  @override
  Map<String, dynamic> toMap(Program model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'design', _programDesignSerializer.toMap(model.design));
    setMapValue(
        ret, 'publishedAt', _seconds2019Processor.serialize(model.publishedAt));
    setMapValue(
        ret, 'published', _programDesignSerializer.toMap(model.published));
    return ret;
  }

  @override
  Program fromMap(Map map) {
    if (map == null) return null;
    final obj = new Program();
    obj.id = map['id'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.name = map['name'] as String;
    obj.design = _programDesignSerializer.fromMap(map['design'] as Map);
    obj.publishedAt =
        _seconds2019Processor.deserialize(map['publishedAt'] as int);
    obj.published = _programDesignSerializer.fromMap(map['published'] as Map);
    return obj;
  }
}

abstract class _$PublishedProgramSerializer
    implements Serializer<PublishedProgram> {
  Serializer<ProgramDesign> __programDesignSerializer;
  Serializer<ProgramDesign> get _programDesignSerializer =>
      __programDesignSerializer ??= new ProgramDesignSerializer();
  @override
  Map<String, dynamic> toMap(PublishedProgram model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'design', _programDesignSerializer.toMap(model.design));
    return ret;
  }

  @override
  PublishedProgram fromMap(Map map) {
    if (map == null) return null;
    final obj = new PublishedProgram();
    obj.id = map['id'] as String;
    obj.design = _programDesignSerializer.fromMap(map['design'] as Map);
    return obj;
  }
}

abstract class _$ProgramDesignSerializer implements Serializer<ProgramDesign> {
  final _fitFieldProcessor = const FitFieldProcessor();
  Serializer<Frame> __frameSerializer;
  Serializer<Frame> get _frameSerializer =>
      __frameSerializer ??= new FrameSerializer();
  @override
  Map<String, dynamic> toMap(ProgramDesign model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(
        ret,
        'frames',
        codeIterable(
            model.frames, (val) => _frameSerializer.toMap(val as Frame)));
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'fit', _fitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'imageUrl', model.imageUrl);
    return ret;
  }

  @override
  ProgramDesign fromMap(Map map) {
    if (map == null) return null;
    final obj = new ProgramDesign(
        frames: codeIterable<Frame>(map['frames'] as Iterable,
                (val) => _frameSerializer.fromMap(val as Map)) ??
            getJserDefault('frames'));
    obj.color = map['color'] as String;
    obj.url = map['url'] as String;
    obj.fit = _fitFieldProcessor.deserialize(map['fit'] as int);
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$FrameSerializer implements Serializer<Frame> {
  final _fitFieldProcessor = const FitFieldProcessor();
  final _transitionFieldProcessor = const TransitionFieldProcessor();
  Serializer<Page> __pageSerializer;
  Serializer<Page> get _pageSerializer =>
      __pageSerializer ??= new PageSerializer();
  @override
  Map<String, dynamic> toMap(Frame model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'pages',
        codeIterable(model.pages, (val) => _pageSerializer.toMap(val as Page)));
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'fit', _fitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'transition',
        _transitionFieldProcessor.serialize(model.transition));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'imageUrl', model.imageUrl);
    return ret;
  }

  @override
  Frame fromMap(Map map) {
    if (map == null) return null;
    final obj = new Frame(
        pages: codeIterable<Page>(map['pages'] as Iterable,
                (val) => _pageSerializer.fromMap(val as Map)) ??
            getJserDefault('pages'));
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['color'] as String;
    obj.image = map['image'] as String;
    obj.fit = _fitFieldProcessor.deserialize(map['fit'] as int);
    obj.transition =
        _transitionFieldProcessor.deserialize(map['transition'] as int);
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$PageSerializer implements Serializer<Page> {
  final _fitFieldProcessor = const FitFieldProcessor();
  final _transitionFieldProcessor = const TransitionFieldProcessor();
  Serializer<PageItem> __pageItemSerializer;
  Serializer<PageItem> get _pageItemSerializer =>
      __pageItemSerializer ??= new PageItemSerializer();
  @override
  Map<String, dynamic> toMap(Page model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'fit', _fitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'transition',
        _transitionFieldProcessor.serialize(model.transition));
    setMapValue(
        ret,
        'items',
        codeIterable(
            model.items, (val) => _pageItemSerializer.toMap(val as PageItem)));
    setMapValue(ret, 'imageUrl', model.imageUrl);
    setMapValue(ret, 'duration', model.duration);
    return ret;
  }

  @override
  Page fromMap(Map map) {
    if (map == null) return null;
    final obj = new Page(
        items: codeIterable<PageItem>(map['items'] as Iterable,
                (val) => _pageItemSerializer.fromMap(val as Map)) ??
            getJserDefault('items'));
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    obj.color = map['color'] as String;
    obj.image = map['image'] as String;
    obj.fit = _fitFieldProcessor.deserialize(map['fit'] as int);
    obj.transition =
        _transitionFieldProcessor.deserialize(map['transition'] as int);
    obj.duration = map['duration'] as int;
    return obj;
  }
}

abstract class _$FontPropertiesSerializer
    implements Serializer<FontProperties> {
  final _alignFieldProcessor = const AlignFieldProcessor();
  final _vAlignFieldProcessor = const VAlignFieldProcessor();
  @override
  Map<String, dynamic> toMap(FontProperties model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'align', _alignFieldProcessor.serialize(model.align));
    setMapValue(ret, 'valign', _vAlignFieldProcessor.serialize(model.valign));
    setMapValue(ret, 'family', model.family);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'bold', model.bold);
    setMapValue(ret, 'italic', model.italic);
    setMapValue(ret, 'underline', model.underline);
    setMapValue(ret, 'size', model.size);
    return ret;
  }

  @override
  FontProperties fromMap(Map map) {
    if (map == null) return null;
    final obj = new FontProperties();
    obj.align = _alignFieldProcessor.deserialize(map['align'] as int);
    obj.valign = _vAlignFieldProcessor.deserialize(map['valign'] as int);
    obj.family = map['family'] as String;
    obj.color = map['color'] as String;
    obj.bold = map['bold'] as bool;
    obj.italic = map['italic'] as bool;
    obj.underline = map['underline'] as bool;
    obj.size = map['size'] as int;
    return obj;
  }
}

abstract class _$TextItemSerializer implements Serializer<TextItem> {
  Serializer<FontProperties> __fontPropertiesSerializer;
  Serializer<FontProperties> get _fontPropertiesSerializer =>
      __fontPropertiesSerializer ??= new FontPropertiesSerializer();
  @override
  Map<String, dynamic> toMap(TextItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'type', model.type.index);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'font', _fontPropertiesSerializer.toMap(model.font));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'text', model.text);
    setMapValue(ret, 'linkedText', model.linkedText);
    return ret;
  }

  @override
  TextItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new TextItem(
        font: _fontPropertiesSerializer.fromMap(map['font'] as Map) ??
            getJserDefault('font'));
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['color'] as String;
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    obj.text = map['text'] as String;
    return obj;
  }
}

abstract class _$ImageItemSerializer implements Serializer<ImageItem> {
  final _fitFieldProcessor = const FitFieldProcessor();
  @override
  Map<String, dynamic> toMap(ImageItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'type', model.type.index);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'fit', _fitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'imageUrl', model.imageUrl);
    return ret;
  }

  @override
  ImageItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new ImageItem();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['color'] as String;
    obj.url = map['url'] as String;
    obj.fit = _fitFieldProcessor.deserialize(map['fit'] as int);
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$VideoItemSerializer implements Serializer<VideoItem> {
  final _videoFitFieldProcessor = const VideoFitFieldProcessor();
  @override
  Map<String, dynamic> toMap(VideoItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'type', model.type.index);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'fit', _videoFitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'muted', model.muted);
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'videoUrl', model.videoUrl);
    return ret;
  }

  @override
  VideoItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new VideoItem();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['color'] as String;
    obj.url = map['url'] as String;
    obj.fit = _videoFitFieldProcessor.deserialize(map['fit'] as int);
    obj.muted = map['muted'] as bool;
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$ClockItemSerializer implements Serializer<ClockItem> {
  final _durationProcessor = const DurationProcessor();
  @override
  Map<String, dynamic> toMap(ClockItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'type', model.type.index);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'textColor', model.textColor);
    setMapValue(ret, 'hourColor', model.hourColor);
    setMapValue(ret, 'minuteColor', model.minuteColor);
    setMapValue(ret, 'timezone', _durationProcessor.serialize(model.timezone));
    setMapValue(ret, 'imageUrl', model.imageUrl);
    return ret;
  }

  @override
  ClockItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new ClockItem();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    obj.color = map['color'] as String;
    obj.url = map['url'] as String;
    obj.textColor = map['textColor'] as String;
    obj.hourColor = map['hourColor'] as String;
    obj.minuteColor = map['minuteColor'] as String;
    obj.timezone = _durationProcessor.deserialize(map['timezone'] as int);
    return obj;
  }
}

abstract class _$WeatherItemSerializer implements Serializer<WeatherItem> {
  final _weatherThemeProcessor = const WeatherThemeProcessor();
  final _weatherIconTypeProcessor = const WeatherIconTypeProcessor();
  @override
  Map<String, dynamic> toMap(WeatherItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'type', model.type.index);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'theme', _weatherThemeProcessor.serialize(model.theme));
    setMapValue(ret, 'dummy', _weatherIconTypeProcessor.serialize(model.dummy));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  WeatherItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new WeatherItem();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['color'] as String;
    obj.theme = _weatherThemeProcessor.deserialize(map['theme'] as int);
    obj.dummy = _weatherIconTypeProcessor.deserialize(map['dummy'] as String);
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$ChannelSerializer implements Serializer<Channel> {
  Serializer<ChannelRunning> __channelRunningSerializer;
  Serializer<ChannelRunning> get _channelRunningSerializer =>
      __channelRunningSerializer ??= new ChannelRunningSerializer();
  @override
  Map<String, dynamic> toMap(Channel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'program', model.program);
    setMapValue(ret, 'running', _channelRunningSerializer.toMap(model.running));
    return ret;
  }

  @override
  Channel fromMap(Map map) {
    if (map == null) return null;
    final obj = new Channel();
    obj.id = map['id'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.name = map['name'] as String;
    obj.program = map['program'] as String;
    obj.running = _channelRunningSerializer.fromMap(map['running'] as Map);
    return obj;
  }
}

abstract class _$ChannelRunningSerializer
    implements Serializer<ChannelRunning> {
  @override
  Map<String, dynamic> toMap(ChannelRunning model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'running', model.running);
    setMapValue(ret, 'when', dateTimeUtcProcessor.serialize(model.when));
    return ret;
  }

  @override
  ChannelRunning fromMap(Map map) {
    if (map == null) return null;
    final obj = new ChannelRunning();
    obj.running = map['running'] as String;
    obj.when = dateTimeUtcProcessor.deserialize(map['when'] as String);
    return obj;
  }
}

abstract class _$ChannelPublicSerializer implements Serializer<ChannelPublic> {
  Serializer<ChannelRunning> __channelRunningSerializer;
  Serializer<ChannelRunning> get _channelRunningSerializer =>
      __channelRunningSerializer ??= new ChannelRunningSerializer();
  @override
  Map<String, dynamic> toMap(ChannelPublic model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'running', _channelRunningSerializer.toMap(model.running));
    return ret;
  }

  @override
  ChannelPublic fromMap(Map map) {
    if (map == null) return null;
    final obj = new ChannelPublic();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.running = _channelRunningSerializer.fromMap(map['running'] as Map);
    return obj;
  }
}

abstract class _$ChannelCreatorSerializer
    implements Serializer<ChannelCreator> {
  @override
  Map<String, dynamic> toMap(ChannelCreator model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'program', model.program);
    return ret;
  }

  @override
  ChannelCreator fromMap(Map map) {
    if (map == null) return null;
    final obj = new ChannelCreator();
    obj.name = map['name'] as String;
    obj.program = map['program'] as String;
    return obj;
  }
}

abstract class _$DateIntervalSerializer implements Serializer<DateInterval> {
  final _millisecondsProcessor = const MillisecondsProcessor();
  @override
  Map<String, dynamic> toMap(DateInterval model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'start', _millisecondsProcessor.serialize(model.start));
    setMapValue(ret, 'end', _millisecondsProcessor.serialize(model.end));
    return ret;
  }

  @override
  DateInterval fromMap(Map map) {
    if (map == null) return null;
    final obj = new DateInterval();
    obj.start = _millisecondsProcessor.deserialize(map['start'] as int);
    obj.end = _millisecondsProcessor.deserialize(map['end'] as int);
    return obj;
  }
}

abstract class _$TimeIntervalSerializer implements Serializer<TimeInterval> {
  @override
  Map<String, dynamic> toMap(TimeInterval model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'start', model.start);
    setMapValue(ret, 'stop', model.stop);
    setMapValue(ret, 'isValid', model.isValid);
    return ret;
  }

  @override
  TimeInterval fromMap(Map map) {
    if (map == null) return null;
    final obj = new TimeInterval();
    obj.start = map['start'] as int;
    obj.stop = map['stop'] as int;
    return obj;
  }
}

abstract class _$WeekScheduleSerializer implements Serializer<WeekSchedule> {
  Serializer<TimeInterval> __timeIntervalSerializer;
  Serializer<TimeInterval> get _timeIntervalSerializer =>
      __timeIntervalSerializer ??= new TimeIntervalSerializer();
  Serializer<DateInterval> __dateIntervalSerializer;
  Serializer<DateInterval> get _dateIntervalSerializer =>
      __dateIntervalSerializer ??= new DateIntervalSerializer();
  @override
  Map<String, dynamic> toMap(WeekSchedule model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'dayMap', model.dayMap);
    setMapValue(
        ret,
        'times',
        codeIterable(model.times,
            (val) => _timeIntervalSerializer.toMap(val as TimeInterval)));
    setMapValue(ret, 'date', _dateIntervalSerializer.toMap(model.date));
    setMapValue(ret, 'not', model.not);
    return ret;
  }

  @override
  WeekSchedule fromMap(Map map) {
    if (map == null) return null;
    final obj = new WeekSchedule();
    obj.dayMap = map['dayMap'] as int;
    obj.times = codeIterable<TimeInterval>(map['times'] as Iterable,
        (val) => _timeIntervalSerializer.fromMap(val as Map));
    obj.date = _dateIntervalSerializer.fromMap(map['date'] as Map);
    obj.not = map['not'] as bool;
    return obj;
  }
}

abstract class _$PageScheduleSerializer implements Serializer<PageSchedule> {
  Serializer<WeekSchedule> __weekScheduleSerializer;
  Serializer<WeekSchedule> get _weekScheduleSerializer =>
      __weekScheduleSerializer ??= new WeekScheduleSerializer();
  @override
  Map<String, dynamic> toMap(PageSchedule model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(
        ret,
        'schedule',
        codeIterable(model.schedule,
            (val) => _weekScheduleSerializer.toMap(val as WeekSchedule)));
    return ret;
  }

  @override
  PageSchedule fromMap(Map map) {
    if (map == null) return null;
    final obj = new PageSchedule();
    obj.schedule = codeIterable<WeekSchedule>(map['schedule'] as Iterable,
        (val) => _weekScheduleSerializer.fromMap(val as Map));
    return obj;
  }
}

abstract class _$MonitorSerializer implements Serializer<Monitor> {
  @override
  Map<String, dynamic> toMap(Monitor model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(
        ret, 'fields', codeIterable(model.fields, (val) => val as String));
    return ret;
  }

  @override
  Monitor fromMap(Map map) {
    if (map == null) return null;
    final obj = new Monitor();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.fields =
        codeIterable<String>(map['fields'] as Iterable, (val) => val as String);
    return obj;
  }
}

abstract class _$MonitorCreatorSerializer
    implements Serializer<MonitorCreator> {
  @override
  Map<String, dynamic> toMap(MonitorCreator model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(
        ret, 'fields', codeIterable(model.fields, (val) => val as String));
    return ret;
  }

  @override
  MonitorCreator fromMap(Map map) {
    if (map == null) return null;
    final obj = new MonitorCreator();
    obj.name = map['name'] as String;
    obj.fields =
        codeIterable<String>(map['fields'] as Iterable, (val) => val as String);
    return obj;
  }
}

abstract class _$MediaImageSerializer implements Serializer<MediaImage> {
  @override
  Map<String, dynamic> toMap(MediaImage model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(ret, 'tags', codeIterable(model.tags, (val) => val as String));
    setMapValue(ret, 'extension', model.extension);
    setMapValue(ret, 'storage', model.storage);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'urlCss', model.urlCss);
    return ret;
  }

  @override
  MediaImage fromMap(Map map) {
    if (map == null) return null;
    final obj = new MediaImage();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.tags =
        codeIterable<String>(map['tags'] as Iterable, (val) => val as String);
    obj.extension = map['extension'] as String;
    obj.storage = map['storage'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$MediaVideoSerializer implements Serializer<MediaVideo> {
  @override
  Map<String, dynamic> toMap(MediaVideo model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(ret, 'tags', codeIterable(model.tags, (val) => val as String));
    setMapValue(ret, 'extension', model.extension);
    setMapValue(ret, 'storage', model.storage);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    setMapValue(ret, 'length', model.length);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'urlCss', model.urlCss);
    return ret;
  }

  @override
  MediaVideo fromMap(Map map) {
    if (map == null) return null;
    final obj = new MediaVideo();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.tags =
        codeIterable<String>(map['tags'] as Iterable, (val) => val as String);
    obj.extension = map['extension'] as String;
    obj.storage = map['storage'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    obj.length = map['length'] as int;
    return obj;
  }
}

abstract class _$MediaAudioSerializer implements Serializer<MediaAudio> {
  @override
  Map<String, dynamic> toMap(MediaAudio model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(ret, 'tags', codeIterable(model.tags, (val) => val as String));
    setMapValue(ret, 'extension', model.extension);
    setMapValue(ret, 'storage', model.storage);
    setMapValue(ret, 'length', model.length);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'urlCss', model.urlCss);
    return ret;
  }

  @override
  MediaAudio fromMap(Map map) {
    if (map == null) return null;
    final obj = new MediaAudio();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.tags =
        codeIterable<String>(map['tags'] as Iterable, (val) => val as String);
    obj.extension = map['extension'] as String;
    obj.storage = map['storage'] as int;
    obj.length = map['length'] as int;
    return obj;
  }
}

abstract class _$MediaFontSerializer implements Serializer<MediaFont> {
  @override
  Map<String, dynamic> toMap(MediaFont model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'members', codeMap(model.members, (val) => val as int));
    setMapValue(ret, 'tags', codeIterable(model.tags, (val) => val as String));
    setMapValue(ret, 'extension', model.extension);
    setMapValue(ret, 'storage', model.storage);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'urlCss', model.urlCss);
    return ret;
  }

  @override
  MediaFont fromMap(Map map) {
    if (map == null) return null;
    final obj = new MediaFont();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.owner = map['owner'] as String;
    obj.members = codeMap<int>(map['members'] as Map, (val) => val as int);
    obj.tags =
        codeIterable<String>(map['tags'] as Iterable, (val) => val as String);
    obj.extension = map['extension'] as String;
    obj.storage = map['storage'] as int;
    return obj;
  }
}

abstract class _$MediaCreatorSerializer implements Serializer<MediaCreator> {
  @override
  Map<String, dynamic> toMap(MediaCreator model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'tags', codeIterable(model.tags, (val) => val as String));
    return ret;
  }

  @override
  MediaCreator fromMap(Map map) {
    if (map == null) return null;
    final obj = new MediaCreator();
    obj.name = map['name'] as String;
    obj.tags =
        codeIterable<String>(map['tags'] as Iterable, (val) => val as String);
    return obj;
  }
}
