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
        await Users().query().where('email', '=', email).first();

    if (user == null) {
      return Response.json({'message': 'User not found'}, 409);
    }

    if (email != user['email']) {
      return Response.json({'message': 'Invalid Credentials'}, 401);
    }

    if (!Hash().verify(password, user['password'])) {
      return Response.json({'message': 'Invalid Credentials'}, 401);
    }

    Map token = await Auth()
        .login(user)
        .createToken(expiresIn: Duration(days: 1), withRefreshToken: true);

    return Response.json(token, 201);
  }

  Future<Response> register(Request request) async {
    request.validate({
      'name': 'required',
      'email': 'required|email',
      'password': 'required'
    }, {
      'name.required': 'Name is required',
      'email.required': 'Email is required',
      'email.email': 'Email is not valid',
      'password.required': 'Password is required'
    });

    final name = request.input('name');
    final email = request.input('email');
    var password = request.input('password');

    var user = await Users().query().where('email', '=', email).first();
    if (user != null) {
      return Response.json({'message': 'User already exists'}, 209);
    }

    var hashedPassword = Hash().make(password);
    await Users().query().create({
      'name': name,
      'email': email,
      'password': hashedPassword,
      'created_at': DateTime.now().toIso8601String(),
    });

    return Response.json({'message': 'User created successfully'}, 201);
  }

}

final AuthController authController = AuthController();
