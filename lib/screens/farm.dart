// import 'dart:io';
// import 'dart:ui';
// import 'package:farm_and_food/utils/tips.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:farm_and_food/utils/display_md.dart';
// import 'package:farm_and_food/api/gemini_service.dart';
// import 'package:farm_and_food/constants/promts.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class FarmPage extends StatefulWidget {
//   const FarmPage({super.key});
  
//   @override
//   _FarmPageState createState() => _FarmPageState();
// }

// class _FarmPageState extends State<FarmPage> {
//   File? _image;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   void _sendImageToApi() async {
//     if (_image == null) return;

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final prompt = FARM_PROMPT;
//       final imageBytes = await _image!.readAsBytes();
//       final imagePart = DataPart('image/jpeg', imageBytes);
//       final response = await geminiModel.generateContent([Content.multi([imagePart, prompt])]);

//       showResponseDialog(context, response.text);
//     } catch (e) {
//       showResponseDialog(context, '{$e}');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Analyze Farm🪴',
//           style: TextStyle(
//             color: Color.fromARGB(255, 11, 1, 5),
//             fontSize: 20,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Lottie.asset('assets/Backgrounds/farm_home_bk.json'),
//           ),
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//               child: const SizedBox(),
//             ),
//           ),
//           Column(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       if (_image != null)
//                         Image.file(
//                           _image!,
//                           width: 250,
//                           height: 250,
//                         )
//                       else
//                         const Text(
//                           'Select A Crop/Plant Image To Explore It.',
//                           style: TextStyle(
//                             fontFamily: 'Intel-SemiBold',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600
//                           ),
//                         ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             style: const ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 5, 8, 29)),
//                             ),
//                             onPressed: () => _pickImage(ImageSource.camera),
//                             child: const Text('📷 Camera', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
//                           ),
//                           const SizedBox(width: 30),
//                           ElevatedButton(
//                             style: const ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 9, 90, 47)),
//                             ),
//                             onPressed: () => _pickImage(ImageSource.gallery),
//                             child: const Text('💿 Gallery', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         style: const ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 94, 11, 11)),
//                             ),
//                         onPressed: _sendImageToApi,
//                         child: const Text('🔍 Analyze', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           if (_isLoading)
//             Positioned(
//               top: 10,
//               left: (MediaQuery.of(context).size.width / 2) - (MediaQuery.of(context).size.width * 0.1),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.2,
//                 height: MediaQuery.of(context).size.width * 0.2,
//                 child: Lottie.asset('assets/Backgrounds/farm_loader.json'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'package:farm_and_food/constants/promts.dart';
import 'package:farm_and_food/utils/basePage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class FarmPage extends BasePage {
  const FarmPage({super.key});

  @override
  _FarmPageState createState() => _FarmPageState();
}

class _FarmPageState extends BasePageState<FarmPage> {
  @override
  String get title => 'Analyze Farm🪴';

  @override
  TextPart get prompt => FARM_PROMPT;

  @override
  String get task => 'Select A Crop/Plant Image To Explore It.';

  @override
  String get backgroundAsset => 'assets/Backgrounds/farm_home_bk.json';
  
  @override
  String get loaderAsset => 'assets/Backgrounds/farm_loader.json';

}