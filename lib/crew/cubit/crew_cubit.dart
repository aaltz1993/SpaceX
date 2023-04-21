import 'package:bloc/bloc.dart';
import 'package:crew_repository/crew_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_api/spacex_api.dart';

part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  CrewCubit({required CrewRepository crewRepository})
      : _crewRepository = crewRepository,
        super(const CrewState());

  final CrewRepository _crewRepository;

  Future<void> fetchCrewMembers() async {
    emit(
      CrewState(
        loadState: LoadState.loading,
        crewMembers: state.crewMembers,
      ),
    );

    try {
      final crewMembers = await _crewRepository.fetchAllCrewMembers();

      emit(
        CrewState(
          loadState: LoadState.success,
          crewMembers: crewMembers,
        ),
      );
    } on Exception {
      emit(
        CrewState(
          loadState: LoadState.failure,
          crewMembers: state.crewMembers,
        ),
      );
    }
  }
}
