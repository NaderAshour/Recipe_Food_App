import 'dart:convert';

import 'package:http/http.dart'as http;
class Choise{
   int? id;
   List<int> idlist=[];
  String? title;
  String? url;
 List ?apidata=[];

  Choise({this.title,this.url,this.id,this.apidata});
  Choise.fromJson(Map<String,dynamic>apimap){
    print('======================1');

    apimap['results'].forEach((element){
      idlist.add(element['id']);
    });
    print('$idlist');
    //print('======================2');
     title=apimap['results'][1]['title'];
    //print('======================3');
     apidata!.add(apimap['results']);
    //print('======================4');
  //apimap['results'].forEach((element) {
  //  apidata!.add(element);
  //});
   // print('title$title');
    //print('                                            2');
    //print(apidata);
  // for(int i in apimap['results']){
  //   title=apimap['results'][i]['title'];
  //   title=apimap['results'][i]['image'];
  //   title=apimap['results'][i]['id'];
  // }





}
}





class ApiClient{
  Future<Choise>? getapidata ()async{
    var endpoint= await Uri.parse(
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=0411c8034887423baf46b9dc62a147a7");
    var response= await http.get(endpoint);
    Map<String,dynamic> body=await jsonDecode(response.body);

   //print('${Choise.fromJson(body).title}');
   //print(Choise.fromJson(body));

    return Choise.fromJson(body);

  }
}