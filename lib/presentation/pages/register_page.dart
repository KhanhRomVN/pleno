import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _username = '';
  SharedPreferences? _prefs;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _register() async {
    if (_prefs == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Shared Preferences not initialized. Please try again.')),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final response = await http.post(
          Uri.parse('https://plene-go.onrender.com/register'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'fullname': _fullName,
            'email': _email,
            'password': _password,
            'username': _username,
          }),
        );

        if (response.statusCode == 200) {
          Navigator.of(context).pushReplacementNamed('/login');
        } else {
          // Registration failed
          print('Registration failed: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed. Please try again.')),
          );
        }
      } catch (e) {
        print('Error during registration: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again later.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: Image.asset(
                              'assets/images/pleno-logo-png.png',
                              height: 40,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Create your account',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24),
                          _buildTextFormField('Full Name', Icons.person,
                              (value) => _fullName = value!),
                          SizedBox(height: 16),
                          _buildTextFormField('Username', Icons.account_circle,
                              (value) => _username = value!),
                          SizedBox(height: 16),
                          _buildTextFormField(
                              'Email', Icons.email, (value) => _email = value!,
                              isEmail: true),
                          SizedBox(height: 16),
                          _buildTextFormField('Password', Icons.lock,
                              (value) => _password = value!,
                              isPassword: true),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade400,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text('Register',
                                style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/login');
                                },
                                child: Text('Login'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      String label, IconData icon, Function(String?) onSaved,
      {bool isPassword = false, bool isEmail = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 20),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      style: TextStyle(fontSize: 14),
      obscureText: isPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $label';
        }
        if (isEmail && !value.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
