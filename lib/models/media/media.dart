import 'package:common/serializer/serializer.dart';

import 'package:common/models/has_access.dart';

class MediaCreator {
  String name;

  List<String> tags;

  MediaCreator({this.name, this.tags});

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MediaCreatorSerializer();
}

abstract class Media implements HasAccess {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<String> tags;

  String extension;

  int storage;

  String get url => "/m/$id$extension";

  String get urlCss => "url($url)";
}

class MediaImage extends HasAccess implements Media {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<String> tags;

  String extension;

  int storage;

  int width;

  int height;

  MediaImage(
      {this.id,
      this.name,
      this.owner,
      this.members: const {},
      this.tags,
      this.extension,
      this.storage,
      this.width,
      this.height});

  String get url => "/m/$id$extension";

  String get urlCss => "url($url)";

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MediaImageSerializer();
}

class MediaVideo extends HasAccess implements Media {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<String> tags;

  String extension;

  int storage;

  int width;

  int height;

  int length;

  MediaVideo(
      {this.id,
      this.name,
      this.owner,
      this.members: const {},
      this.tags,
      this.extension,
      this.storage,
      this.width,
      this.height,
      this.length});

  String get url => "/m/$id$extension";

  String get urlCss => "url($url)";

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MediaVideoSerializer();
}

class MediaAudio extends HasAccess implements Media {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<String> tags;

  String extension;

  int storage;

  int length;

  MediaAudio(
      {this.id,
      this.name,
      this.owner,
      this.members: const {},
      this.tags,
      this.extension,
      this.storage,
      this.length});

  String get url => "/m/$id$extension";

  String get urlCss => "url($url)";

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MediaAudioSerializer();
}

class MediaFont extends HasAccess implements Media {
  String id;

  String name;

  String owner;

  Map<String, int> members;

  List<String> tags;

  String extension;

  int storage;

  MediaFont(
      {this.id,
      this.name,
      this.owner,
      this.members: const {},
      this.tags,
      this.extension,
      this.storage});

  String get url => "/m/$id$extension";

  String get urlCss => "url($url)";

  Map toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = MediaFontSerializer();
}
