import 'package:bloc/bloc.dart';
import 'package:spacex/rocket_details/cubit/rocket_details_state.dart';
import 'package:spacex_api/spacex_api.dart';

class RocketDetailsCubit extends Cubit<RocketDetailsState> {
  RocketDetailsCubit({required Rocket rocket})
      : super(RocketDetailsState(rocket: rocket));
}
