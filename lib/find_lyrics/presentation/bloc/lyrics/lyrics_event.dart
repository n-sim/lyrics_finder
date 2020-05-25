part of 'lyrics_bloc.dart';

@immutable
abstract class LyricsEvent {}

class GetLyricsEvent extends LyricsEvent{
  final Song song;

  GetLyricsEvent(this.song);
}