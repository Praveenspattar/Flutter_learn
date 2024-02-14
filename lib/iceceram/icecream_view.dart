
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/iceceram/model/icecream.dart';

class IcecreamView extends StatelessWidget {

  Future<List<Icecream>?> loadIcecreams() async{
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(const Duration(seconds: 1));
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
  }
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("IceCreams",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          Text("We have something yammy for you",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(future: loadIcecreams(),
                   builder: (context,snapshot){
                    if (snapshot.connectionState == ConnectionState.done) {
                      final icecreams = snapshot.data;
                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height / 3,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                          final icecream = icecreams[index];
                          return Card(
                            child: Text(icecream.flavor),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: icecreams!.length,),
                      );
                    }
                    else {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    }
                  }),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}