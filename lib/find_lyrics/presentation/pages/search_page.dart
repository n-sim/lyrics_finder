import 'package:flutter/material.dart';
import 'package:lyricsfinder/find_lyrics/presentation/widgets/search_input.dart';
import 'package:lyricsfinder/find_lyrics/presentation/widgets/search_submit_button.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lyrics Finder'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SearchInput(),
      ),
      floatingActionButton: SearchSubmitButton(),
    );
  }
}
