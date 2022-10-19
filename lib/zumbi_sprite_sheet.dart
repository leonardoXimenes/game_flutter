import 'package:bonfire/bonfire.dart';

double x = 20, y = 20, tempo = 0.1;

class ZumbiSpriteSheet {
  //Parado para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get idleleft => SpriteAnimation.load(
        'zumbi_a.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, 0),
        ),
      );

//Parado para a direita-----------------------------------------
  static Future<SpriteAnimation> get idleright => SpriteAnimation.load(
        'zumbi_a.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, 0),
        ),
      );

//Andando para a direita-----------------------------------------
  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'zumbi_a.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y),
        ),
      );

//Andando para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'zumbi_a.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, y),
        ),
      );

  //Sofrendo dano a direita-----------------------------------------
  static Future<SpriteAnimation> get damageRight => SpriteAnimation.load(
        'zumbi_a.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y * 3),
        ),
      );

//Sofrendo dano a esquerda-----------------------------------------
  static Future<SpriteAnimation> get damageLeft => SpriteAnimation.load(
        'zumbi_a.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 13, y * 3),
        ),
      );
}
