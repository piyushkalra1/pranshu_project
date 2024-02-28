
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pranshu_project/imageprovider.dart';
import 'package:provider/provider.dart';

import 'DiscriptionScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    final provider = Provider.of<DataProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getMembers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context,listen: false);

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("HomePage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
      ),
      body:  Consumer<DataProvider>(
        builder: (BuildContext context, value, Widget? child) {
          print(value.welcomelist.length);
          return ListView.builder(
              itemCount: value.welcomelist.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          welcome: value.welcomelist[index],
                        )));
                      },
                          child: Container(
                            margin: EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Column(
                              children: [
                                Image.network(value.welcomelist[index].urls!.regular.toString(),),
                                Padding(padding: EdgeInsets.all(8),child: (value.welcomelist[index].description !=null && value.welcomelist[index].description.toString() !="") ?  Text( value.welcomelist[index].description.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),):Text("No Description available",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)

                              ],
                            )),
                          )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
