import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/decorations/energia.dart';
import 'package:game_usf/decorations/lamp.dart';
import 'package:game_usf/decorations/portaB.dart';
import 'package:game_usf/decorations/portaC.dart';
import 'package:game_usf/decorations/portaG.dart';
import 'package:game_usf/interface/player_interface.dart';
import 'package:game_usf/personagem.dart';
import 'package:game_usf/zumbi.dart';
import 'package:flutter/services.dart';

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
          'portaG': (properties) => PortaG(properties.position),
          'portaC': (properties) => PortaC(properties.position),
          'portaB': (properties) => PortaB(properties.position),
          'lampy': (properties) => LampY(properties.position),
          'lampg': (properties) => LampG(properties.position),
          'lampr': (properties) => LampR(properties.position),
          'fusivel': (properties) => Lamp(properties.position), //Fusivel
          'alicate': (properties) => LampR(properties.position), //Alicate
          'cartao': (properties) => Lamp(properties.position), //Cartao
          'chavey': (properties) => LampY(properties.position), //ChaveY
          'chaveg': (properties) => LampG(properties.position), //ChaveG
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
