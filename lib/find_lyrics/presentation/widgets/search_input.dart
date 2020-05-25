import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyricsfinder/find_lyrics/presentation/bloc/song/song_bloc.dart';

class SearchInput extends StatefulWidget {
  SearchInput({Key key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final artistTextFieldController = TextEditingController();
  final songTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    artistTextFieldController.addListener(updateArtist);
    songTextFieldController.addListener(updateSong);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            buildTextField(artistTextFieldController, 'Artist: '),
            SizedBox(height: 10),
            buildTextField(songTextFieldController, 'Song name: ')
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String text) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(labelText: text),
    );
  }

  void updateArtist() {
    BlocProvider.of<SongBloc>(context)
        .add(ArtistUpdatedEvent(artistTextFieldController.text));
  }

  void updateSong() {
    BlocProvider.of<SongBloc>(context)
        .add(SongUpdatedEvent(songTextFieldController.text));
  }
}
