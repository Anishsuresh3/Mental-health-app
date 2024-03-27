import 'package:mental/Service/ApiService.dart';
import 'package:mental/Service/ChatBotResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataError extends DataState{}

class DataLoaded extends DataState {
  final ChatBotResponse data;

  DataLoaded(this.data);
}

// Event
abstract class DataEvent {}

class FetchDataEvent extends DataEvent {
  final String inputString;
  FetchDataEvent(this.inputString);
}

// Bloc
class DataBloc extends Bloc<DataEvent, DataState> {
  final ApiService apiService;

  DataBloc(this.apiService) : super(DataInitial()) {
    // Register the event handler for FetchDataEvent
    on<FetchDataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        final response = await apiService.processString({
          'chat':event.inputString,
        });

        debugPrint("BLOC " + response.toString());
        emit(DataLoaded(response));
      } catch (e) {
        debugPrint("Error: "+e.toString());
        emit(DataError()); // Handle error case
      }
    });
  }
}