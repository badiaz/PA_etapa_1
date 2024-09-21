part of 'main.dart';

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _buildFadeRoute(const HomeScreen());
    case '/detail':
      final ({CardEntity card}) extra =
          settings.arguments as ({CardEntity card});
      return _buildFadeRoute(DetailsScreen(
        card: extra.card,
      ));
    case '/form':
      final ({CardEntity? card, bool isEditMode}) extra =
          settings.arguments as ({CardEntity? card, bool isEditMode});
      return _buildScaleRoute(FormScreen(
        isEditMode: extra.isEditMode,
        card: extra.card,
      ));
    default:
      return null;
  }
}

PageRouteBuilder _buildFadeRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

PageRouteBuilder _buildScaleRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}
