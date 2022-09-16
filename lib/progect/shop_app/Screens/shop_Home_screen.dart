import 'package:flutter/material.dart';
import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/Screens/search.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/stutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class shop_Home_screen extends StatelessWidget {
  const shop_Home_screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit,Shop_Stutes>(
      listener: (context,state){},
      builder: (context, state) {
        var cubitt=ShopCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text(
              ShopCubit.get(context).titles[ShopCubit.get(context).CurrentIndex],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(onPressed: ()
              {
                navigatorTo(context, SearchScreen());
              }, icon: Icon(Icons.search),),
            ],
          ),
          body:cubitt.BottumScreenss[cubitt.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubitt.CurrentIndex,
            onTap:(index)
            {
              cubitt.butttomNavigat(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),
                  label: "Home"
              ),
              BottomNavigationBarItem(icon: Icon(Icons.apps),
                  label: "categories"
              ),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),
                  label: "favorite"
              ),
              BottomNavigationBarItem(icon: Icon(Icons.settings),
                  label: "settings"
              ),
            ],
          ),
        );},

  );


  }
}
