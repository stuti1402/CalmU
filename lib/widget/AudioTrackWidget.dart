import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meditation/model/AudioPlayerModel.dart';
import 'package:flutter_meditation/music_player/AudioPlayerBloc.dart';
import 'package:flutter_meditation/music_player/AudioPlayerEvent.dart';

class AudioTrackWidget extends StatelessWidget {
  final AudioPlayerModel audioPlayerModel;

  const AudioTrackWidget({Key key, @required this.audioPlayerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: setLeading(),
      horizontalTitleGap: 7.0,
      minVerticalPadding: 0,
      title: setTitle(),
      subtitle: setSubtitle(),
      trailing: IconButton(
        icon: setIcon(),
        onPressed: setCallback(context),
      ),
    );
  }

  Widget setIcon() {
    if (audioPlayerModel.isPlaying)
      return ImageIcon(
        AssetImage("assets/pause.png"),
        color: Colors.redAccent,
      );
    else
      return ImageIcon(
        AssetImage("assets/play-button.png"),
        color: Color(0xFF3A5A98),
      );
  }

  Widget setLeading() {
    return new Image.asset(
      audioPlayerModel.audio.metas.image.path,
      height: 40,
      width: 44,
    );
  }

  Widget setTitle() {
    return Text(
      audioPlayerModel.audio.metas.title,
      style: TextStyle(
        fontSize: 13,
      ),
    );
  }

  Widget setSubtitle() {
    return Text(
      audioPlayerModel.audio.metas.artist,
      style: TextStyle(fontSize: 12),
    );
  }

  Function setCallback(BuildContext context) {
    if (audioPlayerModel.isPlaying)
      return () {
        BlocProvider.of<AudioPlayerBloc>(context)
            .add(TriggeredPauseAudio(audioPlayerModel));
      };
    else
      return () {
        BlocProvider.of<AudioPlayerBloc>(context)
            .add(TriggeredPlayAudio(audioPlayerModel));
      };
  }
}
