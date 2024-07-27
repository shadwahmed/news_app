import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
   DrawerTab({required this.onClick,super.key});

   static int CATEGORY_ID=1;
   static int SETTINGS_ID=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          Container(
            height: 140,
            color: Colors.green,
            child: Center(
              child: Text(
                "News App",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: (){
              onClick(CATEGORY_ID);
            },
            child: Row(
              children: [
                Icon(Icons.category_outlined),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: (){
              onClick(SETTINGS_ID);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Setting",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
