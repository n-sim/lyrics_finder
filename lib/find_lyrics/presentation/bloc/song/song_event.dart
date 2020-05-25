part of 'song_bloc.dart';

@immutable
abstract class SongEvent {
}


class ArtistUpdatedEvent extends SongEvent{
  final String name;

  ArtistUpdatedEvent(this.name);

}
class SongUpdatedEvent extends SongEvent{
  final String name;

  SongUpdatedEvent(this.name);
}