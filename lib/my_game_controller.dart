import 'package:bonfire/base/game_component.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/game.dart';

class MyGameController extends GameComponent {
  bool gameOver = false;
  final int stage;

  MyGameController(this.stage);

  @override
  void update(double dt) {
    if (checkInterval('GameOver', 500, dt)) {
      if (gameRef.player?.isDead == true && gameOver == false) {
        gameOver = true;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Game over", textAlign: TextAlign.center),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                    child: const Text("iniciar jogo",
                        textAlign: TextAlign.center, textScaleFactor: 1.5),
                    onPressed: () {
                      _goStage(stage);
                    },
                  ),
                ),
              ],
            );
          },
        );
      }
    }

    super.update(dt);
  }

  void _goStage(int newStage) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          return Game(
            stage: newStage,
          );
        },
      ),
      (route) => false,
    );
  }
}
