import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/presentation/widgets/widgets.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

class FormScreen extends StatelessWidget {
  final CardEntity? card;
  final bool isEditMode;
  const FormScreen({super.key, this.card, required this.isEditMode});

  @override
  Widget build(BuildContext context) {
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TopActionsWidget(
                    isDetailScreen: false,
                  ),
                  CreateEditFormWidget(
                    cardsController: cardsBloc,
                    card: card,
                  ),
                ],
              ),
            ),
          ),
          FormNavbarWidget(
            isEditMode: isEditMode,
          )
        ],
      ),
    );
  }
}
