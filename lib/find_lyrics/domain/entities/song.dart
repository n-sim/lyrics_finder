class Song {
  String artist;
  String name;

  Song({this.artist, this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Song &&
              runtimeType == other.runtimeType &&
              artist == other.artist &&
              name == other.name;

  @override
  int get hashCode =>
      artist.hashCode ^
      name.hashCode;
}
