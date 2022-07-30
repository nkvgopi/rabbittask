


import 'package:rabbittask/Model/UserModel.dart';

import '../DataBase/DatabaseHelper.dart';
import '../Exports.dart';
import 'home_provider.dart';


class HomeController extends GetxController with StateMixin<dynamic>{

  late DatabaseHelper dbHelper;
  List<UserModel> userList = <UserModel>[].obs;
  int selecteditem = 0;


  @override
  void onInit() {
    initDataBase();
  }

  Future<void> initDataBase() async {
    this.dbHelper = await DatabaseHelper();
     dbHelper.main().then((value) => {
       if(value = true){
         getUsers()
       }
     });



  }

  void getUsers(){
    dbHelper.getProductList().then((value){
      print(value);
      if(value.isNotEmpty){
        print(value);
        userList = value;
        change(value, status: RxStatus.success());

      }else{
        getUserList();
      }
    });
  }
  Future<void> getUserList() async {
    userList = <UserModel>[].obs;
    HomeProvider().getUserList().then((value) {
      value.forEach((key) {
        try {
          userList.add(UserModel.fromJson(key));
          print(userList);
        } on FormatException catch (e) {
          print('The provided string is not valid JSON');
        }
      });
      print(userList);
      dbHelper.addUserInformation(userList);
      userList = value;
      change(value, status: RxStatus.success());

    }, onError: (error) {
    //  change(null, status: RxStatus.error());
    });

  }

  void searchQuery(String input){

    List<UserModel> dataSearch = userList.where((e) => e.name!.contains(input) || e.username!.contains(input) || e.email!.contains(input)).toList();
    change(dataSearch, status: RxStatus.success());


  }

}