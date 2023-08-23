import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'gmA6MrX81z4',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: 400,
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
