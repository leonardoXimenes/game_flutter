// ignore_for_file: deprecated_member_use

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/player_sprite_sheet.dart';

import '../game.dart';
import '../my_game_audio.dart';

double tamanho = 20;
bool mover = true;

class Personagem extends SimplePlayer
    with ObjectCollision, Lighting, TapGesture {
  bool fusivel = false;
  int totalLigado = 5;
  bool cartaoAzul = false;
  bool alicateVermelho = false;
  bool chaveAmarela = false;
  bool chaveVerde = false;

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
    if (gameRef.player?.isDead == false) {
      if (event.event == ActionEvent.DOWN && event.id == 1) {
        _executeAttack();
        Sounds.attack();
      }
      super.joystickAction(event);
    }
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (gameRef.player?.isDead == false) {
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

    super.die();
  }

  @override
  void receiveDamage(double damage, from) {
    Sounds.damage();
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

//---------------------------------------------------------------------
  @override
  void onTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Reiniciar jogo", textAlign: TextAlign.center),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text("Sim",
                    textAlign: TextAlign.center, textScaleFactor: 1.5),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const Game();
                  }), (route) => false);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void onTapCancel() {
    //
  }

  @override
  void onTapDown(int pointer, Offset position) {
    //
  }

  @override
  void onTapUp(int pointer, Offset position) {
    //
  }
}
