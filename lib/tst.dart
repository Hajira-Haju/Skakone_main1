import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthExample extends StatefulWidget {
  @override
  _LocalAuthExampleState createState() => _LocalAuthExampleState();
}

class _LocalAuthExampleState extends State<LocalAuthExample> {
  final LocalAuthentication auth = LocalAuthentication();
  String _status = "Not Authenticated";

  Future<void> _authenticate() async {
    try {
      bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: false, // Allow PIN/Password too
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      setState(() {
        _status = didAuthenticate ? "Authenticated" : "Authentication Failed";
      });
    } catch (e) {
      setState(() {
        _status = "Error: $e";
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Auth Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: const Text("Authenticate"),
            ),
          ],
        ),
      ),
    );
  }

}
