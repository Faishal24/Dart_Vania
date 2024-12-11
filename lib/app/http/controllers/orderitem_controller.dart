import 'package:tugas__vania/app/models/orderitems.dart';
import 'package:vania/vania.dart';

class OrderitemController extends Controller {
  Future<Response> index() async {
    var res = await Orderitems().query().get();

    return Response.json(res);
  }

  Future<Response> create(Request request) async {
    request.validate({
      'order_item': 'required',
      'order_num': 'required',
      'prod_id': 'required',
      'quantity': 'required',
      'size': 'required',
    });

    await Orderitems().query().create({
      'order_item': request.input('order_item'),
      'order_num': request.input('order_num'),
      'prod_id': request.input('prod_id'),
      'quantity': request.input('quantity'),
      'size': request.input('size'),
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
      'order_num': 'required',
      'prod_id': 'required',
      'quantity': 'required',
      'size': 'required',
    });

    var res = await Orderitems().query().where('order_item', '=', id).update({
      'order_num': request.input('order_num'),
      'prod_id': request.input('prod_id'),
      'quantity': request.input('quantity'),
      'size': request.input('size'),
    });

    return Response.json({'message': 'Data has been updated', 'res': res});
  }

  Future<Response> destroy(int id) async {
    var res = await Orderitems().query().where('order_item', '=', id).delete();

    return Response.json({'message': 'Data has been deleted', 'res': res});
  }
}

final OrderitemController orderitemController = OrderitemController();
