import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
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
        objectsBuilder: {'zumbi': (properties) => Zumbi(properties.position)},
      ),
      player: Personagem(Vector2(tileSize * 28, tileSize * 36)),
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
