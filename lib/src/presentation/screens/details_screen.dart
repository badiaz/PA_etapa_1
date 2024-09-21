import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/presentation/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final CardEntity card;

  const DetailsScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopActionsWidget(
              isDetailScreen: true,
              card: card,
            ),
            CardShapeWidget(
              card: card,
              cardHeight: size.height * 0.8,
              cardWidth: size.width,
              titleSize: size.width * 0.1,
              descriptionSize: size.width * 0.05,
              canShowDetail: true,
            ),
          ],
        ),
      ),
    );
  }
}
