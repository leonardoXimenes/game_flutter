// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_usf/sprite_sheets/decoration_sprite_sheet.dart';
import 'package:game_usf/characters/personagem.dart';

import '../main.dart';

class PortaB extends GameDecoration with ObjectCollision {
  bool _playerIsClose = false;

  Sprite? portaB, portaBAberta;

  PortaB(Vector2 position)
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
            align: Vector2(0, tileSize),
          )
        ],
      ),
    );
  }
  @override
  void update(double dt) {
    seeComponentType<Personagem>(
      observed: (player) {
        if (!_playerIsClose) {
          _playerIsClose = true;
        }
      },
      notObserved: () {
        _playerIsClose = false;
      },
      radiusVision: tileSize * 0.7,
    );
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_playerIsClose) {
      sprite = portaBAberta;
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
    } else {
      sprite = portaB;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    portaB = await DecorationSpriteSheet.portaB;
    portaBAberta = await DecorationSpriteSheet.portaBAberta;
    return super.onLoad();
  }
}
