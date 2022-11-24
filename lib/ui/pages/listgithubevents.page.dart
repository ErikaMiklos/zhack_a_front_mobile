import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhack_a_front_mobile/model/github.events.model.dart';
import '../../bloc/github.events.bloc.dart';
import '../themes/themes.dart';
import 'details.page.dart';
import 'github.details.page.dart';


class ListGitHubEventsPage extends StatelessWidget {
  const ListGitHubEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("List of GitHub Events"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                              )
                          )
                      ),
                    )
                ),
                IconButton(
                  onPressed: (){
                    String kw = textEditingController.text;
                    context.read<GitHubEventsBloc>().add(SearchGitHubEventsEvent(keyword: kw));
                    textEditingController.clear();
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Afficher la liste: ",
                  style: TextStyle(color: Theme.of(context).primaryColor,
                  fontSize: 28),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: (){
                    context.read<GitHubEventsBloc>().add(GetGitHubEventsEvent());
                  },
                  icon: const Icon(Icons.all_inclusive),
                )
              ],
            ),
          ),
          BlocBuilder<GitHubEventsBloc, GitHubEventsState>(
              builder: (context, state){
                if(state is GitHubEventsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if(state is GitHubEventsErrorState) {
                  return Column(
                    children: [
                      Text(state.errorMessage, style:CustomThemes.errorTextStyle),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Retry")
                      )
                    ],
                  );
                } else if(state is GitHubEventsSuccessState){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.gitHubEvents.id.length,
                      itemBuilder: (context,index) {
                        Actor actor = state.gitHubEvents.actor;

                        return Card(
                          child: ListTile(
                            title: Text(state.gitHubEvents.actor.login,
                                style: TextStyle(color: Theme.of(context).primaryColor,
                                    fontSize: 28)
                            ),
                            subtitle: Text(state.gitHubEvents.actor.avatarUrl,
                                style: Theme.of(context).textTheme.bodyText2),
                            leading: Text(state.gitHubEvents.repo.name,
                                style: Theme.of(context).textTheme.bodyText2),
                            trailing: const Icon(Icons.arrow_forward_rounded),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => GitHubDetailsPage(actor)));
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              }
          )
        ],
      ),
    );
  }
}
