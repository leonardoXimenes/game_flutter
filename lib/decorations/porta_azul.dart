import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/decoration_sprite_sheet.dart';

import '../main.dart';
import '../personagem.dart';

class PortaAzul extends GameDecoration with Sensor, Lighting {
  bool ligado = false;
  Sprite? portaG, portaGAberta;
  PortaAzul(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.portaG,
          position: position,
          width: tileSize * 2 - 0.1,
          height: tileSize * 2,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem && component.totalLigado >= 5) {
      sprite = portaGAberta;
      ligado = true;

      setupLighting(
        LightingConfig(
          radius: tamanho * 0.5,
          color: Colors.blue,
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
    portaG = await DecorationSpriteSheet.portaG;
    portaGAberta = await DecorationSpriteSheet.portaGAberta;
    return super.onLoad();
  }
}
