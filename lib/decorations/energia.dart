import 'package:bonfire/bonfire.dart';
import 'package:game_usf/decoration_sprite_sheet.dart';

import '../main.dart';

class Energia extends GameDecoration {
  Energia(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.energia,
          position: position,
          width: tileSize,
          height: tileSize,
        );
}
