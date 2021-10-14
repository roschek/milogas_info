import 'package:flutter/material.dart';
import 'package:milongas_info/widgets/profile_widget.dart';

import 'auth_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Танго в Питере'),
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
              return const AuthPage();
            }),(route) => false);}
            ,
          )
        ],
      ),
      body: const ProfileWidget(),
    );
  }
}
