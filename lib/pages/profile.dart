




import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/login.dart';
import 'package:shopping_application/pages/orders_page.dart';
import 'package:shopping_application/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? email;
  String? password;
  String? profileImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString("loggedInEmail");
    String? usersJson = prefs.getString("users");
    if (loggedInEmail == null || usersJson == null) return;

    Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));
    if (!users.containsKey(loggedInEmail)) return;

    var currentUser = users[loggedInEmail];
    setState(() {
      name = currentUser["name"] ?? S.of(context).guest;
      email = currentUser["email"] ?? "example@mail.com";
      password = currentUser["password"] ?? "********";
      profileImagePath = currentUser["profileImage"];
    });
  }

  Future<void> _saveUserData({String? newName, String? newPassword}) async {
    final prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString("loggedInEmail");
    String? usersJson = prefs.getString("users");
    if (loggedInEmail == null || usersJson == null) return;

    Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));
    if (!users.containsKey(loggedInEmail)) return;

    var currentUser = users[loggedInEmail];
    if (newName != null) currentUser["name"] = newName;
    if (newPassword != null) currentUser["password"] = newPassword;

    users[loggedInEmail] = currentUser;
    await prefs.setString("users", jsonEncode(users));

    setState(() {
      if (newName != null) name = newName;
      if (newPassword != null) password = newPassword;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 70);
    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      String? loggedInEmail = prefs.getString("loggedInEmail");
      String? usersJson = prefs.getString("users");
      if (loggedInEmail == null || usersJson == null) return;

      Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));
      if (users.containsKey(loggedInEmail)) {
        users[loggedInEmail]["profileImage"] = pickedFile.path;
        await prefs.setString("users", jsonEncode(users));

        setState(() {
          profileImagePath = pickedFile.path;
        });
      }
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo, color: Colors.deepPurple),
              title: Text(S.of(context).chooseFromGallery),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.deepPurple),
              title: Text(S.of(context).takePhoto),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editField(String field, String currentValue) {
    final controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("${S.of(context).edit} $field"),
        content: TextField(
          controller: controller,
          obscureText: field == S.of(context).password,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "${S.of(context).enterNew} $field",
          ),
        ),
        actions: [
          TextButton(
            child: Text(S.of(context).cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade100),
            child: Text(S.of(context).save),
            onPressed: () {
              if (field == S.of(context).name) {
                _saveUserData(newName: controller.text);
              } else if (field == S.of(context).password) {
                _saveUserData(newPassword: controller.text);
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _editPassword(String currentPassword) async {
    final prefs = await SharedPreferences.getInstance();
    TextEditingController controller = TextEditingController(text: currentPassword);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).editPassword),
        content: TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            labelText: S.of(context).newPassword,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            child: Text(S.of(context).cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text(S.of(context).save),
            onPressed: () {
              String newPass = controller.text.trim();

              if (newPass.length < 8) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).passwordMin8)),
                );
                return;
              }
              if (!newPass.contains(RegExp(r'[A-Z]'))) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).passwordUppercase)),
                );
                return;
              }
              if (!newPass.contains(RegExp(r'[a-z]'))) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).passwordLowercase)),
                );
                return;
              }
              if (!newPass.contains(RegExp(r'[0-9]'))) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).passwordNumber)),
                );
                return;
              }
              if (!newPass.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).passwordSpecialChar)),
                );
                return;
              }

              _saveUserData(newPassword: newPass);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).passwordUpdated)),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("loggedInEmail");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "${S.of(context).welcomeBack}, ${name ?? S.of(context).guest}!",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                CircleAvatar(
  radius: 60,
  child: ClipOval(
    child: profileImagePath != null &&
            profileImagePath!.isNotEmpty &&
            File(profileImagePath!).existsSync()
        ? Image.file(
            File(profileImagePath!),
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          )
        : const Icon(Icons.person, size: 70, color: Colors.deepPurple)
  ),
),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _showImageSourceDialog,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.edit,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.deepPurple),
                title: Text(name ?? ""),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepPurple),
                  onPressed: () => _editField(S.of(context).name, name ?? ""),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.deepPurple),
                title: Text(email ?? ""),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.lock, color: Colors.deepPurple),
                title: const Text("********"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepPurple),
                  onPressed: () => _editPassword(password ?? "********"),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                String? currentEmail = prefs.getString("loggedInEmail");
                if (currentEmail != null && currentEmail.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdersPage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).pleaseLoginFirst)),
                  );
                }
              },
              icon: const Icon(Icons.list_alt, color: Colors.white),
              label: Text(
                S.of(context).myOrders,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _logout,
              icon: const Icon(Icons.logout, color: Colors.white),
              label: Text(
                S.of(context).logout,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

