import 'package:spacex_api/spacex_api.dart';

class FetchCrewMembersException implements Exception {}

class CrewRepository {
  CrewRepository({SpaceXApiClient? spaceXApiClient})
      : _spaceXApiClient = spaceXApiClient ?? SpaceXApiClient();

  final SpaceXApiClient _spaceXApiClient;

  Future<List<CrewMember>> fetchAllCrewMembers() async {
    try {
      final crewMembers = await _spaceXApiClient.fetchAllCrewMembers();

      crewMembers.sort((a, b) => a.name.compareTo(b.name));

      return crewMembers;
    } on Exception {
      throw FetchCrewMembersException();
    }
  }
}
