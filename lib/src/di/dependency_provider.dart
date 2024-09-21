import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

class DependencyProvider extends InheritedWidget {
  final CardsBloc cardsBloc;

  const DependencyProvider({
    super.key,
    required this.cardsBloc,
    required super.child,
  });

  @override
  bool updateShouldNotify(DependencyProvider oldWidget) {
    return cardsBloc != oldWidget.cardsBloc;
  }

  static DependencyProvider of(BuildContext context) {
    final DependencyProvider? result =
        context.dependOnInheritedWidgetOfExactType<DependencyProvider>();
    assert(result != null, 'No DependencyProvider found in context');
    return result!;
  }
}
