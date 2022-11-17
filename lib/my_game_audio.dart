import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';

class Sounds {
  static bool enabled = true;
  static Future initialize() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      'abrirPorta.wav',
      'ataque.wav',
      'conectarFusivel.wav',
      'dano.wav',
      'musica.mp3',
      'pegarItem.wav',
    ]);
  }

  static void getItem() {
    if (!enabled) return;
    FlameAudio.play('pegarItem.wav');
  }

  static void attack() {
    if (!enabled) return;
    FlameAudio.play('ataque.wav', volume: 0.10);
  }

  static void damage() {
    if (!enabled) return;
    FlameAudio.play('dano.wav', volume: 0.11);
  }

  static void unlockedDoor() {
    if (!enabled) return;
    FlameAudio.play('abrirPorta.wav', volume: 0.2);
  }

  static void useFuse() {
    if (!enabled) return;
    FlameAudio.play('conectarFusivel.wav', volume: 0.1);
  }

  static void playBackgroundSound() async {
    if (!enabled) return;
    await FlameAudio.bgm.stop();
    FlameAudio.bgm.play('musica.mp3', volume: 0.08);
  }
//------------------------------------------------------------------------

  static stopBackgroundSound() {
    if (!enabled) return;
    return FlameAudio.bgm.stop();
  }

  static void pauseBackgroundSound() {
    if (!enabled) return;
    if (kIsWeb) return;
    FlameAudio.bgm.pause();
  }

  static void resumeBackgroundSound() {
    if (!enabled) return;
    if (kIsWeb) return;
    FlameAudio.bgm.resume();
  }

  static void dispose() {
    if (!enabled) return;
    if (kIsWeb) return;
    FlameAudio.bgm.dispose();
  }
}
