import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/NewsResponce/News.dart';

class DetailsWidget extends StatelessWidget {
  DetailsWidget(this.news,{Key? key}) : super(key: key);
  News news;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(news.title??'', textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),),
            SizedBox( height:  10,),
            ClipRRect(
              child:  CachedNetworkImage(
                imageUrl: news.urlToImage??'',
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

            Text(news.description??'',
              textAlign: TextAlign.start,

              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),),
            Text(news.publishedAt??'',
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),


          ],
        ),
      ),
    );
  }
}
