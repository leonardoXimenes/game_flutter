import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:game_usf/player_sprite_sheet.dart';
import 'package:game_usf/zumbi_sprite_sheet.dart';

import 'main.dart';

double tamanho = 20 * 4;
bool mover = true;

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
    if (mover) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeAttack();
        },
        radiusVision: tileSize * 1.8,
      );
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 10,
      height: 15,
      width: 50,
      align: const Offset(15, -15),
    );
    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(double damage, from) {
    mover = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        ZumbiSpriteSheet.damageLeft,
        runToTheEnd: true,
        onFinish: () {
          mover = true;
        },
      );
    } else {
      animation?.playOnce(
        ZumbiSpriteSheet.damageRight,
        runToTheEnd: true,
        onFinish: () {
          mover = true;
        },
      );
    }
    super.receiveDamage(damage, from);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      sizePush: tamanho * 0.4,
      height: tamanho * 0.8,
      width: tamanho * 0.8,
      animationLeft: PlayerSpriteSheet.attackLeft,
      animationRight: PlayerSpriteSheet.attackRight,
      animationUp: PlayerSpriteSheet.attackTop,
      animationDown: PlayerSpriteSheet.attackDown,
    );
  }
}
