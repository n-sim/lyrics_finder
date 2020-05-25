import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:lyricsfinder/core/optional.dart';
import 'package:lyricsfinder/find_lyrics/data/sources/remote_source.dart';
import 'package:lyricsfinder/find_lyrics/domain/entities/lyrics.dart';
import 'package:lyricsfinder/find_lyrics/domain/entities/song.dart';
import 'package:lyricsfinder/find_lyrics/domain/usecases/get_song_lyrics.dart';
import 'package:meta/meta.dart';

part 'lyrics_event.dart';

part 'lyrics_state.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState> {
  @override
  LyricsState get initialState => LyricsInitialState();

  @override
  Stream<LyricsState> mapEventToState(LyricsEvent event) async* {
    if (event is GetLyricsEvent) {
      yield LyricsLoadingState();
      final getLyrics = GetSongLyrics(dataSource: RemoteSource(client: http.Client()));
      Optional<Lyrics> lyrics = await getLyrics(event.song);
      if(lyrics.isEmpty()){
        yield LyricsLoadingFailedState("Keine Lyrics gefunden!");
      }else{
        yield LyricsLoadedState(lyrics.get());
      }
    }
  }
}
