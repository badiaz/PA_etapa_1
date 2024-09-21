import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/infrastructure/repository/cards_repository.dart';

abstract class IGetCardsUseCase {
  Future<List<CardEntity>> call();
}

class GetCardsUseCase {
  final CardsRepository repository;

  GetCardsUseCase({required this.repository});

  Future<List<CardEntity>> call() async {
    return await repository.getCards();
  }
}
