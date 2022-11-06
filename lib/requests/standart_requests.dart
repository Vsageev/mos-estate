import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/pages/standart_calculation/models/standart_request.dart';
import 'package:mos_estate/pages/standart_calculation/models/standart_response.dart';
import 'package:mos_estate/shared/constants/request_pathes.dart';
import 'package:mos_estate/shared/services/login_service.dart';

class StandartRequests {
  static Future<StandartResponse> getAnalogues(InputFlat flat) async {
    final body = StandartRequest.fromInput(flat).toMap();

    print(json.encode(body));

    final response = await http.post(Uri.https(host, '/api/getCianAnalogs'), body: json.encode(body), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${LoginService.instance.token}",
    });

    return StandartResponse.fromJson(response.body);
  }
}
