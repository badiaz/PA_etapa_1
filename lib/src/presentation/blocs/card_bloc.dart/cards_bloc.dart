import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/domain/use_cases/get_cards_use_case.dart';

part 'cards_state.dart';

class CardsBloc {
  /// Estado actual del Bloc.
  CardsState _currentState;

  /// Controlador de stream que emitirá la lista de tarjetas.
  final StreamController<CardsState> _cardsController;

  final GetCardsUseCase _getCardsUseCase;

  CardsBloc({
    CardsState? initialState,
    required GetCardsUseCase getCardsUseCase,
  })  : _currentState = initialState ?? CardsState(),
        _getCardsUseCase = getCardsUseCase,
        _cardsController = StreamController<CardsState>.broadcast() {
    _cardsController.add(_currentState); // Emitir el estado inicial
  }

  /// Obtiene el stream para ser escuchado desde fuera de la clase.
  Stream<CardsState> get streamController async* {
    // Emitir el estado actual inmediatamente al suscribirse
    yield _currentState;
    // Al usar yield* el getter streamController delega la emisión al stream de cardsControllers
    yield* _cardsController.stream;
  }

  /// Obtiene el estado actual de la clase.
  CardsState get currentState => _currentState;

  /// Método para obtener las tarjetas usando el caso de uso
  Future<void> getCards() async {
    final cards = await _getCardsUseCase.call();
    _emitState(_currentState.copyWith(cards: cards));
  }

  /// Añade una nueva tarjeta a la lista y emite los cambios.
  void addCard() {
    final card = CardEntity(
      id: UniqueKey().toString(),
      colorIndex: _currentState.selectedColorIndex,
      title: _currentState.titlecardToEditSaveText,
      description: _currentState.descriptioncardToEditSaveText,
    );
    card.colorIndex = _currentState.selectedColorIndex;
    final List<CardEntity> cardsListCopy = List.from(_currentState.cards);
    cardsListCopy.add(card);
    _emitState(_currentState.copyWith(cards: cardsListCopy));
  }

  /// Actualiza una tarjeta existente y emite los cambios.
  void updateCard() {
    final index = _currentState.cards.indexOf(_currentState.cardToEdit!);
    if (index != -1) {
      final List<CardEntity> cardsListCopy = List.from(_currentState.cards);

      final updatedCard = CardEntity(
          id: _currentState.cards[index].id,
          colorIndex: _currentState.selectedColorIndex,
          title: _currentState.titlecardToEditSaveText,
          description: _currentState.descriptioncardToEditSaveText);
      _currentState.cards[index].colorIndex = _currentState.selectedColorIndex;
      _currentState.cards[index].title = _currentState.titlecardToEditSaveText;
      _currentState.cards[index].description =
          _currentState.descriptioncardToEditSaveText;
      cardsListCopy[index] = updatedCard;
      _emitState(_currentState.copyWith(cards: cardsListCopy));
    }
  }

  /// Elimina una tarjeta y emite los cambios.
  void deleteCard(CardEntity card) {
    final List<CardEntity> cardsListCopy = List.from(_currentState.cards);
    cardsListCopy.remove(card);
    _emitState(_currentState.copyWith(cards: cardsListCopy));
  }

  /// Actualiza la selección de colores.
  void updateColorSelection(int selectedColorIndex) {
    _emitState(_currentState.copyWith(selectedColorIndex: selectedColorIndex));
  }

  /// Carga al estado el valor del formfield del titulo
  void updateTitleCardToSaveEdit(String? title) {
    _emitState(_currentState.copyWith(titlecardToEditSaveText: title));
  }

  /// Carga al estado el valor del formfield de la descripcion
  void updateDescriptionCardToSaveEdit(String? description) {
    _emitState(
        _currentState.copyWith(descriptioncardToEditSaveText: description));
  }

  /// Carga al estado la card actual que se está editando
  void updateCardToEdit(CardEntity card) {
    _emitState(_currentState.copyWith(cardToEdit: card));
  }

  /// Emite el estado actual al stream y lo guarda como el estado actual.
  void _emitState(CardsState newState) {
    _currentState = newState;
    _cardsController.sink.add(_currentState); // Emitir el estado actual
  }

  /// Cierra el stream controller para prevenir fugas de memoria.
  void dispose() {
    _cardsController.close();
  }
}
