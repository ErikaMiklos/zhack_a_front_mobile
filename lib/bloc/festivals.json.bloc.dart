import 'package:bloc/bloc.dart';
import '../model/festivals.json.model.dart';
import '../model/festivals.model.dart';
import '../repository/festivals.json.repository.dart';
import '../repository/festivals.repository.dart';


//Events
abstract class FestivalsEvent{}
class SearchFestivalsEvent extends FestivalsEvent{
  final String keyword;
  //constructor
  SearchFestivalsEvent({required this.keyword});
}

//States
abstract class FestivalsState{}
class SearchFestivalsSuccessState extends FestivalsState{
  final ListFestivals listFestivals;
  //constructor
  SearchFestivalsSuccessState({
    required this.listFestivals
  });
}

class SearchFestivalsLoadingState extends FestivalsState{}

class SearchFestivalsErrorState extends FestivalsState{
  final String errorMessage;
  //constructor
  SearchFestivalsErrorState({
    required this.errorMessage
  });
}

class FestivalsInitialState extends FestivalsState{}

//BloC
class FestivalsBloc extends Bloc<FestivalsEvent,FestivalsState>{
  FestivalsRepository festivalsRepository = FestivalsRepository();
  //constructor
  FestivalsBloc() : super(FestivalsInitialState()){
    on((SearchFestivalsEvent event, emit) async{
      emit(SearchFestivalsLoadingState());
      try {
        ListFestivals listFestivals = await festivalsRepository.searchFestivals(event.keyword, 0, 20);
        emit(SearchFestivalsSuccessState(listFestivals: listFestivals));
      } catch (e) {
        emit(SearchFestivalsErrorState(errorMessage: e.toString()));
      }
    });
  }

}
