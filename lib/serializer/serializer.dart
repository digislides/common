import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'package:common/models/models.dart';

part 'serializer.jser.dart';

@GenSerializer()
class ProgramCreatorSerializer extends Serializer<ProgramCreator>
    with _$ProgramCreatorSerializer {}

    /*
@GenSerializer()
class ProgramSerializer extends Serializer<Program>
    with _$ProgramSerializer {}
    */
