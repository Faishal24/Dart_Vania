import 'package:tugas__vania/app/models/orders.dart';
import 'package:vania/vania.dart';

class OrderController extends Controller {
  Future<Response> index() async {
    var res = await Orders().query().get();

    return Response.json(res);
  }

  Future<Response> create(Request request) async {
    request.validate({
      'order_num': 'required',
      'order_date': 'required',
      'cust_id': 'required',
    });

    await Orders().query().create({
      'order_num': request.input('order_num'),
      'order_date': request.input('order_date'),
      'cust_id': request.input('cust_id'),
    });

    return Response.json({'message': 'Data has been created'});
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'order_date': 'required',
      'cust_id': 'required',
    });

    var res = await Orders().query().where('order_num', '=', id).update({
      'order_date': request.input('order_date'),
      'cust_id': request.input('cust_id'),
    });

    return Response.json({'message': 'Data has been updated', 'res': res});
  }

  Future<Response> destroy(int id) async {
    var res = await Orders().query().where('order_num', '=', id).delete();

    return Response.json({'message': 'Data has been deleted', 'res': res});
  }
}

final OrderController orderController = OrderController();
