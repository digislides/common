// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializer.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ProgramCreatorSerializer
    implements Serializer<ProgramCreator> {
  @override
  Map<String, dynamic> toMap(ProgramCreator model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'owner', model.owner);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  ProgramCreator fromMap(Map map) {
    if (map == null) return null;
    final obj = new ProgramCreator();
    obj.id = map['id'] as String;
    obj.owner = map['owner'] as String;
    obj.name = map['name'] as String;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$ProgramSerializer implements Serializer<Program> {
  Serializer<ProgramDesign> __programDesignSerializer;
  Serializer<ProgramDesign> get _programDesignSerializer =>
      __programDesignSerializer ??= new ProgramDesignSerializer();
  @override
  Map<String, dynamic> toMap(Program model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'design', _programDesignSerializer.toMap(model.design));
    return ret;
  }

  @override
  Program fromMap(Map map) {
    if (map == null) return null;
    final obj = new Program();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.design = _programDesignSerializer.fromMap(map['design'] as Map);
    return obj;
  }
}

abstract class _$ProgramDesignSerializer implements Serializer<ProgramDesign> {
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
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  ProgramDesign fromMap(Map map) {
    if (map == null) return null;
    final obj = new ProgramDesign();
    obj.frames = codeIterable<Frame>(map['frames'] as Iterable,
        (val) => _frameSerializer.fromMap(val as Map));
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$FrameSerializer implements Serializer<Frame> {
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
    setMapValue(ret, 'fullview', model.fullview);
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  Frame fromMap(Map map) {
    if (map == null) return null;
    final obj = new Frame();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.pages = codeIterable<Page>(
        map['pages'] as Iterable, (val) => _pageSerializer.fromMap(val as Map));
    obj.fullview = map['fullview'] as bool;
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.color = map['color'] as String;
    obj.image = map['image'] as String;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}

abstract class _$PageSerializer implements Serializer<Page> {
  final _fitFieldProcessor = const FitFieldProcessor();
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
    setMapValue(ret, 'duration', model.duration);
    setMapValue(ret, 'transition', model.transition);
    setMapValue(ret, 'transitionDuration', model.transitionDuration);
    setMapValue(
        ret,
        'items',
        codeIterable(
            model.items, (val) => _pageItemSerializer.toMap(val as PageItem)));
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
    obj.duration = map['duration'] as int;
    obj.transition = map['transition'] as int;
    obj.transitionDuration = map['transitionDuration'] as num;
    return obj;
  }
}

abstract class _$FontPropertiesSerializer
    implements Serializer<FontProperties> {
  final _alignFieldProcessor = const AlignFieldProcessor();
  @override
  Map<String, dynamic> toMap(FontProperties model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'size', model.size);
    setMapValue(ret, 'align', _alignFieldProcessor.serialize(model.align));
    setMapValue(ret, 'family', model.family);
    setMapValue(ret, 'color', model.color);
    setMapValue(ret, 'bold', model.bold);
    setMapValue(ret, 'italic', model.italic);
    setMapValue(ret, 'underline', model.underline);
    return ret;
  }

  @override
  FontProperties fromMap(Map map) {
    if (map == null) return null;
    final obj = new FontProperties();
    obj.size = map['size'] as int;
    obj.align = _alignFieldProcessor.deserialize(map['align'] as int);
    obj.family = map['family'] as String;
    obj.color = map['color'] as String;
    obj.bold = map['bold'] as bool;
    obj.italic = map['italic'] as bool;
    obj.underline = map['underline'] as bool;
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
    setMapValue(ret, 'bgColor', model.color);
    setMapValue(ret, 'text', model.text);
    setMapValue(ret, 'font', _fontPropertiesSerializer.toMap(model.font));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
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
    obj.color = map['bgColor'] as String;
    obj.text = map['text'] as String;
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
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
    setMapValue(ret, 'bgColor', model.color);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'fit', _fitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  ImageItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new ImageItem();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['bgColor'] as String;
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
  final _fitFieldProcessor = const FitFieldProcessor();
  @override
  Map<String, dynamic> toMap(VideoItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'type', model.type.index);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'bgColor', model.color);
    setMapValue(ret, 'url', model.url);
    setMapValue(ret, 'fit', _fitFieldProcessor.serialize(model.fit));
    setMapValue(ret, 'left', model.left);
    setMapValue(ret, 'top', model.top);
    setMapValue(ret, 'width', model.width);
    setMapValue(ret, 'height', model.height);
    return ret;
  }

  @override
  VideoItem fromMap(Map map) {
    if (map == null) return null;
    final obj = new VideoItem();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.color = map['bgColor'] as String;
    obj.url = map['url'] as String;
    obj.fit = _fitFieldProcessor.deserialize(map['fit'] as int);
    obj.left = map['left'] as int;
    obj.top = map['top'] as int;
    obj.width = map['width'] as int;
    obj.height = map['height'] as int;
    return obj;
  }
}
