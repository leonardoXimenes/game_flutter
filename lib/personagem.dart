import 'package:bonfire/bonfire.dart';
import 'package:game_usf/game_sprite_sheet.dart';

double tamanho = 64;

class Personagem extends SimplePlayer {
  Personagem(Vector2 position)
      : super(
            position: position,
            animation: SimpleDirectionAnimation(
                idleLeft: GameSpriteSheet.idleleft,
                idleRight: GameSpriteSheet.idleright,
                runRight: GameSpriteSheet.runRight,
                runLeft: GameSpriteSheet.runLeft),
            speed: 150,
            width: tamanho,
            height: tamanho);
}
