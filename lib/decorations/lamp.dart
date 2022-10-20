import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_usf/personagem.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position)
      : super(
          position: position,
          width: tamanho,
          height: tamanho,
        ) {
    setupLighting(
      LightingConfig(
        radius: tamanho * 1.1,
        color: Colors.orange.withOpacity(0.3),
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.5,
        pulseCurve: Curves.linear,
      ),
    );
  }
}
