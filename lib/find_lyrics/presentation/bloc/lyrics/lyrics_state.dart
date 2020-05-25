part of 'lyrics_bloc.dart';

@immutable
abstract class LyricsState {}

class LyricsInitialState extends LyricsState {}
class LyricsLoadingState extends LyricsState {}

class LyricsLoadedState extends LyricsState {
  final Lyrics lyrics;

  LyricsLoadedState(this.lyrics);
}

class LyricsLoadingFailedState extends LyricsState {
  final String msg;

  LyricsLoadingFailedState(this.msg);
}