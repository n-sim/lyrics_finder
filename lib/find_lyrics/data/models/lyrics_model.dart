import 'package:lyricsfinder/find_lyrics/domain/entities/lyrics.dart';
import 'package:meta/meta.dart';

class LyricsModel extends Lyrics {
  LyricsModel({@required String text}) : super(text: text);

  factory LyricsModel.fromJson(Map<String, dynamic> json){
    return LyricsModel(text: json['lyrics']);
  }
}