import 'package:tugas__vania/app/http/controllers/customer_controller.dart';
import 'package:vania/vania.dart';
import 'package:tugas__vania/app/http/middleware/home_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.group(() {
      Router.get("/", customerController.index);
      Router.post("/", customerController.create);
      Router.put("/{id}", customerController.update);
      Router.delete("/{id}", customerController.destroy);
    },
    prefix: "customer"
    );

    Router.get("/hello-world", () {
      return Response.html('Hello World');
    }).middleware([HomeMiddleware()]);
  }
}
