import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/personagem.dart';
import 'package:game_usf/zumbi.dart';

double tileSize = 16 * 4;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
            color: Colors.red,
            size: 100,
          ),
          actions: [
            JoystickAction(
              actionId: 1,
              color: Colors.red,
              margin: EdgeInsets.all(40),
              size: 80,
            )
          ]),
      map: TiledWorldMap('map/casarao.json',
          objectsBuilder: {'zumbi': (properties) => Zumbi(properties.position)},
          forceTileSize: Size(tileSize, tileSize)),
      player: Personagem(Vector2(tileSize * 28, tileSize * 36)),
      cameraConfig: CameraConfig(
          smoothCameraEnable: true,
          smoothCameraSpeed: 5,
          sizeMovementWindow: const Size(10, 10)),
      showCollisionArea: false,
    );
  }
}
