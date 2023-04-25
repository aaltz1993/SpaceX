import 'package:spacex_api/spacex_api.dart';

class RocketRepository {
  final SpaceXApiClient _spaceXApiClient;

  RocketRepository({SpaceXApiClient? spaceXApiClient})
      : _spaceXApiClient = spaceXApiClient ?? SpaceXApiClient();

  Future<List<Rocket>> fetchAllRockets() {
    try {
      return _spaceXApiClient.fetchAllRockets();
    } on Exception {
      throw FetchRocketsException();
    }
  }
}

class FetchRocketsException implements Exception {}
