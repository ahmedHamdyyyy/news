import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/Screens/Lodin_ShopAppScreen.dart';
import 'package:neww/progect/shop_app/Screens/shop_Home_screen.dart';
import 'package:neww/progect/shop_app/blokLoginshop/cubit.dart';
import 'package:neww/progect/shop_app/blokLoginshop/stuts.dart';
import 'package:neww/progect/shop_app/blokRegestraion/cubit.dart';
import 'package:neww/progect/shop_app/blokRegestraion/stuts.dart';


class RegistrationScreenShop extends StatelessWidget {
  var formSTAT = GlobalKey<FormState>();
  TextEditingController controllerrEmail = TextEditingController();
  TextEditingController controllerrpassword = TextEditingController();
  TextEditingController controllerrName = TextEditingController();
  TextEditingController controllerrphone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ShopRegestCubit(),
    child:BlocConsumer<ShopRegestCubit,shopRegestStutes>(
      listener: (context, state) {
        if (state is ShopRegestSuccessStates) {
          if (state.RegestModel.status == true) {
            CachHealper.SaveData(
                key: "token",
                value: state.RegestModel.data?.token)
                .then((value) {
              token = state.RegestModel.data!.token!;
              navigatorToReplasment(context, shop_Home_screen());
              ShowToast(
                text: state.RegestModel.message!,
                stute: ToustStute.SUCCESS,
              );
            });
          } else {
            print(state.RegestModel.message);
            ShowToast(
                text: state.RegestModel.message!, stute: ToustStute.ERROR);
          }
        }
      } ,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body:SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formSTAT,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "REGESTRATION",
                            style: TextStyle(
                                fontSize: 35, ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onFieldSubmitted: (S) {
                              if (formSTAT.currentState!.validate()) {
                                ShopRegestCubit.get(context).userLogin(
                                  email: controllerrEmail.text,
                                  password: controllerrpassword.text,
                                  name:controllerrName.text ,
                                  phone: controllerrphone.text,);
                              }
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "please Enter your name";
                              }
                            },
                            controller: controllerrName,
                            keyboardType: TextInputType.name,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: " Enter your name",

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onFieldSubmitted: (S) {
                              if (formSTAT.currentState!.validate()) {
                                ShopRegestCubit.get(context).userLogin(
                                  email: controllerrEmail.text,
                                  password: controllerrpassword.text,
                                  name:controllerrName.text ,
                                  phone: controllerrphone.text,);
                              }
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "please Enter your phone";
                              }
                            },
                            controller: controllerrphone,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              labelText: " Enter your phone",

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: controllerrEmail,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "please Enter your Email";
                              } else
                                return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: " Enter your Email",
                              prefixIcon: Icon(Icons.email_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          TextFormField(
                            onFieldSubmitted: (S) {
                              if (formSTAT.currentState!.validate()) {
                                ShopRegestCubit.get(context).userLogin(
                                    email: controllerrEmail.text,
                                    password: controllerrpassword.text,
                                name:controllerrName.text ,
                                phone: controllerrphone.text,);
                              }
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "please Enter your password";
                              }
                            },
                            controller: controllerrpassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                            ShopRegestCubit.get(context).isPasswordShow,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.key),
                              labelText: " Enter your password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  ShopRegestCubit.get(context).changPassoworsVisabilityREGEST();
                                },
                                icon: Icon(ShopRegestCubit.get(context).IconSufix),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),


                          ConditionalBuilder(
                            condition: state is! ShopRegestlodingStates,
                            builder: (BuildContext context) {
                              return Container(
                                height: 50,
                                width: double.infinity,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formSTAT.currentState!.validate()) {
                                      ShopRegestCubit.get(context).userLogin(
                                          email: controllerrEmail.text,
                                          password: controllerrpassword.text,
                                      name: controllerrName.text,
                                      phone: controllerrphone.text);
                                    }

                                  },
                                  child: Text(
                                    "REGEST",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.indigo,
                                ),
                              );
                            },
                            fallback: (BuildContext context) {
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  "I have an account",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    navigatorToReplasment(context, Lodin_ShopAPP());

                                  },
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    ) ,);

   


  }
}
