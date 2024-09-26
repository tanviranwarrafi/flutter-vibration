import 'package:flutter/material.dart';
import 'package:tutorial/components/buttons/elevate_button.dart';
import 'package:tutorial/themes/colors.dart';
import 'package:tutorial/themes/text_styles.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var icon = Icon(Icons.notifications_active, color: dark.withOpacity(0.8));
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: const Text('Vibration Tutorial'),
        actions: [IconButton(icon: icon, onPressed: Vibration.vibrate)],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Icon(Icons.vibration, size: 80, color: primary),
            const SizedBox(height: 40),
            const ElevateButton(label: 'Vibrate for default 500ms', onTap: Vibration.vibrate),
            const SizedBox(height: 20),
            ElevateButton(label: 'Vibrate for 1000ms', onTap: () => Vibration.vibrate(duration: 1000)),
            const SizedBox(height: 20),
            ElevateButton(label: 'Vibrate with pattern', onTap: () => _vibrateWithPattern(context)),
            const SizedBox(height: 20),
            ElevateButton(label: 'Vibrate with pattern and amplitude', onTap: () => _vibrateWithPatternAndAmplitude(context)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _vibrateWithPattern(BuildContext context) async {
    var text =
        'প্যাটার্ন: অপেক্ষা। 0.৫ সেঃ, ভায়ব্রেট ১ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ২ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ৩ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ০.৫ সেঃ';
    var snackBar = SnackBar(content: Text(text, style: TextStyles.text15_500.copyWith(color: white)), backgroundColor: primary);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    var pattern = [500, 1000, 500, 2000, 500, 3000, 500, 500];
    await Vibration.vibrate(pattern: pattern);
  }

  Future<void> _vibrateWithPatternAndAmplitude(BuildContext context) async {
    var text =
        'প্যাটার্ন: অপেক্ষা। 0.৫ সেঃ, ভায়ব্রেট ১ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ২ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ৩ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ০.৫ সেঃ';
    var snackBar = SnackBar(content: Text(text, style: TextStyles.text15_500.copyWith(color: white)), backgroundColor: primary);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    var pattern = [500, 1000, 500, 2000, 500, 3000, 500, 500];
    var intensities = [128, 255, 64, 255];
    await Vibration.vibrate(pattern: pattern, intensities: intensities);
  }
}
