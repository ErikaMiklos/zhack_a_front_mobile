import 'package:bloc/bloc.dart';
import 'package:zhack_a_front_mobile/repository/github.events.repository.dart';
import '../model/github.events.model.dart';

//Events
abstract class GitHubEventsEvent{}
class GetGitHubEventsEvent extends GitHubEventsEvent{}

//States
abstract class GitHubEventsState{}
//success state
class GetGitHubEventsSuccessState extends GitHubEventsState{
  final GitHubEvents gitHubEvents;
  //constructor
  GetGitHubEventsSuccessState({
    required this.gitHubEvents
  });
}
//loading state
class GetGitHubEventsLoadingState extends GitHubEventsState{}
//error state
class GetGitHubEventsErrorState extends GitHubEventsState{
  final String errorMessage;
  //constructor
  GetGitHubEventsErrorState({
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
      emit(GetGitHubEventsLoadingState());
      try {
        GitHubEvents gitHubEvents = await gitHubEventsRepository.getEvents();
        emit(GetGitHubEventsSuccessState(gitHubEvents: gitHubEvents));
      } catch (e) {
        emit(GetGitHubEventsErrorState(errorMessage: e.toString()));
      }
    });
  }

}
