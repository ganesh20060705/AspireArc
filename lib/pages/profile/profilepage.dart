import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  File? _image;
  final picker = ImagePicker();
  bool isLoading = false;

  // Editable fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  String? profileImageUrl;
  String? privacySetting = "Public";

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    // Initialize the user and load profile details if the user is not null
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _loadProfileDetails();
    } else {
      // Handle unauthenticated state, e.g., redirect to login page
      print('User is not authenticated.');
    }
  }

  Future<void> _loadProfileDetails() async {
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data()!;
      setState(() {
        profileImageUrl = data['profileImageUrl'];
        _nameController.text = data['name'] ?? '';
        _emailController.text = data['email'] ?? '';
        _bioController.text = data['bio'] ?? '';
        _interestsController.text = data['interests'] ?? '';
        _skillsController.text = data['skills'] ?? '';
        privacySetting = data['privacySetting'] ?? 'Public';
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadProfileImage() async {
    if (_image == null || user == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user!.uid}.jpg');

      await ref.putFile(_image!);
      profileImageUrl = await ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _saveProfileDetails() async {
    if (user == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      if (_image != null) {
        await _uploadProfileImage();
      }

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'bio': _bioController.text,
        'interests': _interestsController.text,
        'skills': _skillsController.text,
        'profileImageUrl': profileImageUrl,
        'privacySetting': privacySetting,
      }, SetOptions(merge: true));
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      print('Error saving profile details: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _interestsController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : profileImageUrl != null
                              ? NetworkImage(profileImageUrl!)
                              : const AssetImage('lib/assets/profile.jpeg')
                                  as ImageProvider,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Select Profile Image'),
                    ),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      readOnly: false,
                    ),
                    TextField(
                      controller: _bioController,
                      decoration: const InputDecoration(labelText: 'Bio'),
                      maxLines: 3,
                    ),
                    TextField(
                      controller: _interestsController,
                      decoration: const InputDecoration(labelText: 'Interests'),
                    ),
                    TextField(
                      controller: _skillsController,
                      decoration: const InputDecoration(labelText: 'Skills'),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: privacySetting,
                      onChanged: (newValue) {
                        setState(() {
                          privacySetting = newValue;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: "Public",
                          child: Text("Public"),
                        ),
                        DropdownMenuItem(
                          value: "Private",
                          child: Text("Private"),
                        ),
                        DropdownMenuItem(
                          value: "Friends Only",
                          child: Text("Friends Only"),
                        ),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Privacy Setting',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveProfileDetails,
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
