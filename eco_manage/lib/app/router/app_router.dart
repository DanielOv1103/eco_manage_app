import 'package:go_router/go_router.dart';
import '../../features/finance/presentation/pages/budgets/budget.dart';
import '../../features/finance/presentation/pages/budgets/budget_create.dart';
import '../../features/finance/presentation/pages/finance.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/layout/main_layout.dart';
// import '../../features/expenses/presentation/pages/expenses_page.dart';
// import '../../features/expenses/presentation/pages/expense_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/', // Home es la principal
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const Home(),
          routes: [
            // OJO: al ser hijas, NO llevan "/" al inicio
            GoRoute(
              path: 'finance',
              builder: (_, __) => const Finance(),
            ),
            GoRoute(
              path: 'finance/budgets',
              builder: (_, __) => const Budget()
            ),
            GoRoute(
              path: 'finance/budgets/create',
              builder: (_, __) => const BudgetCreate()
            ),
            // GoRoute(
            //   path: 'expenses/:id',
            //   builder: (_, state) =>
            //       ExpenseDetailPage(id: state.pathParameters['id']!),
            // ),
          ],
        ),
      ],
    ),
  ],
);
