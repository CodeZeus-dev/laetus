import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future getColour({String colourHex}) async {
  var url = 'https://thecolorapi.com/id?hex=$colourHex';
  var response = await http.get(url);
  var jsonResponse = convert.json.decode(response.body);

  print(jsonResponse);

  return {
    'rgb': {
      'r': jsonResponse['rgb']['r'],
      'g': jsonResponse['rgb']['g'],
      'b': jsonResponse['rgb']['b']
    },
    'cmyk': {
      'c': jsonResponse['cmyk']['c'],
      'm': jsonResponse['cmyk']['m'],
      'y': jsonResponse['cmyk']['y'],
      'k': jsonResponse['cmyk']['k']
    },
    'name': jsonResponse['name']['value']
  };
}
