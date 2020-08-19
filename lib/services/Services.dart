import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lwd/models/Word.dart';
import 'package:lwd/models/Quote.dart';
import 'package:lwd/models/Category.dart';
import 'package:lwd/models/Message.dart';
import 'package:flutter/services.dart';


//#####__________________________WORDS SERVICE_____________________________#####//
class WordServices {
  static const String url = 'http://api.loveworlddictionary.org/words/all.php';



  static Future<List<Word>> getWords() async {
    try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Word> list = parseWords(response.body);
        return list;
      }
      else {
        throw Exception('Error...');   
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Word> parseWords(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Word>((json) => Word.fromJson(json)).toList();
  }
}


//#####__________________________QUOTES SERVICE_____________________________#####//
class QuoteServices {
  static const String url = 'http://api.loveworlddictionary.org/quotes/all.php';



  static Future<List<Quote>> getQuotes() async {
    try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Quote> list = parseQuotes(response.body);
        return list;
      }
      else {
        throw Exception('Error...');  
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Quote> parseQuotes(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }

  readQuotesByCategory(String category, List quotes) {
    //const String url = 'http://api.loveworlddictionary.org/quotes/all.php';
    //SELECT * FROM `quote` WHERE `category_name` LIKE '$category' ORDER BY `category_name` DESC
    
  }
}


//#####__________________________QUOTES DAILY SERVICE_____________________________#####//
class QuotesDailyServices {
  static const String url = 'http://api.loveworlddictionary.org/quotes/quotes_daily.php';



  static Future<List<Quote>> getQuotes() async {
    try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Quote> list = parseQuotes(response.body);
        return list;
      }
      else {
        throw Exception('Error...');  
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Quote> parseQuotes(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }

}


//#####__________________________CATEGORY SERVICE_____________________________#####//
class CategoryServices {
  static const String url = 'http://api.loveworlddictionary.org/quotes/category.php';



  static Future<List<Category>> getCategories() async {
    try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Category> list = parseCategories(response.body);
        return list;
      }
      else {
        throw Exception('Error...');   
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Category> parseCategories(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }
}


//#####__________________________CATEGORY LIST SERVICE_____________________________#####//
class CategoryListServices {
  static const String url = 'http://api.loveworlddictionary.org/quotes/view_category.php?id=';



  static Future<List<Quote>> getCategoriesList(String category) async {
    try{
      final response = await http.get(url + category);
      if (response.statusCode == 200) {
        List<Quote> list = parseCategoriesList(response.body);
        return list;
      }
      else {
        throw Exception('Error...');   
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Quote> parseCategoriesList(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }
}


//#####__________________________ MESSAGE SERVICE_____________________________#####//
class MessageServices {
  static const String url = 'http://api.loveworlddictionary.org/quotes/message.php';



  static Future<List<Message>> getMessages() async {
    try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Message> list = parseMessages(response.body);
        return list;
      }
      else {
        throw Exception('Error...');   
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Message> parseMessages(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Message>((json) => Message.fromJson(json)).toList();
  }
}


//#####__________________________ MESSAGE LIST SERVICE _____________________________#####//
class MessageListServices {
  static const String url = 'http://api.loveworlddictionary.org/quotes/view_message.php?id=';



  static Future<List<Quote>> getMessagesList(String message) async {
    try{
      final response = await http.get(url + message);
      if (response.statusCode == 200) {
        List<Quote> list = parseMessagesList(response.body);
        return list;
      }
      else {
        throw Exception('Error...');   
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Quote> parseMessagesList(String responseBody) {
    var mapResponse = json.decode(responseBody);
    final parsed = mapResponse['records'];
    
    return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
  }
}