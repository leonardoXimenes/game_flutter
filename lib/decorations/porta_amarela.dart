import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/decoration_sprite_sheet.dart';
import 'package:game_usf/characters/personagem.dart';

import '../main.dart';
import '../my_game_audio.dart';

class PortaAmarela extends GameDecoration with ObjectCollision, Lighting {
  bool comChave = false;

  Sprite? portaE, portaEAberta;

  PortaAmarela(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.portaE,
          position: position,
          width: tileSize - 0.1,
          height: tileSize * 2,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(tileSize, tileSize),
            align: Vector2(0, tileSize),
          )
        ],
      ),
    );
    setupLighting(
      LightingConfig(
        radius: tamanho * 0.5,
        color: Colors.yellow.withOpacity(1),
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.6,
        pulseCurve: Curves.linear,
      ),
    );
  }

  @override
  Future<void> onLoad() async {
    portaE = await DecorationSpriteSheet.portaE;
    portaEAberta = await DecorationSpriteSheet.portaEAberta;
    return super.onLoad();
  }

  @override
  void onCollision(GameComponent component, active) {
    if (component is Personagem && component.chaveAmarela == true) {
      sprite = portaEAberta;
      Sounds.unlockedDoor();
      setupCollision(
        CollisionConfig(
          collisions: [
            CollisionArea.rectangle(
              size: const Size(0, 0),
              align: Vector2(0, tileSize),
            )
          ],
        ),
      );
      setupLighting(
        LightingConfig(
          radius: tamanho * 0.5,
          color: Colors.white.withOpacity(1),
          withPulse: true,
          blurBorder: 50,
          pulseVariation: 0.3,
          pulseSpeed: 0.6,
          pulseCurve: Curves.linear,
        ),
      );
    }
  }
}
