import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:tarjetas_app/src/utils/app_colors.dart';

class TopActionsWidget extends StatelessWidget {
  const TopActionsWidget({super.key, required this.isDetailScreen, this.card});
  final bool isDetailScreen;
  final CardEntity? card;

  Future<dynamic> _showDeleteDialog(BuildContext context) {
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.orangeCard,
              size: 40.0,
            ),
            const Text(
              'Delete card?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Yes',
              style: TextStyle(color: AppColors.orangeCard),
            ),
            onPressed: () {
              cardsBloc.deleteCard(card!);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 40.0,
                  child: Icon(
                    CupertinoIcons.back,
                    size: 30.0,
                  ),
                ),
              ),
              if (isDetailScreen)
                Row(
                  children: [
                    _ActionButton(
                      card: card,
                      tooltipText: 'Edit',
                      icon: CupertinoIcons.pen,
                      onPressed: () {
                        cardsBloc.updateColorSelection(card!.colorIndex);
                        cardsBloc.updateTitleCardToSaveEdit(card!.title);
                        cardsBloc
                            .updateDescriptionCardToSaveEdit(card!.description);
                        cardsBloc.updateCardToEdit(card!);
                        Navigator.pushNamed(
                          context,
                          '/form',
                          arguments: (
                            card: card,
                            isEditMode: true,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    _ActionButton(
                      card: card,
                      tooltipText: 'Delete',
                      icon: CupertinoIcons.delete,
                      onPressed: () {
                        _showDeleteDialog(context);
                      },
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.card,
    required this.onPressed,
    required this.icon,
    required this.tooltipText,
  });

  final CardEntity? card;
  final VoidCallback onPressed;
  final IconData icon;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      child: GestureDetector(
        onTap: () => onPressed(),
        child: SizedBox(
          width: 30.0,
          child: Icon(
            icon,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
