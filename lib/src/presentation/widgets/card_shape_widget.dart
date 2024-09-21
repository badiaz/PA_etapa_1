import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/utils/maps.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';

class CardShapeWidget extends StatelessWidget {
  const CardShapeWidget({
    super.key,
    required this.card,
    required this.cardHeight,
    required this.cardWidth,
    required this.titleSize,
    required this.descriptionSize,
    required this.canShowDetail,
  });

  final CardEntity card;
  final double cardHeight;
  final double cardWidth;
  final double titleSize;
  final double? descriptionSize;
  final bool canShowDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: card.id,
      child: Material(
        elevation: 2,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: getCardColorByIndex(card.colorIndex),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: titleSize),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: canShowDetail
                        ? const BouncingScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    child: Text(
                      card.description,
                      maxLines: canShowDetail ? null : 3,
                      style: TextStyle(fontSize: descriptionSize),
                      overflow: canShowDetail ? null : TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
