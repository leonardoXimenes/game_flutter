import 'package:bonfire/bonfire.dart';
import 'package:game_usf/decoration_sprite_sheet.dart';
import '../main.dart';
import '../personagem.dart';

class Fim extends GameDecoration with Sensor {
  Fim(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.fimDeJogo,
          position: position,
          width: tileSize * 2,
          height: tileSize * 2,
        );

  @override
  void onContact(GameComponent component) {
    if (component is Personagem) {
      print('Fim de jogo');
    }
  }
}
