import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../theme/text_theme.dart';

class SelectNumberOperatorBottomSheet extends StatelessWidget {
  final ValueChanged<bool> showBottomSheet;
  const SelectNumberOperatorBottomSheet({Key? key,required this.showBottomSheet}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return BottomSheet(
        onClosing: () {
          showBottomSheet(false);
         // setState(() {});
        },
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(top:100),
            padding: EdgeInsets.all(20),
            decoration:const BoxDecoration(
                color: AppColors.background_bottomsheet,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            width: double.infinity,

            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [
                    IconButton(onPressed: (){
                      showBottomSheet(false);
                    }, icon: SvgPicture.asset("assets/close_icon.svg",width: 30,)),
                    Spacer(),
                    Text("انتخاب شماره",style: textTheme.bodyText2,),
                    Spacer(),
                    Container(width: 30,)
                  ],),
                  Column(children: [
                    Card(

                      margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                    child: Container(
                        height: 70,
                        child: Row(children: [
                          Expanded(
                              flex:1,
                              child:  SvgPicture.asset("assets/next_arrow.svg")),
                          Expanded(
                              flex:5,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("انتخاب مخاطبین"),
                                  Text("ادامه با لیست مخاطب ها")
                                ],
                              )),

                          Expanded(
                              flex:1,
                              child:  SvgPicture.asset("assets/add_contact.svg")),
                        ],)),),
                    SizedBox(height: 8,),
                    Align(alignment: Alignment.centerRight,child:   Text("لیست مخاطبین",),),
                    SizedBox(height: 8,),

                  ],),
                  Expanded(

                    child: Card(   margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,

                      elevation: 10,
                     child:   ListView.separated(
                       itemCount: 3,
                       itemBuilder: (context, index) {
                         return _buildItems();
                       },
                       //   separatorBuilder: (context, index) => const SizedBox(height: 20),
                       separatorBuilder: (context, index) {
                         return Divider(
                           indent: 15,
                           endIndent: 15,
                           color: AppColors.gray,
                         );
                       },

                     ),

                      ),
                  ),

                ],
              ),
            ),
          );
        },
      );


  }
   _buildItems(){
    return   Container(

        padding: EdgeInsets.all(8),
     child:Row(children: [
      Expanded(
          flex:1,
          child:  SvgPicture.asset("assets/next_arrow.svg")),
      Expanded(
          flex:5,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("انتخاب مخاطبین"),
              Text("ادامه با لیست مخاطب ها")
            ],
          )),

      Expanded(
          flex:1,
          child:  SvgPicture.asset("assets/add_contact.svg")),
    ],));
   }
}
