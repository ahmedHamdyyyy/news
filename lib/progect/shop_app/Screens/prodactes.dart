
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/shared/coponents/componants.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/stutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:neww/progect/shop_app/model/Categories_Model.dart';
import 'package:neww/progect/shop_app/model/Home_model.dart';

class ProdactesScreen extends StatelessWidget {
  const ProdactesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, Shop_Stutes>(
      listener: (context, state) {

        if (state is ChangeSaccessFavModelStates)
        {
          if (state.changeFavouriteModel.status!)
          {
            ShowToast(text:state.changeFavouriteModel.message! , stute: ToustStute.SUCCESS);
          }

        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).home_model != null &&
              ShopCubit.get(context).categoryModel != null,
          builder: (context) => ProdactBuiled(ShopCubit.get(context).home_model,
              ShopCubit.get(context).categoryModel!,context),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget ProdactBuiled(ShopHomeModel? model, CategoryModel categoryModel,context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model!.data!.banners
                  .map((e) => Image.network(
                        '${e.image}',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                initialPage: 0,
                reverse: false,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الفئات",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          BulidCatiogryItme(categoryModel.data!.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: categoryModel.data!.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "منتجات جديده",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 1,
                childAspectRatio: 1 / 1.8,
                crossAxisSpacing: 1,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  model.data!.products.length,
                  (index) => BulidGraidPorodact(model.data!.products[index],context),
                ),
              ),
            ),
          ],
        ),
      );

  Widget BulidGraidPorodact(ProductsData model,context) =>
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(model.image!),
                        height: 200,
                        width: double.infinity,
                      ),
                      if (model.discount != 0)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.red,
                          child: Text(
                            "تخفيض",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    model.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${model.price.round()!}",
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 12,
                          color: COLORS,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.discount != 0)
                        Text(
                          "${model.old_price.round()!}",
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
                            print(model.id);
                          },
                          icon: CircleAvatar(
                            backgroundColor: ShopCubit.get(context).favourets[model.id] ==true ? COLORS:Colors.grey,
                            radius: 15,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget BulidCatiogryItme(DataModel model) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              model.image!,
            ),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
            width: 100,
            child: Text(
              model.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
}
