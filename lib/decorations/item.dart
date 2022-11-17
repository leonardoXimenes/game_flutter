// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/item_sprite_sheet.dart';
import 'package:game_usf/characters/personagem.dart';
import 'package:game_usf/sprite_sheets/player_sprite_sheet.dart';

import '../main.dart';
import '../my_game_audio.dart';

class Fusivel extends GameDecoration with Sensor {
  Fusivel(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.fusivelAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem && component.fusivel == false) {
      component.fusivel = true;
      removeFromParent();
      Sounds.getItem();
      if (component.life < 100) {
        (component).addLife(10);
      }
    }
  }
}

//----------------------------------------------------
class Alicate extends GameDecoration with Sensor {
  Alicate(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.alicateAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem && component.alicateVermelho == false) {
      component.alicateVermelho = true;
      removeFromParent();
      Sounds.getItem();
      if (component.life < 100) {
        (component).addLife(10);
      }
    }
  }
}

//----------------------------------------------------
class CartaoAzul extends GameDecoration with Sensor {
  CartaoAzul(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.cartaoAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem && component.cartaoAzul == false) {
      component.cartaoAzul = true;
      component.totalLigado += 1;
      removeFromParent();
      Sounds.getItem();
      if (component.life < 100) {
        (component).addLife(10);
      }
    }
  }
}

//----------------------------------------------------
class ChaveY extends GameDecoration with Sensor {
  ChaveY(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.chaveyAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem && component.chaveAmarela == false) {
      component.chaveAmarela = true;
      removeFromParent();
      Sounds.getItem();
      if (component.life < 100) {
        (component).addLife(10);
      }
    }
  }
}

//----------------------------------------------------
class ChaveG extends GameDecoration with Sensor {
  ChaveG(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.chavegAnim,
          position: position,
          width: tileSize,
          height: tileSize,
        );
  @override
  void onContact(GameComponent component) {
    if (component is Personagem && component.chaveVerde == false) {
      component.chaveVerde = true;
      removeFromParent();
      Sounds.getItem();
      if (component.life < 100) {
        (component).addLife(10);
      }
    }
  }
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
        Sounds.getItem();
      }
    }
  }
}

//----------------------------------------------------
class Matias extends GameDecoration with TapGesture, Lighting {
  Matias(Vector2 position)
      : super.withAnimation(
          ItemSpriteSheet.matiasAnim,
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
              text: 'Matias:  Julius, a mansão esta cheia de zumbi,' +
                  ' você precisa encontar os fuziveis e ligar a força pra gente conseguir sair daqui!'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: ItemSpriteSheet.matiasAnim.asWidget(),
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
          child: ItemSpriteSheet.matiasAnim.asWidget(),
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
