import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home.dart';
// import '../../features/expenses/presentation/pages/expenses_page.dart';
// import '../../features/expenses/presentation/pages/expense_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/', // Home es la principal
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const Home(),
      // routes: [
      //   // OJO: al ser hijas, NO llevan "/" al inicio
      //   GoRoute(
      //     path: 'expenses',
      //     builder: (_, __) => const ExpensesPage(),
      //   ),
      //   GoRoute(
      //     path: 'expenses/:id',
      //     builder: (_, state) =>
      //         ExpenseDetailPage(id: state.pathParameters['id']!),
      //   ),
      // ],
    ),
  ],
);
