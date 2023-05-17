import 'package:e_cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final AppRouter = GoRouter(initialLocation: '/home-screen', routes: [
  GoRoute(
    path: '/home-screen',
    name: HomeScreen.name,
    builder: (context, state) => HomeScreen(),
  ),
]);
