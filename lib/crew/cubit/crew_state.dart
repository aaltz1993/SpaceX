part of 'crew_cubit.dart';

class CrewState extends Equatable {
  const CrewState({
    this.loadState = LoadState.initial,
    this.crewMembers,
  });

  final LoadState loadState;
  final List<CrewMember>? crewMembers;

  @override
  List<Object?> get props => [loadState, crewMembers];
}
