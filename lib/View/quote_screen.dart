import 'package:bana/Model/quote_model.dart';
import 'package:bana/Services/quote_service.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 4, 181, 201), Color.fromARGB(255, 11, 239, 117)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
          child: FutureBuilder(
            
              future: QuoteService.getQuote(),
              builder: (BuildContext context, AsyncSnapshot<Quote?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        
          Quote? quote = snapshot.data;
        
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(quote!.quote, style: const TextStyle(fontSize: 36, color: Colors.black54),),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(quote.author, style: const TextStyle(fontSize: 20),),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.network(
                      quote.image,
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ],
            ),
          );
              },
            ),
        ));
  }
}
