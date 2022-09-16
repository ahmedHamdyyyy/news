import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/Screens/regestration.dart';
import 'package:neww/progect/shop_app/Screens/shop_Home_screen.dart';
import 'package:neww/progect/shop_app/blokLoginshop/cubit.dart';
import 'package:neww/progect/shop_app/blokLoginshop/stuts.dart';

class Lodin_ShopAPP extends StatelessWidget {
  Lodin_ShopAPP({Key? key}) : super(key: key);

  var formSTAT = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerrEmail = TextEditingController();
    TextEditingController controllerrpassword = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, shopLginStutes>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStates) {
            if (state.loginModel.status == true) {
              CachHealper.SaveData(
                      key: "token",
                  value: state.loginModel.data?.token)
                  .then((value) {
                token = state.loginModel.data!.token!;
                navigatorToReplasment(context, shop_Home_screen());
                ShowToast(
                  text: state.loginModel.message!,
                  stute: ToustStute.SUCCESS,
                );
              });
            } else {
              print(state.loginModel.message);
              ShowToast(
                  text: state.loginModel.message!,
                  stute: ToustStute.ERROR,);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formSTAT,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: ()
                        {
                          ShopLoginCubit.get(context).changeLike();
                        }, icon:Icon(
                          Icons.linked_camera,
                          color: ShopLoginCubit.get(context).colorss,
                        ) ),
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 10,
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
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onFieldSubmitted: (S) {
                            if (formSTAT.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                  email: controllerrEmail.text,
                                  password: controllerrpassword.text);
                            }
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "please Enter your password";
                            }
                          },
                          controller: controllerrpassword,
                          keyboardType: TextInputType.visiblePassword,
/*                          obscureText:
                              ShopLoginCubit.get(context).isPasswordShow*/
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            labelText: " Enter your password",
                            suffixIcon: IconButton(
                              onPressed: ()
                              {
                                ShopLoginCubit.get(context).changPassoworsVisability();
                              },
                              icon: Icon(ShopLoginCubit.get(context).IconSufix),
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
                          condition: state is! ShopLoginlodingStates,
                          builder: (BuildContext context) {
                            return Container(
                              height: 50,
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () {
                                  if (formSTAT.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: controllerrEmail.text,
                                        password: controllerrpassword.text);
                                  }
                                },
                                child: Text(
                                  "LOGIN",
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
                                "Don\'t have an account?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  navigatorToReplasment(context, RegistrationScreenShop());

                                },
                                child: Text(
                                  "Registration",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue[800],
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
            ),
          );
        },
      ),
    );
  }
}
