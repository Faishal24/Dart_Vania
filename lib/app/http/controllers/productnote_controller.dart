import 'package:tugas__vania/app/models/productnotes.dart';
import 'package:vania/vania.dart';

class ProductnoteController extends Controller {
  Future<Response> index() async {
    var res = await Productnotes().query().get();

    return Response.json(res);
  }

  Future<Response> create(Request request) async {
    request.validate({
      'note_id': 'required',
      'prod_id': 'required',
      'note_date': 'required',
      'note_text': 'required',
    });

    await Productnotes().query().create({
      'note_id': request.input('note_id'),
      'prod_id': request.input('prod_id'),
      'note_date': request.input('note_date'),
      'note_text': request.input('note_text'),
    });

    return Response.json({'message': 'Data has been created'});
  }

  Future<Response> update(Request request, String id) async {
    request.validate({
      'prod_id': 'required',
      'note_date': 'required',
      'note_text': 'required',
    });

    var res = await Productnotes().query().where('note_id', '=', id).update({
      'prod_id': request.input('prod_id'),
      'note_date': request.input('note_date'),
      'note_text': request.input('note_text'),
    });

    return Response.json({'message': 'Data has been updated', 'res': res});
  }

  Future<Response> destroy(String id) async {
    var res = await Productnotes().query().where('note_id', '=', id).delete();

    return Response.json({'message': 'Data has been deleted', 'res': res});
  }
}

final ProductnoteController productnoteController = ProductnoteController();
