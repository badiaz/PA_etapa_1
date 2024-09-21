import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';

abstract class ICardsRepository {
  Future<List<CardEntity>> getCards();
}

class CardsRepository implements ICardsRepository {
  ///Lista para simular la llamada a una API
  final List<CardEntity> _cards = [
    CardEntity(
      title: 'Flutter',
      description:
          'Flutter es un kit de desarrollo de software creado por Google. '
          'Es utilizado para desarrollar aplicaciones nativas para Android, iOS, Linux, Mac, Windows, Google Fuchsia y la web desde una única base de código.',
      colorIndex: 6,
      id: UniqueKey().toString(),
    ),
    CardEntity(
      title: 'Artificial Intelligence',
      description:
          'La inteligencia artificial (IA) es la simulación de procesos de inteligencia humana por parte de máquinas, especialmente sistemas informáticos. '
          'Estos procesos incluyen el aprendizaje, el razonamiento y la autocorrección. '
          'Aplicaciones particulares de la IA incluyen sistemas expertos, reconocimiento de voz y visión artificial.',
      colorIndex: 2,
      id: UniqueKey().toString(),
    ),
    CardEntity(
      title: 'Blockchain',
      description:
          'Blockchain es una estructura de datos que representa un registro o libro mayor de transacciones distribuidas en una red de ordenadores. '
          'Las transacciones se agrupan en bloques y cada nuevo bloque se conecta al anterior mediante criptografía, formando una cadena inmutable.',
      colorIndex: 1,
      id: UniqueKey().toString(),
    ),
    CardEntity(
      title: 'Quantum Computing',
      description:
          'La computación cuántica utiliza los principios de la mecánica cuántica para realizar operaciones en datos. '
          'A diferencia de los bits en los ordenadores clásicos, que pueden ser 0 o 1, los qubits pueden representar ambos valores simultáneamente gracias a la superposición cuántica, '
          'lo que permite procesar grandes cantidades de datos a velocidades exponencialmente más rápidas.',
      colorIndex: 5,
      id: UniqueKey().toString(),
    ),
    CardEntity(
      title: 'Renewable Energy',
      description:
          'La energía renovable proviene de fuentes naturales que se regeneran constantemente, como la luz solar, el viento, la lluvia, las mareas, las olas y el calor geotérmico. '
          'A medida que la demanda mundial de energía crece, las tecnologías renovables juegan un papel crucial en la reducción de la dependencia de combustibles fósiles.',
      colorIndex: 3,
      id: UniqueKey().toString(),
    ),
    CardEntity(
      title: 'Augmented Reality',
      description:
          'La realidad aumentada (AR) es una tecnología que superpone información digital, como imágenes, sonidos y otros datos, sobre el mundo real a través de dispositivos como teléfonos móviles o gafas especiales. '
          'AR enriquece la experiencia del usuario al interactuar con el entorno real con elementos virtuales, transformando la manera en que percibimos e interactuamos con nuestro entorno.',
      colorIndex: 4,
      id: UniqueKey().toString(),
    ),
  ];
  @override
  Future<List<CardEntity>> getCards() async {
    await Future.delayed(const Duration(seconds: 2));
    return _cards;
  }
}
