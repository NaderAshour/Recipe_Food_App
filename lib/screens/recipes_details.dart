import 'dart:convert';

import 'package:http/http.dart'as http;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_food/screens/home_screen.dart';
import 'uimodal.dart';
class RecipesDetails extends StatefulWidget {
  int id_details;
  RecipesDetails({Key? key,required this.id_details}) : super(key: key);
  @override
  State<RecipesDetails> createState() => _RecipesDetailsState();
}
class _RecipesDetailsState extends State<RecipesDetails> {
  int ?x;
  @override
  ApiClient_details? client2=ApiClient_details();
  MealDetails? meal;
  Future<MealDetails> getdata()async {
    meal=client2!.D_getapidata(x) as MealDetails?  ;
     return meal!;
  }
  void initState() {
    x=widget.id_details;
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Recipe Details'),
        ),
        actions: [
          Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(child: FaIcon(FontAwesomeIcons.cartShopping)),
        ),
          Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(child: FaIcon(FontAwesomeIcons.heart,)),
        )],
        leading: Icon(Icons.line_weight),
      ),
      body: FutureBuilder(
          future:getdata() ,
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.done){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      child:Image.network(meal!.durl!),
                      color: Colors.red,
                    ),
                    Spacer(),
                    Text('${meal!.dtitle}'),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${meal!.difficulty}'),
                        Text('${meal!.time}'),
                        Text('${meal!.ingredientsnum}'),
                      ],
                    ),
                    Spacer(),
                    Text('${meal!.description}',style: TextStyle(height:1.5),),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${meal!.serving}servings'),
                        Spacer(),
                        FaIcon(FontAwesomeIcons.plus,size: 18,),
                        SizedBox(width: 10,),
                        FaIcon(FontAwesomeIcons.minus,size: 18,),
                      ],
                    ),
                    Spacer(),
                    Text('Ingridents'),
                    SizedBox(height: 15,),
                    //   Text('${m.ingredients![1]}')
                    Text('${meal!.ingredientsname}'),
                  ],
                ),
              );
            }
            if(snapshot.hasError) {
              print(snapshot.error);
            }

            return Center(child: CircularProgressIndicator());
          }),
    );


  }

}

class MealDetails{
  int? d_id;
  String? durl;
  String? dtitle;
  String? difficulty;
  int? time;
  int? ingredientsnum;
  String? description;
  int? serving;
  List ingredients=[];
  List <String>ingredientsname=[];
  MealDetails(this.d_id,this.durl,this.dtitle,this.difficulty,this.time,this.ingredientsnum,this.description,this.serving,this.ingredients);
  MealDetails.fromJson(Map<String,dynamic>mealapi){
    print('before id');
    this.d_id=mealapi['id'];
    print(d_id);

    print('before image');
    this.durl=mealapi['image'];
    print(durl);
    print('before title');
    this.dtitle=mealapi['title'];
    print(dtitle);
    print('before time');
    this.time=mealapi['readyInMinutes'];
    print(time);
    print('before serving');
    this.serving=mealapi['servings'];
    print(serving);
    print('before difficulty');
    if(this.time! >30){
      this.difficulty='hard';
    }
    else if(this.time!  <30 && this.time!  >15){
      this.difficulty='medium';
    }
    else this.difficulty='easy';
    print(difficulty);
    print('before descripition');
    this.description=mealapi['summary'];
    print(description);
    print('before ingridents');
   ingredients= mealapi['analyzedInstructions'][0]['steps'][0]['ingredients'];



   mealapi['analyzedInstructions'][0]['steps'].forEach((e){
     e['ingredients'].forEach((m){
       ingredientsname.add(m['name']);
     });
   });

 // ingredients.forEach((element) {
 //   ingredientsname.add(element['name']);
 // });
    print('before igredients number');
  //  print(ingredients);
  //  print(ingredients[0]['name']);
    print(ingredientsname);
    this.ingredientsnum=ingredients.length;
    print(ingredientsnum);

  }


}
class ApiClient_details{


  Future<MealDetails>? D_getapidata (int? id)async{
    var endpoint= await Uri.parse(
        "https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=0411c8034887423baf46b9dc62a147a7");
    var response= await http.get(endpoint);
    Map<String,dynamic> body=await jsonDecode(response.body);

    print('${MealDetails.fromJson(body).serving}');
    print(MealDetails.fromJson(body));

    return MealDetails.fromJson(body);

  }
}
