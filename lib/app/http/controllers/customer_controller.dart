import 'package:tugas__vania/app/models/customers.dart';
import 'package:vania/vania.dart';

class CustomerController extends Controller {
  Future<Response> index() async {
    var res = await Customers().query().get();

    return Response.json(res);
  }

  Future<Response> create(Request request) async {
    request.validate({
      'cust_id': 'required',
      'cust_name': 'required',
      'cust_address': 'required',
      'cust_city': 'required',
      'cust_state': 'required',
      'cust_zip': 'required',
      'cust_country': 'required',
      'cust_telp': 'required',
    });

    await Customers().query().create({
      'cust_id': request.input('cust_id'),
      'cust_name': request.input('cust_name'),
      'cust_address': request.input('cust_address'),
      'cust_city': request.input('cust_city'),
      'cust_state': request.input('cust_state'),
      'cust_zip': request.input('cust_zip'),
      'cust_country': request.input('cust_country'),
      'cust_telp': request.input('cust_telp'),
    });

    return Response.json({'message': 'Data has been created'});
  }

  Future<Response> update(Request request, String id) async {
    request.validate({
      'cust_name': 'required',
      'cust_address': 'required',
      'cust_city': 'required',
      'cust_state': 'required',
      'cust_zip': 'required',
      'cust_country': 'required',
      'cust_telp': 'required',
    });

    var res = await Customers().query().where('cust_id', '=', id).update({
      'cust_name': request.input('cust_name'),
      'cust_address': request.input('cust_address'),
      'cust_city': request.input('cust_city'),
      'cust_state': request.input('cust_state'),
      'cust_zip': request.input('cust_zip'),
      'cust_country': request.input('cust_country'),
      'cust_telp': request.input('cust_telp'),
    });

    return Response.json({'message': 'Data has been updated', 'res': res});
  }

  Future<Response> destroy(String id) async {
    var res = await Customers().query().where('cust_id', '=', id).delete();

    return Response.json({'message': 'Data has been deleted', 'res': res});
  }
}

final CustomerController customerController = CustomerController();
