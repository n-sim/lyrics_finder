import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lyricsfinder/find_lyrics/domain/entities/song.dart';
import 'package:meta/meta.dart';

part 'song_event.dart';

part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  Song song = Song();

  @override
  SongState get initialState => InitialSongState();

  @override
  Stream<SongState> mapEventToState(SongEvent event) async* {
    if(event is ArtistUpdatedEvent){
      song.artist = event.name;
    }else if(event is SongUpdatedEvent){
      song.name = event.name;
    }
  }
}
