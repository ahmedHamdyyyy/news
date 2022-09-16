
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/NEWA_APP/webVeww.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/progect/shop_app/Screens/Lodin_ShopAppScreen.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';


Widget Textformfild({
  required TextEditingController? control,
  required TextInputType? type,
  Function? onfild,
  Function? OnChanged,
  bool ispassword = false,
  required Function validat,
  required String labl,
  required IconData? prefix,
  IconData? SUFAKS,
  Function? ontap,
  bool Enable = true,
}) =>
    TextFormField(
      controller: control,
      obscureText: ispassword,
      keyboardType: type,
      onFieldSubmitted: onfild!(),
      onChanged: OnChanged!(),
      validator: validat(),
      onTap: ontap!(),
      decoration: InputDecoration(
        labelText: labl,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: SUFAKS != null
            ? Icon(
                SUFAKS,
              )
            : null,
      ),
    );
Widget countener() => Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
Widget biledItime(artic, context) => InkWell(
      onTap: () {
        navigatorTo(context, WebVieww(artic["url"]));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${artic["urlToImage"]}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${artic["title"]}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ${artic["publishedAt"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget ItmeScreen(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (BuildContext context) => ListView.separated(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return biledItime(list[index], context);
        },
        separatorBuilder: (BuildContext context, int index) => countener(),
      ),
      fallback: (BuildContext context) =>
          Center(child: CircularProgressIndicator()),
    );
void navigatorTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
void navigatorToReplasment(context, Widget) =>Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);
void ShowToast({ required String text,required ToustStute stute })=> Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: ChoseToustColor(stute),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToustStute{SUCCESS,ERROR,WORNNING}
Color ChoseToustColor(ToustStute stute)
{
  Color color;
  switch(stute)
  {
    case ToustStute.SUCCESS:
     color= Colors.green;
    break ;
    case ToustStute.ERROR:
      color= Colors.red;
      break ;
    case ToustStute.WORNNING:
      color= Colors.amber;
      break ;

  }
  return color;

}
Widget sinOut(context)=> TextButton(
  onPressed: ()
  {
    CachHealper.removeData(key: "token").then((value)
    {
      if(value)
      {
        navigatorToReplasment(context, Lodin_ShopAPP());
      }
    });
  },
  child: Text("hhhhhhhhhhhh"),
);
Widget BulidFavouretItem( model,context)=>  Padding(
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


