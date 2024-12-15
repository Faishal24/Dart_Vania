import 'package:tugas__vania/app/http/controllers/auth_controller.dart';
import 'package:tugas__vania/app/http/controllers/customer_controller.dart';
import 'package:tugas__vania/app/http/controllers/order_controller.dart';
import 'package:tugas__vania/app/http/controllers/orderitem_controller.dart';
import 'package:tugas__vania/app/http/controllers/product_controller.dart';
import 'package:tugas__vania/app/http/controllers/productnote_controller.dart';
import 'package:tugas__vania/app/http/controllers/user_controller.dart';
import 'package:tugas__vania/app/http/controllers/vendor_controller.dart';
import 'package:tugas__vania/app/http/middleware/authenticate.dart';
import 'package:vania/vania.dart';
import 'package:tugas__vania/app/http/middleware/home_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.group(() {
      Router.post("/login", authController.login);
      Router.post("/register", authController.register);
    }, prefix: "auth");

    Router.group(() {
      Router.get("/", customerController.index);
      Router.post("/", customerController.create);
      Router.put("/{id}", customerController.update);
      Router.delete("/{id}", customerController.destroy);
    }, prefix: "customer", middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.get("/", orderController.index);
      Router.post("/", orderController.create);
      Router.put("/{id}", orderController.update);
      Router.delete("/{id}", orderController.destroy);
    }, prefix: "order", middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.get("/", orderitemController.index);
      Router.post("/", orderitemController.create);
      Router.put("/{id}", orderitemController.update);
      Router.delete("/{id}", orderitemController.destroy);
    }, prefix: "orderitem", middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.get("/", vendorController.index);
      Router.post("/", vendorController.create);
      Router.put("/{id}", vendorController.update);
      Router.delete("/{id}", vendorController.destroy);
    }, prefix: "vendor", middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.get("/", productController.index);
      Router.post("/", productController.create);
      Router.put("/{id}", productController.update);
      Router.delete("/{id}", productController.destroy);
    }, prefix: "product", middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.get("/", productnoteController.index);
      Router.post("/", productnoteController.create);
      Router.put("/{id}", productnoteController.update);
      Router.delete("/{id}", productnoteController.destroy);
    }, prefix: "productnote", middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.get("/", userController.index);
    }, prefix: "user", middleware: [AuthenticateMiddleware()]);

    Router.get("/hello-world", () {
      return Response.html('Hello World');
    }).middleware([HomeMiddleware()]);
  }
}
