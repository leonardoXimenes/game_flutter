import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';

class MyGameAudio extends FlameAudio {
  late AudioPool som;

  Future<void> onLoad() async {
    som = await AudioPool.create('it.mp3');
  }
}
