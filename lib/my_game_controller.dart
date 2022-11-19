import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/game.dart';
import 'package:game_usf/sprite_sheets/item_sprite_sheet.dart';
import 'package:game_usf/sprite_sheets/player_sprite_sheet.dart';

class MyGameController extends GameComponent {
  bool gameOver = false;
  final int stage;
  bool falar = true;

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
      if (falar) {
        TalkDialog.show(context, [
          Say(
            text: [
              const TextSpan(
                  text: 'Matias:  Julius, a mansão esta cheia de zumbi,'
                      ' você precisa encontar os fuziveis e ligar a força '
                      'pra gente conseguir sair daqui!'),
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
                  text:
                      'Um segurança deixou o cartão da porta de entrada cair ao '
                      'norte do casarão, você vai precisar encontrar a '
                      'chave daquela area para chegar la!'),
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
              const TextSpan(text: 'Julius: Deixa comigo !!!'),
            ],
            person: SizedBox(
              height: 100,
              width: 100,
              child: PlayerSpriteSheet.idleright.asWidget(),
            ),
          ),
        ]);
        falar = false;
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
