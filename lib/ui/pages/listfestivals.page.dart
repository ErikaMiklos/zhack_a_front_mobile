import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/festivals.bloc.dart';
import '../themes/themes.dart';
import 'details.page.dart';


class ListFestivalsPage extends StatelessWidget {
  const ListFestivalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Listes des Festivals"),),
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
                    context.read<FestivalsBloc>().add(SearchFestivalsEvent(keyword: kw));
                    textEditingController.clear();
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
          BlocBuilder<FestivalsBloc, FestivalsState>(
              builder: (context, state){
                if(state is SearchFestivalsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if(state is SearchFestivalsErrorState) {
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
                } else if(state is SearchFestivalsSuccessState){
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            ListTile(
                              title: Row(
                                children: [
                                  Icon(CupertinoIcons.heart, color: Theme.of(context).primaryColor,),
                                  const SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(state.listFestivals.items[index].login,
                                          style: TextStyle(color: Theme.of(context).primaryColor,
                                          fontSize: 33)),
                                        Text(state.listFestivals.items[index].url,
                                            style: Theme.of(context).textTheme.bodyText2),
                                        Text("Score: ${state.listFestivals.items[index].score}",
                                            style: Theme.of(context).textTheme.bodyText2),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_right, color: Theme.of(context).primaryColor,),
                                ],
                              ),
                              onTap: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DetailsPage()));
                              },
                            ),
                        separatorBuilder: (context,index){
                          return Divider(
                            color: Theme.of(context).primaryColor,
                            thickness: 1,
                            height: 2,
                          );
                        },
                        itemCount: state.listFestivals.items.length
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
