import 'package:flutter/material.dart';
import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/Screens/Lodin_ShopAppScreen.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/stutes.dart';
import 'package:neww/progect/shop_app/blokLoginshop/stuts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SettingesScreen extends StatelessWidget {
  var formSTAT = GlobalKey<FormState>();
  TextEditingController controllerrEmail = TextEditingController();
  TextEditingController controllerrPhone = TextEditingController();
  TextEditingController controllerrname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, Shop_Stutes>(
      listener: (context, state) {
        if (state is getChangeuserModelStates) {}
      },
      builder: (context, state) {
        var model = ShopCubit.get(context).loginModel!;
        controllerrname.text = model.data!.name!;
        controllerrPhone.text = model.data!.phone!;
        controllerrEmail.text = model.data!.email!;
        return ConditionalBuilder(
          condition: ShopCubit.get(context).loginModel != null,
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:Form(
                  key: formSTAT,
                  child: Column(
                    children: [
                      if( state is UpdituserDataLODINGStates)
                      LinearProgressIndicator(),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: controllerrname,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controllerrPhone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Phone",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controllerrEmail,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            ShopCubit.get(context).upditUserData(email: controllerrEmail.text,
                                phone: controllerrPhone.text,
                                name: controllerrname.text);
                          },
                          child: Text(
                            "UPDATE",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child:   TextButton(
                          onPressed: () {
                            CachHealper.removeData(key: "token").then((value) {
                              if (value) {
                                navigatorToReplasment(context, Lodin_ShopAPP());
                              }
                            });
                          },
                          child: Text("Sign Out",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ) ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
