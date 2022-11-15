import 'package:bonfire/bonfire.dart';
import 'package:game_usf/main.dart';

class DecorationSpriteSheet {
  static Future<Sprite> get energia => Sprite.load(
        'itens.png',
        srcPosition: Vector2(tileSize, tileSize * 8),
        srcSize: Vector2(tileSize, tileSize),
      );
  static Future<Sprite> get energiaLigada => Sprite.load(
        'itens.png',
        srcPosition: Vector2(0, tileSize * 8),
        srcSize: Vector2(tileSize, tileSize),
      );
  //---------------------Porta de Frente----------------------------------
  static Future<Sprite> get portaG => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(tileSize * 2, tileSize * 2),
      );
  static Future<Sprite> get portaGAberta => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(tileSize * 2, 0),
        srcSize: Vector2(tileSize * 2, tileSize * 2),
      ); //---------------------Porta de Frente----------------------------------
  static Future<Sprite> get portaE => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(tileSize, tileSize * 2),
      );
  static Future<Sprite> get portaEAberta => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(tileSize * 2, 0),
        srcSize: Vector2(tileSize, tileSize * 2),
      );
  //---------------------Porta de ladoC----------------------------------
  static Future<Sprite> get portaC => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(tileSize * 6, 0),
        srcSize: Vector2(tileSize * 2, 24),
      );
  static Future<Sprite> get portaCAberta => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(tileSize * 8, 0),
        srcSize: Vector2(tileSize * 2, 24),
      );
  //---------------------Porta de ladoB----------------------------------
  static Future<Sprite> get portaB => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(tileSize * 6, 24),
        srcSize: Vector2(tileSize * 2, 24),
      );
  static Future<Sprite> get portaBAberta => Sprite.load(
        'portaG.png',
        srcPosition: Vector2(tileSize * 8, 24),
        srcSize: Vector2(tileSize * 2, 24),
      );
//---------------------Rosto do personagem-------------------------------
  static Future<Sprite> get rosto => Sprite.load(
        'itens.png',
        srcPosition: Vector2(0, tileSize * 7),
        srcSize: Vector2(tileSize, tileSize),
      );
  //---------------------Rosto do personagem-------------------------------
  static Future<Sprite> get fimDeJogo => Sprite.load(
        'itens.png',
        srcPosition: Vector2(0, tileSize * 7),
        srcSize: Vector2(tileSize * 9, 0),
      );
}
