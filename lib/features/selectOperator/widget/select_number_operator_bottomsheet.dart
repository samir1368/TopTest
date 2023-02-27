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
                    IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/close_icon.svg",width: 30,)),
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

                          Text("data")],)),),
                    SizedBox(height: 8,),
                    Card(   margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        children: [Container(
                            padding: EdgeInsets.all(8),
                            child: Row(children: [Text("data")],)),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10 ),
                            child: const Divider(
                              thickness: 1, color: AppColors.gray,),
                          ),
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Row(children: [Text("data")],)),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10 ),
                            child: const Divider(
                              thickness: 1, color: AppColors.gray,),

                          ),
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Row(children: [Text("data")],)),
                        ],
                      ),),
                  ],),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          showBottomSheet(false);

                        },
                        child: Text(
                          "  MyStrings.free",
                          style: textThemeWhite.subtitle1,
                          textDirection: TextDirection.rtl,
                        )),
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
        child: Row(children: [

          Text("data")],));
   }
}
