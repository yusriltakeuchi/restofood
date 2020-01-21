import 'package:flutter/material.dart';
import 'package:restofood/data/food_data.dart';
import 'package:restofood/model/food.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restofood"),
        backgroundColor: Colors.orange,
        leading: Icon(Icons.fastfood, color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: HomeBody()
      ),
    );
  }
}


class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          //Bagian ini untuk itemnya
          Text(
            "Daftar Makanan & Minuman",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          //Widget daftar makanan
          ListFood()
        ],
      ),
    );
  }
}



class ListFood extends StatefulWidget {
  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {

  //Membuat object list food
  List<Food> foods;

  @override
  void initState() {
    super.initState();
    foods = FoodData.getFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          
          //Menambahkan item list
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    //Bagian ini tambahkan image, title dan description
                    Container(
                      width: 64,
                      height: 64,
                      child: Image.asset(
                        "images/${foods[index].image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                    //Memberi jarak
                    SizedBox(width: 10),

                    //Bagian untuk title dan description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Title
                        Text(
                          foods[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        //Memberi jarak
                        SizedBox(height: 5,),

                        //Description
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            foods[index].description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        //Harga
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Rp ${foods[index].price.toString()}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}