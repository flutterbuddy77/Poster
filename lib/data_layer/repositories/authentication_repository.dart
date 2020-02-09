import 'package:poster/data_layer/services/auth_service.dart';

class AuthenticationRepository {
  final AuthenticationService _authenticationService;

  AuthenticationRepository(this._authenticationService)
      : assert(_authenticationService != null);
}
