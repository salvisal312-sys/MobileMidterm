class UserRepository {
  // Private map to store users
  static final Map<String, String> _users = {};

  // Register a new user
  static void register(String email, String password) {
    _users[email] = password;
  }

  // Login check
  static bool login(String email, String password) {
    return _users.containsKey(email) && _users[email] == password;
  }
}
