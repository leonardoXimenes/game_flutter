import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/sprite_sheets/decoration_sprite_sheet.dart';

import 'dart:async' as async;

String imagem = 'assets/images/head.png';

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';

  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  double life = 0;
  final double widthMax = 100;
  double widthCurrent = 100;

  late async.Timer _lifetime;
  @override
  void initState() {
    _lifetime =
        async.Timer.periodic(const Duration(milliseconds: 100), _veryfiLife);
    super.initState();
  }

  @override
  void dispose() {
    _lifetime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: size.width * .075,
                height: size.width * .075,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(50, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 4),
                ),
              ),
              SizedBox(
                height: size.width * .075,
                width: size.width * .075,
                child: DecorationSpriteSheet.rosto.asWidget(),
              ),
            ],
          ),
          const SizedBox(
            width: 2,
          ),
          Stack(
            children: [
              Container(
                width: widthCurrent * size.width * .0015,
                height: size.width * .075,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(99, 0, 177, 6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: widthMax * size.width * .0015,
                height: size.width * .075,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(47, 141, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _veryfiLife(async.Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = widget.game.player?.life ?? 0;

        final percent = life / (widget.game.player?.maxLife ?? 0);
        widthCurrent = widthMax * percent;
      });
    }
  }
}
