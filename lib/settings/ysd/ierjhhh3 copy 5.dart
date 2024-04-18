import 'package:flutter/material.dart';

class ProfileSettingsScreenIjhkdsJDVSD extends StatefulWidget {
  @override
  _ProfileSettingsScreenIjhkdsJDVSDState createState() => _ProfileSettingsScreenIjhkdsJDVSDState();
}

class _ProfileSettingsScreenIjhkdsJDVSDState extends State<ProfileSettingsScreenIjhkdsJDVSD> {
  bool isUpdating = false;

  void updateProfile() {
    setState(() {
      isUpdating = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isUpdating = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile updated successfully")));
    });
  }

  void uploadProfilePicture() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text("Upload Picture"), content: Text("Picture uploaded successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: updateProfile,
              child: Text('Update Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: uploadProfilePicture,
              child: Text('Upload Profile Picture'),
            ),
            SizedBox(height: 20),
            isUpdating ? CircularProgressIndicator() : Container(),
          ],
        ),
      ),
    );
  }
}
