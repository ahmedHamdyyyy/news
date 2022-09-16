/*

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/mm/bloc/cubitt.dart';
import 'package:neww/mm/bloc/stutess.dart';

import 'package:neww/mm/shared/coponents/componants.dart';


class searchScreen extends StatelessWidget {
  var controlll = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsState>(

      listener:(context,state){} ,
      builder:(context,state)
      {
        var list= NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                  TextFormField(
                    onChanged:(value)
                    {
                      NewsCubit.get(context).getsearch( value);
                    } ,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      hintText: "ابحث ياغالي!"
                    ),


                  ),
                */
/*Textformfild(
                  control: controlll,
                  type:TextInputType.text ,
                *//*
*/
/*  onfild:  (value)
                  {
                    NewsCubit.get(context).getsearch( value);
                  },*//*
*/
/*
                  OnChanged: (value){
                    NewsCubit.get(context).getsearch( value);
                  },
                  validat: ( String value)
                  {
                    if(value.isEmpty ){
                      return  "search must not be empty";
                    }
                    return null;
                  },
                  labl:'search',
                  prefix: Icons.search,
                ),*//*

              ),
              Expanded(child: ItmeScreen( list ,context)),
            ],
          ),
        );
      } ,
    );
  }
}
*/
