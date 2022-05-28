import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class WebRadio with ChangeNotifier {
  bool _isPlaying = false;
  bool _buffering = false;
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  final _url = 'http://stream.zeno.fm/bk7mykpmzrhvv';
  startPlayer() async {
    try {
      await audioPlayer.play(_url).then((value) {
        _isPlaying = !_isPlaying;
        _buffering = true;
        Future.delayed(const Duration(seconds: 6), () {
          _buffering = false;
          notifyListeners();
        });

        notifyListeners();
      });
    } catch (e) {
      return null;
    }
  }

  bool isBuffer() {
    return _buffering;
  }

  bool isPlayng() {
    return _isPlaying;
  }

  pausePlayer() {
    audioPlayer.pause().then((value) {
      _isPlaying = !_isPlaying;

      notifyListeners();
    });
  }

  playController() {
    _isPlaying ? pausePlayer() : startPlayer();
  }
}
