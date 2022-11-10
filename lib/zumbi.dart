import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:game_usf/personagem.dart';
import 'package:game_usf/player_sprite_sheet.dart';
import 'package:game_usf/zumbi_sprite_sheet.dart';

import 'main.dart';

bool mover = true;

class Zumbi extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  Zumbi(Vector2 position)
      : super(
          position: position,
          height: tamanho,
          width: tamanho,
          speed: 20,
          animation: SimpleDirectionAnimation(
              idleLeft: ZumbiSpriteSheet.idleleft,
              idleRight: ZumbiSpriteSheet.idleright,
              runLeft: ZumbiSpriteSheet.runLeft,
              runRight: ZumbiSpriteSheet.runRight),
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(
        size: const Size(8, 8),
        align: Vector2(6, 10),
      )
    ]));
  }

  @override
  void update(double dt) {
    if (mover) {
      seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            closePlayer: (player) {
              _executeAttack();
            },
            radiusVision: tileSize * 1.8,
          );
        },
        notObserved: () {
          if (!isDead) {
            runRandomMovement(dt);
          }
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
      borderWidth: 1,
      height: 1,
      width: 5,
      align: const Offset(7.5, -7.5),
    );
    super.render(canvas);
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        ZumbiSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    } else {
      animation?.playOnce(
        ZumbiSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    }
    mover = true;
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
      animationLeft: PlayerSpriteSheet.attacVFXLeft,
      animationRight: PlayerSpriteSheet.attackVFXRight,
      animationUp: PlayerSpriteSheet.attackVFXTop,
      animationDown: PlayerSpriteSheet.attacVFXDown,
    );
  }
}
