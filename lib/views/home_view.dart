
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memmer/services/apis.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Memer App"),
      ),
      body: FutureBuilder(
        future: API.getMemes(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 2),
                ],
              ),
              
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {

                final meme = snapshot.data!.data!.memes![index];
                return InkWell(
                  onTap: () => launchUrl(Uri.parse(meme.url!)),
                  child: Stack(
                    children: [
                      Card(
                        child: CachedNetworkImage(
                          imageUrl: meme.url!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) {
                            return const SizedBox.shrink(
                              child: CircularProgressIndicator()
                            );
                          },
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error)
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.black.withOpacity(0.2),
                          child: Text(
                            meme.name!,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ));
          } else {
            return const SizedBox.square(dimension: 20,
              child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}