import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex/common/load_state.dart';
import 'package:spacex/rockets/cubit/rockets_cubit.dart';
import 'package:spacex_api/spacex_api.dart';

class MockRocketRepository extends Mock implements RocketRepository {}

void main() {
  group('RocketsCubit', () {
    late RocketRepository rocketRepository;

    final rockets = List.generate(
      3,
      (index) => Rocket(
        id: '$index',
        name: 'mock-rocket-name-$index',
        description: 'mock-rocket-description-$index',
        height: const Length(meters: 1, feet: 1),
        diameter: const Length(meters: 1, feet: 1),
        mass: const Mass(kg: 1, lb: 1),
      ),
    );

    setUp(() {
      rocketRepository = MockRocketRepository();

      when(() => rocketRepository.fetchAllRockets())
          .thenAnswer((_) async => rockets);
    });

    test('constructor has default state', () {
      expect(
        RocketsCubit(rocketRepository: rocketRepository).state,
        equals(const RocketsState()),
      );
    });

    group('.fetchAllRockets', () {
      blocTest<RocketsCubit, RocketsState>(
        'emits success state with rockets',
        build: () => RocketsCubit(rocketRepository: rocketRepository),
        act: (cubit) => cubit.fetchAllRockets(),
        expect: () => [
          const RocketsState(loadState: LoadState.loading),
          RocketsState(loadState: LoadState.success, rockets: rockets),
        ],
      );

      blocTest(
        'emits failure state when throws exception',
        build: () {
          when(() => rocketRepository.fetchAllRockets()).thenThrow(Exception());

          return RocketsCubit(rocketRepository: rocketRepository);
        },
        act: (cubit) => cubit.fetchAllRockets(),
        expect: () => [
          const RocketsState(loadState: LoadState.loading),
          const RocketsState(loadState: LoadState.failure),
        ],
      );
    });
  });
}
