import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/local/fake_data.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/models/models.dart';

class AuthenticationService {
  Future<Auth> login(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    User isName = fakeUsers.firstWhere(
      (element) => element.name == user.name,
      orElse: () => emptyUser(),
    );
    User isPassword = fakeUsers.firstWhere(
      (element) => element.password == user.password,
      orElse: () => emptyUser(),
    );
    if (isName.name != '' && isPassword.password != '') {
      return Auth(
        message: 'Succes welcome user',
        status: true,
        aditionalData: getRandomString(15),
      );
    }
    return Auth(message: 'Credenciales incorrectas', status: false);
  }
}

final authRepositoryProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService();
});
