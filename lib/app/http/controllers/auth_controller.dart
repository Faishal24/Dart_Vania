import 'package:tugas__vania/app/models/users.dart';
import 'package:vania/vania.dart';

class AuthController extends Controller {
  Future<Response> login(Request request) async {
    request.validate({
      'email': 'required|email',
      'password': 'required'
    }, {
      'email.required': 'Email is required',
      'email.email': 'Email is not valid',
      'password.required': 'Password is required'
    });

    var email = request.input('email');
    var password = request.input('password').toString();

    final Map<String, dynamic>? user =
        await Users().query().where('email', email).first();

    if (user == null) {
      return Response.json({'message': 'User not found'});
    }

    if (email != user['email']) {
      return Response.json({'message': 'Email is incorrect'});
    }

    if (password != user['password']) {
      return Response.json({'message': 'Password is incorrect'});
    }

    Map token = await Auth()
        .login(user)
        .createToken(expiresIn: Duration(days: 1), withRefreshToken: true);

    return Response.json({"message": "Login success", "token": token});
  }

  Future<Response> create() async {
    return Response.json({'message': 'Create User'});
  }

}

final AuthController authController = AuthController();
