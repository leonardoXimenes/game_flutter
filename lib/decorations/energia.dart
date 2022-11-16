import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/decoration_sprite_sheet.dart';

import '../main.dart';
import '../characters/personagem.dart';
import '../my_game_audio.dart';

class Energia extends GameDecoration with Sensor, Lighting {
  bool ligado = false;
  Sprite? energia, energiaLigada;
  Energia(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.energia,
          position: position,
          width: tileSize,
          height: tileSize * 1.1,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem &&
        component.fusivel == true &&
        ligado == false) {
      Sounds.useFuse();
      sprite = energiaLigada;
      ligado = true;
      component.totalLigado += 1;
      component.fusivel = false;
      setupLighting(
        LightingConfig(
          radius: tamanho * 0.5,
          color: Colors.green,
          withPulse: true,
          blurBorder: 50,
          pulseVariation: 0.3,
          pulseSpeed: 0.6,
          pulseCurve: Curves.linear,
        ),
      );
    }
  }

  @override
  Future<void> onLoad() async {
    energia = await DecorationSpriteSheet.energia;
    energiaLigada = await DecorationSpriteSheet.energiaLigada;
    return super.onLoad();
  }
}
