// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:neww/mm/NEWA_APP/serch.dart';
// import 'package:neww/mm/bloc/cubitt.dart';
// import 'package:neww/mm/bloc/stutess.dart';
// import 'package:neww/mm/blocc/cubitt.dart';
// import 'package:neww/mm/shared/coponents/componants.dart';
//
// class HomeLayOutl extends StatelessWidget {
//   const HomeLayOutl({Key? key}) : super(key: key);
//   //var cubit = NewsCubit.get(context);
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit, NewsState>(
//       listener: (BuildContext context, state) {},
//       builder: (BuildContext context, Object? state) {
//         var cubit = NewsCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             actions: [
//               IconButton(
//                   onPressed: () {
//                     navigatorTo(
//                       context,
//                       searchScreen(),
//                     );
//                   },
//                   icon: Icon(
//                     Icons.search,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     bloc.get(context).changAppMode();
//                   },
//                   icon: Icon(
//                     Icons.brightness_4_outlined,
//                   )),
//             ],
//           ),
//           drawer: Drawer(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SafeArea(
//                     child: Container(
//                       height: 40,
//                     ),
//                   ),
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(
//                       "https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-6/244606627_619553189417229_8566131780425096990_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGWvJRNvvx576pKZtsLsiRhRidKFi6JiAJGJ0oWLomIAoEyPBIhbxd5DsFLYHuTgvD8ENz0MHSwDhj2sx_XhpZJ&_nc_ohc=-rQokoy8aFAAX8ZCoqC&_nc_ht=scontent.fcai20-5.fna&oh=00_AT9yUVuMCpuTuHP-mAm6A5ur-DSy42B3HMEQ_KRDYSWqlQ&oe=62E60759",
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Ahmed Hamdi",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           bloc.get(context).changAppMode();
//                         },
//                         icon: Icon(
//                           Icons.brightness_4,
//                           color: bloc.get(context).isDark
//                               ? Colors.white
//                               : Colors.deepOrange,
//                         ),
//                       ),
//                       Text(
//                         "ممكن تغير المود",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           body: cubit.Screen[cubit.currentIndx],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: cubit.currentIndx,
//             items: cubit.BottomItem,
//             onTap: (index) {
//               cubit.changeBottomNavBar(index);
//             },
//           ),
//         );
//       },
//     );
//   }
// }
