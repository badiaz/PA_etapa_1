part of 'cards_bloc.dart';

class CardsState {
  /// Lista de tarjetas.
  final List<CardEntity> cards;
  final int selectedColorIndex;
  final String titlecardToEditSaveText;
  final String descriptioncardToEditSaveText;
  final CardEntity? cardToEdit;
  CardsState({
    this.cards = const [],
    this.selectedColorIndex = 1,
    this.descriptioncardToEditSaveText = '',
    this.titlecardToEditSaveText = '',
    this.cardToEdit,
  });

  /// [copyWith] es un metodo que retorna una nueva instancia del objeto con propiedades modificadas.
  CardsState copyWith({
    List<CardEntity>? cards,
    int? selectedColorIndex,
    String? titlecardToEditSaveText,
    String? descriptioncardToEditSaveText,
    CardEntity? cardToEdit,
  }) =>
      CardsState(
          cards: cards ?? this.cards,
          selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
          titlecardToEditSaveText:
              titlecardToEditSaveText ?? this.titlecardToEditSaveText,
          descriptioncardToEditSaveText: descriptioncardToEditSaveText ??
              this.descriptioncardToEditSaveText,
          cardToEdit: cardToEdit ?? this.cardToEdit);
}
