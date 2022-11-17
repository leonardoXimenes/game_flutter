import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/decorations/energia.dart';
import 'package:game_usf/decorations/fim_de_jogo.dart';
import 'package:game_usf/decorations/item.dart';
import 'package:game_usf/decorations/lamp.dart';
import 'package:game_usf/decorations/porta_amarela.dart';
import 'package:game_usf/decorations/porta_amarela_de_lado.dart';
import 'package:game_usf/decorations/porta_azul.dart';
import 'package:game_usf/decorations/porta_branca_de_lado.dart';
import 'package:game_usf/decorations/porta_verde_de_lado.dart';
import 'package:game_usf/decorations/porta_vermelha.dart';
import 'package:game_usf/decorations/porta_vermelha_de_lado.dart';
import 'package:game_usf/interface/player_interface.dart';
import 'package:game_usf/characters/personagem.dart';
import 'package:game_usf/characters/zumbi.dart';
import 'package:game_usf/my_game_audio.dart';
import 'decorations/porta_branca.dart';
import 'main.dart';
import 'my_game_controller.dart';

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
          directional: JoystickDirectional(
            color: Colors.grey,
            size: 100,
          ),
          actions: [
            JoystickAction(
              actionId: 1,
              color: Colors.grey,
              margin: const EdgeInsets.all(40),
              size: 80,
            )
          ]),
      map: TiledWorldMap(
        'map/casarao.json',
        objectsBuilder: {
          'zumbi': (properties) => Zumbi(properties.position),
          'lamp': (properties) => Lamp(properties.position),
          'energia': (properties) => Energia(properties.position),
          'portaG': (properties) => PortaBranca(properties.position),
          'portaC': (properties) => PortaBrancaCima(properties.position),
          'portaB': (properties) => PortaBrancaBaixo(properties.position),
          'lampy': (properties) => LampY(properties.position),
          'lampg': (properties) => LampG(properties.position),
          'lampr': (properties) => LampR(properties.position),
          'fusivel': (properties) => Fusivel(properties.position),
          'alicate': (properties) => Alicate(properties.position),
          'cartaob': (properties) => CartaoAzul(properties.position),
          'chavey': (properties) => ChaveY(properties.position),
          'chaveg': (properties) => ChaveG(properties.position),
          'vida': (properties) => Vida(properties.position),
          'matias': (properties) => Matias(properties.position),
          'portaAzul': (properties) => PortaAzul(properties.position),
          'portaVermelha': (properties) => PortaVermelha(properties.position),
          'portaVermelhaCima': (properties) =>
              PortaVermelhaCima(properties.position),
          'portaVermelhaBaixo': (properties) =>
              PortaVermelhaBaixo(properties.position),
          'portaVerdeCima': (properties) => PortaVerdeCima(properties.position),
          'portaVerdeBaixo': (properties) =>
              PortaVerdeBaixo(properties.position),
          'portaAmarelaCima': (properties) =>
              PortaAmarelaCima(properties.position),
          'portaAmarelaBaixo': (properties) =>
              PortaAmarelaBaixo(properties.position),
          'portaAmarela': (properties) => PortaAmarela(properties.position),
          'fim': (properties) => Fim(properties.position),
        },
      ),
      player: Personagem(
        Vector2(tileSize * 28, tileSize * 36),
      ),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(
              game: game,
            )
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      components: [
        MyGameController(widget.stage),
      ],
      cameraConfig: CameraConfig(
        smoothCameraEnable: true,
        smoothCameraSpeed: 5,
        sizeMovementWindow: const Size(10, 10),
        zoom: 4.0,
      ),
      showCollisionArea: false,

      //---iluminação do ambiente----------------------------
      lightingColorGame: Colors.black.withOpacity(0.98),
      onReady: (game) {
        Sounds.playBackgroundSound();
      },
    );
  }
}
