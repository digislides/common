import 'package:bson_objectid/bson_objectid.dart';

String get newId => ObjectId().toHexString();
