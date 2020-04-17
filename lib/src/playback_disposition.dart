/// Used to stream data about the position of the
/// playback as playback proceeds.
class PlaybackDisposition {
  /// The duration of the media.
  final Duration duration;

  /// The current position within the media
  /// that we are playing.
  Duration position;

  /// A convenience ctor. If you are using a stream builder
  /// you can use this to set initialData with both duration
  /// and postion as 0.
  PlaybackDisposition.zero()
      : duration = Duration(seconds: 0),
        position = Duration(seconds: 0);

  /// Contrucsts a PlaybackDisposition from a json object.
  /// This is used internally to deserialise data coming
  /// up from the underlying OS.
  PlaybackDisposition.fromJSON(Map<String, dynamic> json)
      : duration = Duration(
            milliseconds: double.parse(json['duration'] as String).toInt()),
        position = Duration(
            milliseconds:
                double.parse(json['current_position'] as String).toInt());

  @override
  String toString() {
    return 'duration: $duration, '
        'position: $position';
  }
}
