import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_usf/player_sprite_sheet.dart';

double tamanho = 20 * 4;
bool mover = true;

class Personagem extends SimplePlayer with ObjectCollision {
  Personagem(Vector2 position)
      : super(
            position: position,
            animation: SimpleDirectionAnimation(
                idleLeft: PlayerSpriteSheet.idleleft,
                idleRight: PlayerSpriteSheet.idleright,
                runRight: PlayerSpriteSheet.runRight,
                runLeft: PlayerSpriteSheet.runLeft),
            speed: 160,
            width: tamanho,
            height: tamanho) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(
            size: const Size(45, 20), align: Vector2(18, 55))
      ]),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      _executeAttack();
    }
    super.joystickAction(event);
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

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(double damage, from) {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        PlayerSpriteSheet.damageLeft,
        runToTheEnd: true,
        onFinish: () {
          mover = true;
        },
      );
    } else {
      animation?.playOnce(
        PlayerSpriteSheet.damageRight,
        runToTheEnd: true,
        onFinish: () {
          mover = true;
        },
      );
    }
    super.receiveDamage(damage, from);
  }
}
