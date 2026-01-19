abstract final class AppRoutes {

  // ============ Names ============

  //nombres
  static const String splash = 'splash';
  static const String home = 'home';

  //modulos
  static const String authModule = 'auth';
  static const String dashboardModule = 'dashboard';

  // ============ Paths ============

  //path
  static const String homePath = '/home';

  // ============ Helpers (para construir rutas con params) ============
  static String expenseDetail(String id) => '/home/$id';

  // Si prefieres int:
  static String expenseDetailByInt(int id) => '/home/$id';

  // ============ Query params helpers (opcional) ============
  // Ej: /expenses?month=2026-01
  static String expensesWithMonth(String month) => '/home?month=$month';
}
