
import 'package:audioplayers/audioplayers.dart';

class MusicaFondo {
  static final MusicaFondo _singleton = MusicaFondo._internal();
  late AudioPlayer _audioPlayer;

  factory MusicaFondo(){
    return _singleton;
  }

  MusicaFondo._internal(){
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> playMusica(String source) async{
    await _audioPlayer.play(AssetSource(source));
  }

  Future<void> detenerMusica() async{
    await _audioPlayer.stop();
  }

  Future<void> pausarMusica() async{
    await _audioPlayer.pause();
  }

  Future<void> continuarMusica() async{
    await _audioPlayer.resume();
  }

  Future<void> dispose() async{
    await _audioPlayer.dispose();
  }

}