import 'frame.dart';
import 'page.dart';

import 'package:common/utils/url.dart';

import 'package:common/serializer/serializer.dart';

import 'package:common/data/data_repo.dart';
import 'package:common/data/data_weather.dart';

export 'frame.dart';
export 'page.dart';

class ProgramDesign {
  int _width = 0;

  int _height = 0;

  final frames = <Frame>[];

  String color;

  String image;

  Fit fit;

  DataRepository _dataRepository;

  set dataRepository(DataRepository value) {
    _dataRepository = value;

    for (Frame frame in frames) frame.dataRepository = _dataRepository;
  }

  DataRepository get dataRepository => _dataRepository;

  ProgramDesign(
      {int width: 0,
      int height: 0,
      List<Frame> frames,
      this.color: 'transparent',
      this.image,
      this.fit: Fit.cover,
      DataRepository dataRepository}) {
    if (frames != null) this.frames.addAll(frames);
    this.width = width;
    this.height = height;

    if (dataRepository != null)
      this.dataRepository = dataRepository;
    else {
      this.dataRepository = DataRepository([]);

      final weather = WeatherData()..register('Stockholm');
      this.dataRepository.sources.addAll([weather]);
    }
  }

  int get width => _width;

  set width(dynamic value) {
    if (value is String) {
      _width = int.tryParse(value) ?? 0;
    } else {
      _width = value;
    }
  }

  int get height => _height;

  set height(dynamic value) {
    if (value is String) {
      _height = int.tryParse(value) ?? 0;
    } else {
      _height = value;
    }
  }

  void addNewFrame(
          {String id,
          String name: 'New frame',
          List<Page> pages,
          int left: 0,
          int top: 0,
          int width,
          int height,
          String color: 'transparent',
          String image}) =>
      frames.add(Frame(
          id: id,
          name: name,
          pages: pages,
          left: left,
          top: top,
          width: width ?? this.width,
          height: height ?? this.height,
          image: image,
          dataRepository: dataRepository));

  void duplicateFrame(String frameId) {
    final frame = frames.firstWhere((f) => f.id == frameId, orElse: () => null);
    if (frame == null) return;

    frames.add(frame.duplicate(setName: frame.name + '_dup'));
  }

  void removeFrame(String id) {
    frames.removeWhere((f) => f.id == id);
  }

  void removeFramesById(Set<String> ids) {
    frames.removeWhere((f) => ids.contains(f.id));
  }

  void moveFrameTo(String frameId, int newPos) {
    final frame = frames.firstWhere((f) => f.id == frameId, orElse: () => null);
    int oldIndex = frames.indexOf(frame);
    frames[oldIndex] = null;
    if (newPos < frames.length) {
      frames.insert(newPos, frame);
    } else {
      frames.add(frame);
    }
    frames.removeWhere((p) => p == null);
  }

  Map<String, dynamic> toJson() => serializer.toMap(this);

  String toString() => toJson().toString();

  static final serializer = ProgramDesignSerializer();

  String get imageUrl {
    if (!isValidMediaUrl(image)) return 'none';
    return 'url($image)';
  }

  void collectUrls(Map<String, bool> urls) {
    if (isDownloadableMediaUrl(image)) urls[image] = false;
    for (Frame frame in frames) {
      frame.collectUrls(urls);
    }
  }
}
