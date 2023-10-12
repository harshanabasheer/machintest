import 'package:flutter/material.dart';
import 'package:machintest/model/items_model.dart';
import 'package:machintest/api/api_services.dart';
import 'package:machintest/oneitem.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  ApiService client=ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: const Text("Item List",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
          backgroundColor: Colors.black,),
        body:
        FutureBuilder<List<Items>>(
            future: client.getItems(),
            builder: (BuildContext context, AsyncSnapshot<List<Items>>snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>OneItem()));
                              },
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Image.asset(snapshot.data![index].image.toString()),
                        Text(snapshot.data![index].title.toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text(snapshot.data![index].price.toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text(snapshot.data![index].description.toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                        Text(snapshot.data![index].category.toString(),style: TextStyle(fontSize: 15,color: Colors.black),),



                      ],
                      ),);

                    }
                );

              }
              return Center(child: CircularProgressIndicator(),);
            }
        )

    );
  }
}