// import 'package:test/test.dart';
// import 'package:laetus/helpers/color_retriever.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;

// class MockClient extends Mock implements http.Client {}

// main() {
//   group('getColour', () {
//     test('returns the color\'s properties given a hex code if the http call completes successfully', () async {
//       final client = MockClient();

//       when(client.get('http://thecolorapi.com/id?hex=800000'))
//         .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

//       expect(await getColour(client, colourHex: '800000'), isA<Map<String,Map<String,String>>>());
//     });

//     test('throws an exception if the http call completes with an error', () {
//       final client = MockClient();

//       when(client.get('http://thecolorapi.com/id?hex=800000'))
//         .thenAnswer((_) async => http.Response('Not Found', 404));

//       expect(getColour(client, colourHex: '800000'), throwsException);
//     });
//   });
// }