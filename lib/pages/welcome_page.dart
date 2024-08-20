import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/logo.png', // تأكد من وضع الصورة في المسار الصحيح
              fit: BoxFit.cover,
            ),
          ),
          // المحتوى
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'أهلا بعشاق القطط',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87, // لون النص
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8),
                const Text(
                  'only cats lover',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 29,
                    color: Colors.black87, // لون النص
                  ),
                ),
                const SizedBox(height: 50), // تخفيض مستوى النص ليكون قريبًا من الأسفل
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home'); // الانتقال إلى الصفحة الرئيسية
                  },
                  child: const Text('Start Now'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Theme.of(context).primaryColor, // لون الخلفية مشتق من الثيم
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    // وظيفة عند الضغط على الزر
                  },
                  child: const Text('for cattery'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).primaryColor), // لون الحدود مشتق من الثيم
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Powered by Cattery Haider Alkhalidi',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor, // لون النص مشتق من الثيم
                  ),
                ),
                const SizedBox(height: 39), // مساحة إضافية أسفل النص
              ],
            ),
          ),
        ],
      ),
    );
  }
}
