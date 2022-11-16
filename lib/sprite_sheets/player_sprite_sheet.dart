import 'package:bonfire/bonfire.dart';

double x = 20, y = 20, tempo = 0.1;

class PlayerSpriteSheet {
  //Parado para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get idleleft => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, 0),
        ),
      );

//Parado para a direita-----------------------------------------
  static Future<SpriteAnimation> get idleright => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, 0),
        ),
      );

//Andando para a direita-----------------------------------------
  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y),
        ),
      );

//Andando para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, y),
        ),
      );

//----------------------------------------------------------
//Sofrendo dano a direita-----------------------------------------
  static Future<SpriteAnimation> get damageRight => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y * 3),
        ),
      );

//Sofrendo dano a esquerda-----------------------------------------
  static Future<SpriteAnimation> get damageLeft => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 13, y * 3),
        ),
      );

//----------------------------------------------------------
//Ataque para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 13, y * 2),
        ),
      );

//Ataque para a direita-----------------------------------------
  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y * 2),
        ),
      );

//----------------------------------------------------------
//Ataque vfx para a esquerda-----------------------------------------
  static Future<SpriteAnimation> get attacVFXLeft => SpriteAnimation.load(
        'ataque.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y),
        ),
      );

//Ataque vfx para a direita-----------------------------------------
  static Future<SpriteAnimation> get attackVFXRight => SpriteAnimation.load(
        'ataque.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, 0),
        ),
      );

//Ataque vfx para cima-----------------------------------------
  static Future<SpriteAnimation> get attackVFXTop => SpriteAnimation.load(
        'ataque.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y * 2),
        ),
      );

//Ataque vfx para baixo-----------------------------------------
  static Future<SpriteAnimation> get attacVFXDown => SpriteAnimation.load(
        'ataque.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(0, y * 3),
        ),
      );

  //Morte a direita-----------------------------------------
  static Future<SpriteAnimation> get dieRight => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 7, y * 3),
        ),
      );

//Morte a esquerda-----------------------------------------
  static Future<SpriteAnimation> get dieLeft => SpriteAnimation.load(
        'detetiveP1.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: tempo,
          textureSize: Vector2(x, y),
          texturePosition: Vector2(x * 8, y * 3),
        ),
      );
}
