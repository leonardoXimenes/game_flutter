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
              text: 'Matias: Julius, são 4 fusíveis e o cartão dessa '
                  'porta que está caído em algum lugar ao norte do casarão, '
                  'encontre os 4 fusíveis e coloca na caixa de força que está '
                  'ao leste do casarão e depois volte aqui.'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: ItemSpriteSheet.matiasAnim.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(
              text: 'Se você fizer isso nós vamos conseguir abrir essa '
                  'porta com o cartão, mas antes você vai precisar '
                  'encontrar as chaves para conseguir acessar todas as '
                  'áreas do casarão.'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: ItemSpriteSheet.matiasAnim.asWidget(),
        ),
        personSayDirection: PersonSayDirection.RIGHT,
      ),
      Say(
        text: [
          const TextSpan(text: 'Julius: Ah, é verdade, tinha esquecido.'),
        ],
        person: SizedBox(
          height: 100,
          width: 100,
          child: PlayerSpriteSheet.idleright.asWidget(),
        ),
      ),
    ]);
  }

  @override
  void onTapCancel() {
    //
  }

  @override
  void onTapDown(int pointer, Offset position) {
    //
  }

  @override
  void onTapUp(int pointer, Offset position) {
    //
  }
}
