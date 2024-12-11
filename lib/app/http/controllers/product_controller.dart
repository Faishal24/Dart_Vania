import 'package:tugas__vania/app/models/products.dart';
import 'package:vania/vania.dart';

class ProductController extends Controller {
  Future<Response> index() async {
    var res = await Products().query().get();

    return Response.json(res);
  }

  Future<Response> create(Request request) async {
    // prod_id vend_id prod_name prod_price prod_desc
    request.validate({
      'prod_id': 'required',
      'vend_id': 'required',
      'prod_name': 'required',
      'prod_price': 'required',
      'prod_desc': 'required',
    });

    await Products().query().create({
      'prod_id': request.input('prod_id'),
      'vend_id': request.input('vend_id'),
      'prod_name': request.input('prod_name'),
      'prod_price': request.input('prod_price'),
      'prod_desc': request.input('prod_desc'),
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

  Future<Response> update(Request request, String id) async {
    request.validate({
      'vend_id': 'required',
      'prod_name': 'required',
      'prod_price': 'required',
      'prod_desc': 'required',
    });

    var res = await Products().query().where('prod_id', '=', id).update({
      'vend_id': request.input('vend_id'),
      'prod_name': request.input('prod_name'),
      'prod_price': request.input('prod_price'),
      'prod_desc': request.input('prod_desc'),
    });

    return Response.json({'message': 'Data has been updated', 'res': res});
  }

  Future<Response> destroy(String id) async {
    var res = await Products().query().where('prod_id', '=', id).delete();

    return Response.json({'message': 'Data has been deleted', 'res': res});
  }
}

final ProductController productController = ProductController();
