import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex/common/load_state.dart';
import 'package:spacex_api/spacex_api.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  RocketsCubit({
    required RocketRepository rocketRepository,
  })  : _rocketRepository = rocketRepository,
        super(const RocketsState());

  final RocketRepository _rocketRepository;

  Future<void> fetchAllRockets() async {
    emit(
      RocketsState(
        loadState: LoadState.loading,
        rockets: state.rockets,
      ),
    );

    try {
      final rockets = await _rocketRepository.fetchAllRockets();

      emit(
        RocketsState(
          loadState: LoadState.success,
          rockets: rockets,
        ),
      );
    } on Exception {
      emit(
        RocketsState(
          loadState: LoadState.failure,
          rockets: state.rockets,
        ),
      );
    }
  }
}
