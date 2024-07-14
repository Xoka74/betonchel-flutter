class Locations {
  Locations._();

  static const root = '/';

  // Auth
  static const auth = 'auth';
  static const login = 'login';

  // Home
  static const home = 'home';
  static const loading = 'loading';
  static const notifications = 'notifications';
  static const profile = 'profile';
  static const settings = 'settings';

  // Orders
  static const orders = 'orders';
  static const orderDetails = '$orders/:id';
  static const orderEdit = '$orders/edit/:id';

  // Concrete grades
  static const concreteGrades = 'concrete-grades';
  static const concreteGradesNew = '$concreteGrades/new';
  static const concreteGradesEdit = '$concreteGrades/edit/:id';

  // Employees
  static const employees = 'employees';
  static const employeesCreate = '$employees/create';
}
