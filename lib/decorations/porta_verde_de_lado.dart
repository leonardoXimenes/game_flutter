import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/decoration_sprite_sheet.dart';
import 'package:game_usf/characters/personagem.dart';

import '../main.dart';
import '../my_game_audio.dart';

class PortaVerdeCima extends GameDecoration with ObjectCollision, Lighting {
  Sprite? portaC, portaCAberta;

  PortaVerdeCima(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.portaC,
          position: position,
          width: tileSize * 2 - 0.1,
          height: 24,
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
        color: Colors.green.withOpacity(1),
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
    portaC = await DecorationSpriteSheet.portaC;
    portaCAberta = await DecorationSpriteSheet.portaCAberta;
    return super.onLoad();
  }

  @override
  void onCollision(GameComponent component, active) {
    if (component is Personagem && component.chaveVerde == true) {
      sprite = portaCAberta;
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

//---------------------------------------------------------------------
class PortaVerdeBaixo extends GameDecoration with ObjectCollision, Lighting {
  Sprite? portaB, portaBAberta;

  PortaVerdeBaixo(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.portaB,
          position: position,
          width: tileSize * 2 - 0.1,
          height: 24,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(tileSize, tileSize),
            align: Vector2(0, 0),
          )
        ],
      ),
    );
    setupLighting(
      LightingConfig(
        radius: tamanho * 0.5,
        color: Colors.green.withOpacity(1),
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
    portaB = await DecorationSpriteSheet.portaB;
    portaBAberta = await DecorationSpriteSheet.portaBAberta;
    return super.onLoad();
  }

  @override
  void onCollision(GameComponent component, active) {
    if (component is Personagem && component.chaveVerde == true) {
      sprite = portaBAberta;
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
