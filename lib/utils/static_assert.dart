/// Used for compile-time conditional statements
/// Use only as annotation
class StaticAssert {
  const StaticAssert(bool condition, String message) : assert(condition, message);
}
