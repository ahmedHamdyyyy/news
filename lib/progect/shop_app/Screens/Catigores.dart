import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/stutes.dart';
import 'package:neww/progect/shop_app/blokLoginshop/cubit.dart';
import 'package:neww/progect/shop_app/blokLoginshop/stuts.dart';
import 'package:neww/progect/shop_app/model/Categories_Model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class catogresScreen extends StatelessWidget {
  const  catogresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit, Shop_Stutes>(
      builder: (context, state){
        return ConditionalBuilder (
          fallback: (BuildContext context)=>Center(child: CircularProgressIndicator()),
          builder: (context){
            return  ListView.separated(itemBuilder: (context, index) => biuledCatogItme( ShopCubit.get(context).categoryModel!.data!.data[index] ),
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                itemCount: ShopCubit.get(context).categoryModel!.data!.data.length);
          },
          condition:ShopCubit.get(context).categoryModel !=null,
        );
      },
      listener: (context, state){} ,
    );

  }
  Widget biuledCatogItme(DataModel model)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image!),
          width: 80,
          height: 80,
          fit: BoxFit.cover,),
        SizedBox(
          width: 20,
        ),
        Text(
          model.name!,
          style: TextStyle(
            fontSize: 20,

          ),

        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),

      ],
    ),
  );
}
