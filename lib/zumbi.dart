import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:game_usf/zumbi_sprite_sheet.dart';

import 'main.dart';

double tamanho = 20 * 4;

class Zumbi extends SimpleEnemy with ObjectCollision {
  Zumbi(Vector2 position)
      : super(
          position: position,
          height: tamanho,
          width: tamanho,
          speed: 100,
          animation: SimpleDirectionAnimation(
              idleLeft: ZumbiSpriteSheet.idleleft,
              idleRight: ZumbiSpriteSheet.idleright,
              runLeft: ZumbiSpriteSheet.runLeft,
              runRight: ZumbiSpriteSheet.runRight),
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: const Size(45, 30), align: Vector2(18, 45))
    ]));
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {},
      radiusVision: tileSize * 1.8,
    );
    super.update(dt);
  }
}
