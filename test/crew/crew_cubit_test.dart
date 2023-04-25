import 'package:bloc_test/bloc_test.dart';
import 'package:crew_repository/crew_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex/common/load_state.dart';
import 'package:spacex/crew/crew.dart';
import 'package:spacex_api/spacex_api.dart';

class MockCrewRepository extends Mock implements CrewRepository {}

void main() {
  group('CrewCubit', () {
    // set-up
    late CrewRepository crewRepository;

    final crewMembers = List.generate(
      3,
      (index) => CrewMember(
        id: '$index',
        name: 'Donald Trump',
        status: 'active',
        agency: 'SpaceCloudsX',
        image:
            'https://media-exp1.licdn.com/dms/image/C4D03AQHVNIVOMkwQaA/profile-displayphoto-shrink_200_200/0/1631637257882?e=1637193600&v=beta&t=jFm-Ckb0KS0Z5hJDbo3ZBSEZSYLHfllUf4N-IV2NDTc',
        wikipedia: 'https://www.wikipedia.org/',
        launches: ['Launch $index'],
      ),
    );

    setUp(() {
      crewRepository = MockCrewRepository();

      when(() => crewRepository.fetchAllCrewMembers())
          .thenAnswer((_) async => crewMembers);
    });

    test(
      'constructor has default state',
      () => {
        expect(
          CrewCubit(crewRepository: crewRepository).state,
          equals(const CrewState()),
        )
      },
    );

    blocTest<CrewCubit, CrewState>(
      'emits success state with crew members',
      build: () => CrewCubit(crewRepository: crewRepository),
      act: (cubit) => cubit.fetchCrewMembers(),
      expect: () => [
        const CrewState(loadState: LoadState.loading),
        CrewState(
          loadState: LoadState.success,
          crewMembers: crewMembers,
        )
      ],
    );

    blocTest<CrewCubit, CrewState>(
      'emits failure state when repository throws exception',
      build: () {
        when(() => crewRepository.fetchAllCrewMembers()).thenThrow(Exception());
        return CrewCubit(crewRepository: crewRepository);
      },
      act: (cubit) => cubit.fetchCrewMembers(),
      expect: () => [
        const CrewState(loadState: LoadState.loading),
        const CrewState(loadState: LoadState.failure)
      ],
    );
  });
}
