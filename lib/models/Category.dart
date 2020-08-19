 class Category {
    String id_cat;
    String name;
    String file_name;
    String name_fr;
    

    // ignore: non_constant_identifier_names
    Category({this.id_cat, this.name, this.file_name, this.name_fr});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
     id_cat: json['_id_cat'] as String,
     name: json['name'] as String,
     file_name: json['file_name'] as String,
     name_fr: json['name_fr'] as String,
    );
  }
  }