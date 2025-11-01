// import 'package:flutter/material.dart';
// import 'package:home_services1/features/test/test_screen.dart';
// import 'package:home_services1/features/Auth/ui/login_screen.dart';

// // User Type Selection Screen
// class UserTypeSelectionScreen extends StatelessWidget {
//   const UserTypeSelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF4CAF50),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header with logo
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 8,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Icon(
//                       Icons.home_repair_service,
//                       color: Color(0xFF4CAF50),
//                       size: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10),

//                       // Main title
//                       Center(
//                         child: Text(
//                           'Choose How You Want to Join Us',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF212121),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),

//                       SizedBox(height: 12),

//                       // Description
//                       Center(
//                         child: Text(
//                           'Please select the account type that suits you to continue in the app.',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color(0xFF757575),
//                             height: 1.5,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),

//                       SizedBox(height: 40),

//                       // User card
//                       UserTypeCard(
//                         icon: Icons.person,
//                         title: 'I\'m a User',
//                         description: 'I need to request home services.',
//                         features: [
//                           'Discover services',
//                           'Order with one click',
//                           'Track your order'
//                         ],
//                         onTap: () {
//                           // Navigate to user registration
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginScreen(),
//                             ),
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                                 content:
//                                     Text('Navigating to user registration')),
//                           );
//                         },
//                       ),

//                       SizedBox(height: 20),

//                       // Service provider card
//                       UserTypeCard(
//                         icon: Icons.build,
//                         title: 'I\'m a Service Provider',
//                         description:
//                             'I provide services and looking for clients.',
//                         features: [
//                           'Get requests',
//                           'Manage your business',
//                           'Increase your income'
//                         ],
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ServiceProviderRegisterScreen(),
//                             ),
//                           );
//                         },
//                       ),

//                       // Spacer(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // User Type Card Widget
// class UserTypeCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final List<String> features;
//   final VoidCallback onTap;

//   const UserTypeCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.description,
//     required this.features,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Color(0xFFE0E0E0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF4CAF50).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     icon,
//                     color: Color(0xFF4CAF50),
//                     size: 28,
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF212121),
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         description,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF757575),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   color: Color(0xFF4CAF50),
//                   size: 16,
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             ...features.map((feature) => Padding(
//                   padding: EdgeInsets.only(bottom: 8),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 6,
//                         height: 6,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF4CAF50),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Text(
//                         feature,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF757575),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }




