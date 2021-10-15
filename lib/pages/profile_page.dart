import 'package:flutter/material.dart';
import 'package:milongas_info/services/auth_service.dart';
import 'package:milongas_info/widgets/profile_widget.dart';

import 'auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            onPressed: (){AuthService().logOut();}
            ,
          )
        ],
      ),
      body: const ProfileWidget(),
    );
  }
}
