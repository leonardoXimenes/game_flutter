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
        radius: tamanho * 0.5,
        color: Colors.white.withOpacity(0.3),
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.6,
        pulseCurve: Curves.linear,
      ),
    );
  }
}

class LampY extends GameDecoration with Lighting {
  LampY(Vector2 position)
      : super(
          position: position,
          width: tamanho,
          height: tamanho,
        ) {
    setupLighting(
      LightingConfig(
        radius: tamanho * 0.5,
        color: Colors.orange.withOpacity(0.8),
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.6,
        pulseCurve: Curves.linear,
      ),
    );
  }
}

class LampG extends GameDecoration with Lighting {
  LampG(Vector2 position)
      : super(
          position: position,
          width: tamanho,
          height: tamanho,
        ) {
    setupLighting(
      LightingConfig(
        radius: tamanho * 0.5,
        color: Colors.green,
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.6,
        pulseCurve: Curves.linear,
      ),
    );
  }
}

class LampR extends GameDecoration with Lighting {
  LampR(Vector2 position)
      : super(
          position: position,
          width: tamanho,
          height: tamanho,
        ) {
    setupLighting(
      LightingConfig(
        radius: tamanho * 0.5,
        color: Colors.red,
        withPulse: true,
        blurBorder: 50,
        pulseVariation: 0.3,
        pulseSpeed: 0.6,
        pulseCurve: Curves.linear,
      ),
    );
  }
}
