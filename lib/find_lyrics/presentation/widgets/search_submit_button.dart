import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyricsfinder/find_lyrics/presentation/bloc/lyrics/lyrics_bloc.dart';
import 'package:lyricsfinder/find_lyrics/presentation/bloc/song/song_bloc.dart';
import 'package:lyricsfinder/find_lyrics/presentation/pages/lyrics_page.dart';

class SearchSubmitButton extends StatefulWidget {
  SearchSubmitButton({Key key}) : super(key: key);

  @override
  _SearchSubmitButtonState createState() => _SearchSubmitButtonState();
}

class _SearchSubmitButtonState extends State<SearchSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.search),
      onPressed: () => performSearch(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  void performSearch() {
    BlocProvider.of<LyricsBloc>(context)
        .add(GetLyricsEvent(BlocProvider.of<SongBloc>(context).song));

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LyricsPage(),
        ));
  }
}
