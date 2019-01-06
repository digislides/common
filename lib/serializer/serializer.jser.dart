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
