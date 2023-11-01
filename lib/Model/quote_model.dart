class Quote{

  late final String quote;
  late final String author;
  late final String image;

  Quote({
    required this.quote,
    required this.author,
    required this.image,

  });

  factory Quote.fromJson(Map<String,dynamic> data){
    return Quote(
      quote: data['text'],
      author: data['byName'],
      image: data['byImage'],
    );
  }

 

}