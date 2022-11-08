// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_usf/decoration_sprite_sheet.dart';
import 'package:game_usf/personagem.dart';

import '../main.dart';

class PortaG extends GameDecoration with ObjectCollision {
  bool _playerIsClose = false;

  Sprite? portaG, portaGAberta;

  PortaG(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.portaG,
          position: position,
          width: tileSize * 2 - 0.1,
          height: tileSize * 2,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(tileSize * 2, tileSize),
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
      radiusVision: tileSize * 0.5,
    );
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_playerIsClose) {
      sprite = portaGAberta;
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
      sprite = portaG;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    portaG = await DecorationSpriteSheet.portaG;
    portaGAberta = await DecorationSpriteSheet.portaGAberta;
    return super.onLoad();
  }
}
