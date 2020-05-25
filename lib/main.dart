import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyricsfinder/find_lyrics/presentation/pages/search_page.dart';

import 'find_lyrics/presentation/bloc/lyrics/lyrics_bloc.dart';
import 'find_lyrics/presentation/bloc/song/song_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SongBloc>(
        create: (context) => SongBloc(),
      ),
      BlocProvider<LyricsBloc>(
        create: (context) => LyricsBloc(),
      )
    ],
    child: MaterialApp(
      title: 'LyricsFinder',
      home: SearchPage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 24
          )
        )
      ),
    ),
  ));
}
