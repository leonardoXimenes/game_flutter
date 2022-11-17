import 'package:bonfire/bonfire.dart';
import 'package:game_usf/main.dart';

double tempo = 0.3;

class ItemSpriteSheet {
//----------------------------------------------------------
  static Future<SpriteAnimation> get fusivelAnim => SpriteAnimation.load(
        'itens.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, tileSize * 3),
        ),
      );
//----------------------------------------------------------
  static Future<SpriteAnimation> get alicateAnim => SpriteAnimation.load(
        'itens.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, 0),
        ),
      );
//----------------------------------------------------------
  static Future<SpriteAnimation> get cartaoAnim => SpriteAnimation.load(
        'itens.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, tileSize * 4),
        ),
      );
//----------------------------------------------------------
  static Future<SpriteAnimation> get chaveyAnim => SpriteAnimation.load(
        'itens.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, tileSize),
        ),
      );
//----------------------------------------------------------
  static Future<SpriteAnimation> get chavegAnim => SpriteAnimation.load(
        'itens.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, tileSize * 2),
        ),
      );
//----------------------------------------------------------
  static Future<SpriteAnimation> get vidaAnim => SpriteAnimation.load(
        'itens.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, tileSize * 5),
        ),
      );

//----------------------------------------------------------
  static Future<SpriteAnimation> get matiasAnim => SpriteAnimation.load(
        'matias.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: tempo,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, 0),
        ),
      );
}
