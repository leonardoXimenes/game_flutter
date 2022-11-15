import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/decorations/energia.dart';
import 'package:game_usf/decorations/item.dart';
import 'package:game_usf/decorations/lamp.dart';
import 'package:game_usf/decorations/portaB.dart';
import 'package:game_usf/decorations/portaC.dart';
import 'package:game_usf/decorations/porta_azul.dart';
import 'package:game_usf/decorations/porta_branca_de_lado.dart';
import 'package:game_usf/decorations/porta_verde_de_lado.dart';
import 'package:game_usf/decorations/porta_vermelha.dart';
import 'package:game_usf/decorations/porta_vermelha_de_lado.dart';
import 'package:game_usf/interface/player_interface.dart';
import 'package:game_usf/personagem.dart';
import 'package:game_usf/zumbi.dart';
import 'package:flutter/services.dart';
import 'decorations/portag_branca.dart';

double tileSize = 16;
void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game RE2D',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

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
          'mathias': (properties) => Mathias(properties.position),
          'portaAzul': (properties) => PortaAzul(properties.position),
          'portaVermelha': (properties) => PortaVermelha(properties.position),
          'portaVermelhaCima': (properties) =>
              PortaVermelhaCima(properties.position),
          'portaVermelhaBaixo': (properties) =>
              PortaVermelhaBaixo(properties.position),
          'portaVerdeCima': (properties) => PortaVerdeCima(properties.position),
          'portaVerdeBaixo': (properties) =>
              PortaVerdeBaixo(properties.position),
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
      cameraConfig: CameraConfig(
        smoothCameraEnable: true,
        smoothCameraSpeed: 5,
        sizeMovementWindow: const Size(10, 10),
        zoom: 4.0,
      ),
      showCollisionArea: false,

      //---iluminação do ambiente----------------------------
      lightingColorGame: Colors.black.withOpacity(0.98),
    );
  }
}
