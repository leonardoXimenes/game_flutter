// ignore_for_file: deprecated_member_use

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/decoration_sprite_sheet.dart';
import '../game.dart';
import '../main.dart';
import '../characters/personagem.dart';

class Fim extends GameDecoration with Sensor {
  bool fimDeJogo = true;
  Fim(Vector2 position)
      : super.withSprite(
          DecorationSpriteSheet.fimDeJogo,
          position: position,
          width: tileSize * 2,
          height: tileSize * 2,
        );

  @override
  void onContact(GameComponent component) {
    if (component is Personagem && fimDeJogo == true) {
      fimDeJogo = false;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Fim de Jogo", textAlign: TextAlign.center),
            actions: <Widget>[
              Center(
                child: FlatButton(
                  child: const Text("Reiniciar",
                      textAlign: TextAlign.center, textScaleFactor: 1.5),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return const Game();
                    }), (route) => false);
                  },
                ),
              ),
            ],
          );
        },
      );
      gameRef.pauseEngine();
    }
  }
}
