import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyricsfinder/find_lyrics/presentation/bloc/lyrics/lyrics_bloc.dart';

class LyricsPage extends StatefulWidget {
  LyricsPage({Key key}) : super(key: key);

  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<LyricsBloc, LyricsState>(
          bloc: BlocProvider.of<LyricsBloc>(context),
          builder: (context, state) {
            if (state is LyricsLoadedState) {
              final text = state.lyrics.text;
              return SingleChildScrollView(child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(text, style: TextStyle(fontSize: 18),),
              ));
            } else if (state is LyricsLoadingFailedState) {
              return buildText(state.msg);
            } else {
              return SizedBox(
                  width: 200, height: 200, child: CircularProgressIndicator(strokeWidth: 10));
            }
          },
        ),
      ),
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  void updateTitle(String newTitle){
    setState(() {
      title = newTitle;
    });
  }
}
