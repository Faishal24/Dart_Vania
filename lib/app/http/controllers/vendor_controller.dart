import 'package:tugas__vania/app/models/vendors.dart';
import 'package:vania/vania.dart';

class VendorController extends Controller {
  Future<Response> index() async {
    var res = await Vendors().query().get();

    return Response.json(res);
  }

  Future<Response> create(Request request) async {
    request.validate({
      'vend_id': 'required',
      'vend_name': 'required',
      'vend_address': 'required',
      'vend_kota': 'required',
      'vend_state': 'required',
      'vend_zip': 'required',
      'vend_country': 'required',
    });

    await Vendors().query().create({
      'vend_id': request.input('vend_id'),
      'vend_name': request.input('vend_name'),
      'vend_address': request.input('vend_address'),
      'vend_kota': request.input('vend_kota'),
      'vend_state': request.input('vend_state'),
      'vend_zip': request.input('vend_zip'),
      'vend_country': request.input('vend_country'),
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
      'vend_name': 'required',
      'vend_address': 'required',
      'vend_kota': 'required',
      'vend_state': 'required',
      'vend_zip': 'required',
      'vend_country': 'required',
    });

    var res = await Vendors().query().where('vend_id', '=', id).update({
      'vend_name': request.input('vend_name'),
      'vend_address': request.input('vend_address'),
      'vend_kota': request.input('vend_kota'),
      'vend_state': request.input('vend_state'),
      'vend_zip': request.input('vend_zip'),
      'vend_country': request.input('vend_country'),
    });

    return Response.json({'message': 'Data has been updated', 'res': res});
  }

  Future<Response> destroy(String id) async {
    var res = await Vendors().query().where('vend_id', '=', id).delete();

    return Response.json({'message': 'Data has been deleted', 'res': res});
  }
}

final VendorController vendorController = VendorController();
