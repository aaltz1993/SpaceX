part of 'crew_cubit.dart';

enum LoadState {
  none,
  loading,
  success,
  failure,
}

class CrewState extends Equatable {
  const CrewState({
    this.loadState = LoadState.none,
    this.crewMembers,
  });

  final LoadState loadState;
  final List<CrewMember>? crewMembers;

  @override
  List<Object?> get props => [loadState, crewMembers];
}
