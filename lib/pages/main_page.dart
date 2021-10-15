import 'package:flutter/material.dart';
import 'package:milongas_info/domains/user.dart';
import 'package:milongas_info/pages/profile_page.dart';
import 'package:provider/provider.dart';

import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalUser? user = Provider.of<LocalUser?>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? const ProfilePage() : const AuthPage();
  }
}
