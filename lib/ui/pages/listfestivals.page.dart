import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/festivals.bloc.dart';
import '../themes/themes.dart';


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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.listFestivals.items[index].login,
                                  style: Theme.of(context).textTheme.headline6,),
                                ],
                              ),
                            ),
                        separatorBuilder: (context,index){
                          return const Divider(
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
