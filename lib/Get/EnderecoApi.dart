import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:wms_pk/Modelos/ClasseEndereco.dart';
import 'package:http/http.dart' as http;
import 'package:wms_pk/PrimeiraTela_Endereco_Origem.dart';
import 'package:wms_pk/SegundaTela_Produto.dart';
import 'package:wms_pk/TerceiraTela_Endereco_Destino.dart';

class EnderecoApi {

  var url = "http://181.222.137.89:8099/DataSnap/rest/TServiceEndereco/GetEndereco/";

  Future<Endereco> GetEndereco(String codEndereco) async {

    final response = await http.get(url + codEndereco);
    if (response.statusCode == 200) {
      debugPrint("response.body: " + response.body);
      return Endereco.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao buscar endereço');
    }
  }
}
