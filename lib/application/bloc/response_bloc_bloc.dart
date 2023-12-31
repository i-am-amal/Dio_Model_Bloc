import 'dart:math';
import 'package:dio_model_bloc/domain/model/response_model.dart';
import 'package:dio_model_bloc/infrastructure/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_bloc_event.dart';
part 'response_bloc_state.dart';
part 'response_bloc_bloc.freezed.dart';

class ResponseBlocBloc extends Bloc<ResponseBlocEvent, ResponseBlocState> {
  ResponseBlocBloc() : super(const _Initial(movieTitle: null)) {
    on<FetchDataEvent>(
      (event, emit) async {
        ResponseModel? responseValue = await ApiServices.fetchData();

        int lengthOfResultsList = responseValue!.results.length;
        int randomNumber = Random().nextInt(lengthOfResultsList);
        String movieResponse =
            responseValue.results[randomNumber].originalTitle;

        emit(state.copyWith(movieTitle: movieResponse));
      },
    );
  }
}
