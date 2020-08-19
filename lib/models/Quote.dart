 class Quote {
    String id;
    String author_name;
    String category_name;
    String qte;
    String qte_fr;

    Quote({this.id, this.author_name, this.category_name, this.qte, this.qte_fr});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
     id: json['id'] as String,
     author_name: json['author_name'] as String,
     category_name: json['category_name'] as String,
     qte: json['qte'] as String,
     qte_fr: json['qte_fr'] as String,
    );
  }
  }