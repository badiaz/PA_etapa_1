import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/domain/use_cases/get_cards_use_case.dart';
import 'package:tarjetas_app/src/infrastructure/repository/cards_repository.dart';
import 'package:tarjetas_app/src/presentation/screens/details_screen.dart';
import 'package:tarjetas_app/src/presentation/screens/form_screen.dart';
import 'package:tarjetas_app/src/presentation/screens/home_screen.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:tarjetas_app/src/utils/app_colors.dart';

part 'router.dart';
part 'initial_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      cardsBloc: CardsBloc(
        getCardsUseCase: GetCardsUseCase(repository: CardsRepository()),
      )..getCards(),
      child: MaterialApp(
          debugShowCheckedModeBanner: true,
          theme: ThemeData(
            fontFamily: 'Ubuntu',
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.transparent),
            inputDecorationTheme:
                const InputDecorationTheme(border: InputBorder.none),
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.orangeCard,
                selectionColor: Colors.grey[300],
                selectionHandleColor: AppColors.orangeCard),
          ),
          initialRoute: '/',
          onGenerateRoute: generateRoutes),
    );
  }
}
