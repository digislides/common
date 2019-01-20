import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'package:common/models/models.dart';

part 'serializer.jser.dart';

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
class ProgramCreatorSerializer extends Serializer<ProgramCreator>
    with _$ProgramCreatorSerializer {}

@GenSerializer()
class ProgramSerializer extends Serializer<Program> with _$ProgramSerializer {}

@GenSerializer(serializers: [FrameSerializer])
class ProgramDesignSerializer extends Serializer<ProgramDesign>
    with _$ProgramDesignSerializer {}

@GenSerializer()
class FrameSerializer extends Serializer<Frame> with _$FrameSerializer {}

@GenSerializer(fields: {'fit': Field(processor: FitFieldProcessor())})
class PageSerializer extends Serializer<Page> with _$PageSerializer {}

class PageItemSerializer extends Serializer<PageItem> {
  @override
  PageItem fromMap(Map map) {
    // TODO
  }

  @override
  Map<String, dynamic> toMap(PageItem model) {
    // TODO
  }
}

@GenSerializer(fields: {'align': Field(processor: AlignFieldProcessor())})
class FontPropertiesSerializer extends Serializer<FontProperties>
    with _$FontPropertiesSerializer {}

@GenSerializer(ignore: ['onRectChange'])
class TextItemSerializer extends Serializer<TextItem>
    with _$TextItemSerializer {}

@GenSerializer(
    ignore: ['onRectChange'],
    fields: {'fit': Field(processor: FitFieldProcessor())})
class ImageItemSerializer extends Serializer<ImageItem>
    with _$ImageItemSerializer {}

@GenSerializer(
    ignore: ['onRectChange'],
    fields: {'fit': Field(processor: FitFieldProcessor())})
class VideoItemSerializer extends Serializer<VideoItem>
    with _$VideoItemSerializer {}

// TODO items
