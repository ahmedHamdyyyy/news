import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/Screens/Lodin_ShopAppScreen.dart';


import 'package:neww/progect/shop_app/model/Model_BORDING.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBrrdingScreen extends StatefulWidget {
   OnBrrdingScreen({Key? key}) : super(key: key);
  @override
  State<OnBrrdingScreen> createState() => _OnBrrdingScreenState();
}
class _OnBrrdingScreenState extends State<OnBrrdingScreen> {
   PageController cotroerPage=PageController();

   bool isSHWO=false;

  List <Model_BORDING> modelBored=
  [
    Model_BORDING(image: "assets/images/image1.gif",
        text: "Choose What ever the Product you wish for with the easiest way possible using Salla",
        title: "Explore",
    ),
    Model_BORDING(image: "assets/images/image2.gif",
      text: "Yor Order will be shipped to you as fast as possible by our carrier",
      title: "Shipping",
    ),
    Model_BORDING(image: "assets/images/image3.gif",
      text: "Pay with the safest way possible either by cash or credit cards",
      title: "Make the Payment",
    ),
  ];
  void sumit()
  {
    CachHealper.SaveData(key: "onBoarding", value: true).then((value)
    {
      if(value)
      {
        navigatorToReplasment(context, Lodin_ShopAPP());
      }
    }) ;  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: sumit, child: Text("SKIP",)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index)
                {
                  if(index==modelBored.length-1)
                  {
                   setState(() {
                     isSHWO=true;
                   });
                  }
                  else{
                    setState(() {
                      isSHWO=false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller:cotroerPage ,
                itemBuilder: (context, index) => buildBordingItim(modelBored[index]),
                itemCount: modelBored.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller:cotroerPage ,
                  count: modelBored.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.deepOrange,
                    dotColor: Colors.grey,
                    spacing: 5,
                    dotHeight: 10,
                    expansionFactor: 5,
                    dotWidth: 11,


                  ),
                ),

                Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isSHWO)
                  {
                   sumit();

                  }else
                  {
                    cotroerPage.nextPage(duration:Duration(milliseconds: 500),
                        curve:Curves.fastLinearToSlowEaseIn );
                    setState(() {
                      isSHWO==false;
                    });

                  }

                },
                child: Icon(Icons.arrow_forward),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBordingItim( Model_BORDING model )=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image:AssetImage("${model.image}") )),
      SizedBox(
        height: 10,
      ),
      Text(
        "${model.text}",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "${model.title}",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 10,
      ),

    ],
  );
}
