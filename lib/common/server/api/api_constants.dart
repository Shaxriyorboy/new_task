class ApiConst {
  static const connectionTimeout = 50000;
  static const sendTimeout = 50000;

  static const baseUrl = 'http://45.10.110.181:8080/';
  static const version = 'api/v1';

  // Courses apiflutter build ios --release
  static const login = '$version/auth/login';
  static const getProfile = '$version/auth/login/profile';
}

class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> paramLogin({String? email, String? password}) =>
      <String, dynamic>{
        'email': email,
        "password": password,
      };
}
