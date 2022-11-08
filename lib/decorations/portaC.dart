// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:game_usf/decoration_sprite_sheet.dart';
import 'package:game_usf/personagem.dart';
import 'package:bonfire/bonfire.dart';

import '../main.dart';

class PortaC extends GameDecoration with ObjectCollision {
  bool _playerIsClose = false;

  Sprite? portaC, portaCAberta;

  PortaC(Vector2 position)
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
      sprite = portaCAberta;
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
      sprite = portaC;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    portaC = await DecorationSpriteSheet.portaC;
    portaCAberta = await DecorationSpriteSheet.portaCAberta;
    return super.onLoad();
  }
}
