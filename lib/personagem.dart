import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/player_sprite_sheet.dart';

double tamanho = 20;
bool mover = true;

class Personagem extends SimplePlayer with ObjectCollision, Lighting {
  Personagem(Vector2 position)
      : super(
            position: position,
            animation: SimpleDirectionAnimation(
                idleLeft: PlayerSpriteSheet.idleleft,
                idleRight: PlayerSpriteSheet.idleright,
                runRight: PlayerSpriteSheet.runRight,
                runLeft: PlayerSpriteSheet.runLeft),
            speed: 32,
            width: tamanho,
            height: tamanho) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(8, 5),
            align: Vector2(6, 10),
          ),
        ],
      ),
    );

    setupLighting(
      LightingConfig(
        radius: tamanho * 1.1,
        color: Colors.transparent,
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.5,
        pulseCurve: Curves.linear,
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (mover) {
      if (event.event == ActionEvent.DOWN && event.id == 1) {
        _executeAttack();
      }
      super.joystickAction(event);
    }
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (mover) {
      super.joystickChangeDirectional(event);
    }
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

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(
        PlayerSpriteSheet.dieLeft,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    } else {
      animation?.playOnce(
        PlayerSpriteSheet.dieRight,
        runToTheEnd: true,
        onFinish: () {
          removeFromParent();
        },
      );
    }
    mover = false;

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
