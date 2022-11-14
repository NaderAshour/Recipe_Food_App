import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_food/screens/uimodal.dart';

import 'home_screen.dart';
class Favourites extends StatelessWidget {
   Favourites({Key? key}) : super(key: key);
  List<Choise> ?choises=[
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/765/174/png-transparent-hamburger-veggie-burger-chicken-sandwich-kfc-french-fries-burger-king-food-recipe-fast-food-restaurant-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/520/119/png-transparent-french-fries-cheeseburger-breakfast-sandwich-whopper-hamburger-junk-food-food-recipe-cheese-sandwich-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/425/178/png-transparent-sandwiches-and-fried-chickens-fast-food-restaurant-junk-food-kfc-hamburger-junk-food-food-recipe-american-food-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/865/632/png-transparent-burger-and-potato-fries-dish-hamburger-french-fries-cheeseburger-chicken-sandwich-veggie-burger-french-fries-food-recipe-fast-food-restaurant-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/765/174/png-transparent-hamburger-veggie-burger-chicken-sandwich-kfc-french-fries-burger-king-food-recipe-fast-food-restaurant-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/520/119/png-transparent-french-fries-cheeseburger-breakfast-sandwich-whopper-hamburger-junk-food-food-recipe-cheese-sandwich-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/425/178/png-transparent-sandwiches-and-fried-chickens-fast-food-restaurant-junk-food-kfc-hamburger-junk-food-food-recipe-american-food-thumbnail.png'),
    Choise(title: 'this is an medium rare meat',url: 'https://w7.pngwing.com/pngs/765/174/png-transparent-hamburger-veggie-burger-chicken-sandwich-kfc-french-fries-burger-king-food-recipe-fast-food-restaurant-thumbnail.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:
    Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Recipes Favourites'),
        ),
        actions: [Icon(Icons.search),SizedBox(width: 20,)],
        leading: Icon(Icons.line_weight),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        children: List.generate(choises!.length, (index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.greenAccent,
              ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image:  NetworkImage(choises![listindex!].url.toString()),
                          fit: BoxFit.cover
                      )
                  ),

                ),
                SizedBox(height: 25,),
                Text('${choises![listindex!].title},',style: TextStyle(
                  overflow: TextOverflow.clip,
                  letterSpacing: 1.5,

                ),
                )


              ],
            ),
          );
        }
        ) ,


      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:( context)=>HomeScreen())
                  );

                },
                child: FaIcon(FontAwesomeIcons.house)),
            GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favourites())
                  );

                },
                child: FaIcon(FontAwesomeIcons.heart)),

          ],
        ),
      ),
    ),);;
  }
}
