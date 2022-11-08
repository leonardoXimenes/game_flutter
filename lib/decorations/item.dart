// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:game_usf/item_sprite_sheet.dart';
import 'package:game_usf/personagem.dart';

import '../main.dart';

class Fusivel extends GameDecoration {
  Fusivel(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.fusivelAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}

//----------------------------------------------------
class Alicate extends GameDecoration {
  Alicate(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.alicateAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}

//----------------------------------------------------
class Cartao extends GameDecoration {
  Cartao(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.cartaoAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}

//----------------------------------------------------
class ChaveY extends GameDecoration {
  ChaveY(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.chaveyAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}

//----------------------------------------------------
class ChaveG extends GameDecoration {
  ChaveG(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.chavegAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}

//----------------------------------------------------
class Vida extends GameDecoration with Sensor {
  Vida(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.vidaAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );

  @override
  void onContact(GameComponent component) {
    if (component is Personagem) {
      if (component.life < 100) {
        (component).addLife(50);
        removeFromParent();
      }
    }
  }
}

//----------------------------------------------------
class Mathias extends GameDecoration {
  Mathias(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.mathiasAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}
