import 'package:http/http.dart' as http;
import 'package:lyricsfinder/find_lyrics/data/models/lyrics_model.dart';
import 'file:///D:/Android/FlutterProjekte/lyrics_finder/lib/core/server_exception.dart';
import 'package:lyricsfinder/find_lyrics/domain/entities/song.dart';

import 'package:meta/meta.dart';
import 'dart:convert';


class RemoteSource{
  final http.Client client;

  RemoteSource({@required this.client});

  Future<LyricsModel> getSongLyrics(Song song) async{
    final apiRequestString = 'https://api.lyrics.ovh/v1/${song.artist}/${song.name}';
    final response = await client.get(apiRequestString);

    if (response.statusCode == 200) {
      return LyricsModel.fromJson(json.decode(response.body));
    } else{
      throw ServerException();
    }
  }
}