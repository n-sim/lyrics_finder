import 'file:///D:/Android/FlutterProjekte/lyrics_finder/lib/core/server_exception.dart';
import 'package:meta/meta.dart';
import 'package:lyricsfinder/core/optional.dart';
import 'package:lyricsfinder/find_lyrics/data/sources/remote_source.dart';
import 'package:lyricsfinder/find_lyrics/domain/entities/lyrics.dart';
import 'package:lyricsfinder/find_lyrics/domain/entities/song.dart';

class GetSongLyrics{
  final RemoteSource dataSource;

  GetSongLyrics({@required this.dataSource});

  Future<Optional<Lyrics>> call(Song song) async{
    Lyrics lyrics;
    try{
      lyrics = await dataSource.getSongLyrics(song);
      return Optional.of(lyrics);
    }on ServerException{
      return Optional.empty();
    }
  }
}