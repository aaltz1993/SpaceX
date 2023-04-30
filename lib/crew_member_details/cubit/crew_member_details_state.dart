part of 'crew_member_details_cubit.dart';

class CrewMemberDetailsState extends Equatable {
  final CrewMember crewMember;

  const CrewMemberDetailsState({required this.crewMember});

  @override
  List<Object?> get props => [crewMember];
}
