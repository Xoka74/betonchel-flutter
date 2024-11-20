class Locations {
  Locations._();

  static const root = '/';

  // Auth
  static const auth = 'auth';
  static const login = 'login';

  // Home
  static const home = 'home';
  static const loading = 'loading';
  static const profile = 'profile';
  static const settings = 'settings';

  // Orders
  static const orders = 'orders';
  static const ordersMap = '$orders/map';
  static const orderDetails = '$orders/:id';
  static const orderEdit = '$orders/edit/:id';

  // Concrete grades
  static const concreteGrades = 'concrete-grades';
  static const concreteGradesNew = '$concreteGrades/new';
  static const concreteGradesEdit = '$concreteGrades/edit/:id';

  // Locations
  static const locations = 'locations';
  static const locationsSearch = '$locations/search';

  // Users
  static const users = 'users';
  static const usersCreate = '$users/create';
}
