import 'package:flutter/material.dart';
import 'package:interior_baiano/src/model/news_list.dart';
import 'package:interior_baiano/src/model/news_model.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerWidget extends StatefulWidget {
  late NewsModel newsModel;
  VideoPlayerWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    final String videoLink = Provider.of<NewsList>(context, listen: false)
        .searchLink(widget.newsModel.videoLink.toString());

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayerController.convertUrlToId(videoLink).toString(),
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Confira o vídeo abaixo:'),
          const SizedBox(
            height: 10,
          ),
          YoutubePlayerIFrame(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ],
      ),
    );
  }
}
