import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/blocSerch/cubit.dart';
import 'package:neww/progect/shop_app/blocSerch/stuttes.dart';


class  SearchScreen extends StatelessWidget {
    SearchScreen({Key? key}) : super(key: key);
    var formSTAT = GlobalKey<FormState>();

    TextEditingController controllerrname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => SearchCubit(),
      child:  BlocConsumer<SearchCubit,ShopSearchStutes>(

        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formSTAT,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (String text)
                      {

                        SearchCubit.get(context).getSearchData(text);
                      },
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Enter your Search please";
                        }

                      },


                      controller: controllerrname,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "search",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (  state is ShopLodingSearchStatus)
                      LinearProgressIndicator(),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return BulidFavouretItem(SearchCubit.get(context).searchModel!.data.data[index] ,context);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 3,
                        ),
                        itemCount: SearchCubit.get(context).searchModel!.data.data.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          );
        } ,



      ),
    );

  }


}
