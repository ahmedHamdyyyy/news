import 'package:flutter/material.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/stutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/progect/shop_app/model/favouretsModel.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';



class fivoretesScreen extends StatelessWidget {
  const fivoretesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, Shop_Stutes>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition:state is! getLoudingChangeFavModelStates ,
              builder: (context) => ListView.separated(itemBuilder: (context, index) {return
                BulidFavouretItem( ShopCubit.get(context).getFavoyriteData!.data!.data[index].product!,context);
              },
                separatorBuilder: (context, index) => SizedBox(
                  height: 3,
                ),
                itemCount: ShopCubit.get(context).getFavoyriteData!.data!.data.length,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),);
        },);

  }
  Widget BulidFavouretItem(Product model,context)=>  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 120,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(
                  "${model.image}",
                ),
                height: 120,
                width: 120,

              ),
              if (model.discount!=0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  color: Colors.red,
                  child: Text(
                    "DESCOUNT",
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 12,
                          color: COLORS,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (true)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            height: 1.3,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            ShopCubit.get(context).ChangeFavouretsData(model.id);

                          },
                          icon: CircleAvatar(
                            backgroundColor:  ShopCubit.get(context).favourets[model.id] ==true ? COLORS :Colors.grey,
                            radius: 15,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 22,
                            ),
                          ))
                    ],
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}
