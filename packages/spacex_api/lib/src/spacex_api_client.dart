import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex_api/spacex_api.dart';

class SpaceXApiClient {
  SpaceXApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const authority = 'api.spacexdata.com';

  Future<List<Rocket>> fetchAllRockets() async {
    final uri = Uri.https(authority, '/v4/rockets');

    final response = await _httpClient.get(uri);

    if (response.statusCode != 200) throw FetchRocketsFailedException();

    final json = jsonDecode(response.body);

    return (json as List)
        .map((item) => Rocket.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<CrewMember>> fetchAllCrewMembers() async {
    final uri = Uri.https(authority, '/v4/crew');

    final response = await _httpClient.get(uri);

    if (response.statusCode != 200) throw FetchCrewFailedException();

    final json = jsonDecode(response.body);

    return (json as List)
        .map((item) => CrewMember.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class FetchRocketsFailedException implements Exception {}

class FetchCrewFailedException implements Exception {}
