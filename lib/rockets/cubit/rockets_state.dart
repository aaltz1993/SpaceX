part of 'rockets_cubit.dart';

class RocketsState extends Equatable {
  final LoadState loadState;
  final List<Rocket>? rockets;

  const RocketsState({
    this.loadState = LoadState.initial,
    this.rockets,
  });

  @override
  List<Object?> get props => [loadState, rockets];
}
