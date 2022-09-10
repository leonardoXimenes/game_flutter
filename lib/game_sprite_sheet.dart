import 'package:bonfire/bonfire.dart';

double x = 20, y = 20, tempo = 0.1;

class GameSpriteSheet {
  //Parado para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get idleleft => SpriteAnimation.load(
      'detetiveP1.png',
      SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, 0)));

//Parado para a direita-----------------------------------------
  static Future<SpriteAnimation> get idleright => SpriteAnimation.load(
      'detetiveP1.png',
      SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, 0)));

//Andando para a direita-----------------------------------------
  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
      'detetiveP1.png',
      SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y)));

//Andando para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
      'detetiveP1.png',
      SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, y)));
}
