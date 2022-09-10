import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_usf/game_sprite_sheet.dart';

double tamanho = 20 * 4;

class Personagem extends SimplePlayer with ObjectCollision {
  Personagem(Vector2 position)
      : super(
            position: position,
            animation: SimpleDirectionAnimation(
                idleLeft: GameSpriteSheet.idleleft,
                idleRight: GameSpriteSheet.idleright,
                runRight: GameSpriteSheet.runRight,
                runLeft: GameSpriteSheet.runLeft),
            speed: 160,
            width: tamanho,
            height: tamanho) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: const Size(45, 20), align: Vector2(18, 55))
    ]));
  }
}
