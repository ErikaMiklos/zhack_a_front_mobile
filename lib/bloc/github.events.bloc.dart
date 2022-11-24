import 'package:bloc/bloc.dart';
import 'package:zhack_a_front_mobile/repository/github.events.repository.dart';
import '../model/github.events.model.dart';

//Events
abstract class GitHubEventsEvent{}
class GetGitHubEventsEvent extends GitHubEventsEvent{}
class SearchGitHubEventsEvent extends GitHubEventsEvent{
  final String keyword;
  //constructor
  SearchGitHubEventsEvent({required this.keyword});
}

//States
abstract class GitHubEventsState{}
//success state
class GitHubEventsSuccessState extends GitHubEventsState{
  //model
  final GitHubEvents gitHubEvents;
  //constructor
  GitHubEventsSuccessState({
    required this.gitHubEvents
  });
}
//loading state
class GitHubEventsLoadingState extends GitHubEventsState{}
//error state
class GitHubEventsErrorState extends GitHubEventsState{
  final String errorMessage;
  //constructor
  GitHubEventsErrorState({
    required this.errorMessage
  });
}
//initial state
class GitHubEventsInitialState extends GitHubEventsState{}

//BloC
class GitHubEventsBloc extends Bloc<GitHubEventsEvent,GitHubEventsState>{
  GitHubEventsRepository gitHubEventsRepository = GitHubEventsRepository();
  //constructor
  GitHubEventsBloc() : super(GitHubEventsInitialState()){
    on((GetGitHubEventsEvent event, emit) async{
      emit(GitHubEventsLoadingState());
      try {
        GitHubEvents gitHubEvents = await gitHubEventsRepository.getEvents();
        emit(GitHubEventsSuccessState(gitHubEvents: gitHubEvents));
      } catch (e) {
        emit(GitHubEventsErrorState(errorMessage: e.toString()));
      }
    });
    on((SearchGitHubEventsEvent event, emit) async{
      emit(GitHubEventsLoadingState());
      try {
        GitHubEvents gitHubEvents = await gitHubEventsRepository.searchEvents(event.keyword, 0, 20);
        emit(GitHubEventsSuccessState(gitHubEvents: gitHubEvents));
      } catch (e) {
        emit(GitHubEventsErrorState(errorMessage: e.toString()));
      }
    });
  }

}
