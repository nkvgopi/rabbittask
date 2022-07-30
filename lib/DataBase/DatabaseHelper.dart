


import 'package:sqflite/sqflite.dart';

import '../Exports.dart';
import 'package:path/path.dart';

import '../Model/UserModel.dart';


class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;
  factory DatabaseHelper() {
    return _databaseHelper;
  }
  late final database;

  Future<bool> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    database = openDatabase(join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user(id INT, name TEXT, username TEXT, email TEXT, profile_image TEXT,add_street TEXT, add_suite TEXT, add_city TEXT, add_zip TEXT,lati TEXT, lng TEXT, phone TEXT, website TEXT, comp_name TEXT, comp_phrase TEXT, comp_bs TEXT)',
        );
      },
      version: 1,
    );

    return true;
  }


  Future<bool> addUserInformation(List<UserModel> userData) async {
    final fd = await database;

    for (var user in userData)  {
      int result = await fd.insert('user', {"id": "${user.id}", "name": "${user.name}","username":"${user.username}",
        "email":"${user.email}",
        "profile_image":"${user.profileImage}",
        "add_street":"${user.address?.street}",
        "add_suite":"${user.address?.suite}",
        "add_city":"${user.address?.suite}",
        "add_zip":"${user.address?.zipcode}",
        "lati":"${user.address?.geo?.lat}",
        "lng":"${user.address?.geo?.lng}",
        "phone":"${user.phone}",
        "website":"${user.website}",
        "comp_name":"${user.company?.name}",
        "comp_phrase":"${user.company?.catchPhrase}",
        "comp_bs":"${user.company?.bs}",


      }, conflictAlgorithm: ConflictAlgorithm.replace);
      print(result);
    }


    return true;
  }




  Future<List<UserModel>> getProductList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    List<UserModel> userList = [];






    for (var element in maps) {

      int? id = element["id"];;
      String? name = "${element["name"]}";
      String? username = "${element["username"]}";
      String? email = "${element["email"]}";
      String? profileImage = "${element["profile_image"]}";
       Geo geo = Geo("${element["lati"]}", "${element["lng"]}");
      Address? address = Address("${element["add_street"]}", "${element["add_suite"]}", "${element["add_city"]}", "${element["add_zip"]}", geo);
      String? phone = "${element["phone"]}";
      String? website = "${element["website"]}";
      Company? company =   Company("${element["comp_name"]}", "${element["comp_phrase"]}", "${element["comp_bs"]}");
      UserModel user = UserModel(id, name, username, email, profileImage, address, phone, website, company);

      userList.add(user);
    }
    return userList;
  }






}
