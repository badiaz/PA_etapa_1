import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:tarjetas_app/src/presentation/widgets/card_shape_widget.dart';
import 'package:tarjetas_app/src/utils/app_colors.dart';

class CardsListStreamWidget extends StatelessWidget {
  const CardsListStreamWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;

    return SizedBox(
      height: size.height * 0.8,
      child: StreamBuilder<CardsState>(
        stream: cardsBloc.streamController,
        builder: (context, snapshot) {
          final state = snapshot.data ?? cardsBloc.currentState;
          if (state.cards.isEmpty) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.orangeCard,
            ));
          }
          return GridView.builder(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: size.width * 0.26),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: state.cards.length,
            itemBuilder: (context, index) {
              final CardEntity card = state.cards[index];
              return _Card(
                card: card,
                index: index,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: (card: card),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.card,
    required this.index,
    required this.onPressed,
  });

  final CardEntity card;
  final int index;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onPressed(),
      child: CardShapeWidget(
        card: card,
        cardHeight: size.height * 0.1,
        cardWidth: size.height * 0.1,
        titleSize: size.width * 0.05,
        descriptionSize: size.width * 0.04,
        canShowDetail: false,
      ),
    );
  }
}
