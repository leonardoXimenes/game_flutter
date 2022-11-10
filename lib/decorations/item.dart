// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/item_sprite_sheet.dart';
import 'package:game_usf/personagem.dart';
import 'package:game_usf/player_sprite_sheet.dart';

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
class Mathias extends GameDecoration with TapGesture, Lighting {
  Mathias(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.mathiasAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        ) {
    setupLighting(
      LightingConfig(
        radius: tamanho * 1.1,
        color: Colors.transparent,
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.5,
        pulseCurve: Curves.linear,
      ),
    );
  }

  @override
  void onTap() {
    TalkDialog.show(context, [
      Say(
        text: [
          const TextSpan(
              // ignore: prefer_adjacent_string_concatenation
              text: 'Mathias:  Julius, a mansão esta cheia de zumbi,' +
                  ' você precisa encontar os fuziveis e ligar a força pra gente conseguir sair daqui!'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: ItemSpriteSheet.mathiasAnim.asWidget(),
        ),
      ),
      Say(
        text: [
          const TextSpan(
              text:
                  // ignore: prefer_adjacent_string_concatenation
                  'Um segurança deixou o cartão da porta de entrada cair ao norte do casarão,' +
                      ' você vai precisar encontrar a chave daquela area para chegar la!'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: ItemSpriteSheet.mathiasAnim.asWidget(),
        ),
      ),
      Say(
        text: [
          const TextSpan(text: 'Julius: Putz !!!'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: PlayerSpriteSheet.idleleft.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
    ]);

    /*if (FollowerWidget.isVisible('identify')) {
      FollowerWidget.remove('identify');
    } else {
      FollowerWidget.show(
        identify: 'identify',
        context: context,
        target: this,
        child: Card(
          child: Column(
            children: [Text(''), Icon(Icons.add_card)],
          ),
        ),
      );
    }*/
  }

  @override
  void onTapCancel() {
    // ignore: todo
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(int pointer, Offset position) {
    // ignore: todo
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(int pointer, Offset position) {
    // ignore: todo
    // TODO: implement onTapUp
  }
}