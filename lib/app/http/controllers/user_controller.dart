import 'package:vania/vania.dart';

class UserController extends Controller {
  Future<Response> index(Request request) async {
    Map? user = Auth().user();

    return Response.json(user);
  }
}

final UserController userController = UserController();
