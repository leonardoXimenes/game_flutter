import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_usf/player_sprite_sheet.dart';

double tamanho = 20 * 4;

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
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: const Size(45, 20), align: Vector2(18, 55))
    ]));
  }
}
