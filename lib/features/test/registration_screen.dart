// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:home_services1/features/test/profile_screen.dart';
// import 'user_type_selection_screen.dart'; // استيراد شاشة الاختيار

// // Service Provider Registration Screen
// class ServiceProviderRegisterScreen extends StatefulWidget {
//   const ServiceProviderRegisterScreen({super.key});

//   @override
//   _ServiceProviderRegisterScreenState createState() =>
//       _ServiceProviderRegisterScreenState();
// }

// class _ServiceProviderRegisterScreenState
//     extends State<ServiceProviderRegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _fullNameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _experienceController = TextEditingController();
//   final _bioController = TextEditingController();

//   String? _selectedService;
//   File? _profileImage;
//   File? _idCard;
//   File? _license;
//   bool _isLoading = false;

//   final List<String> _services = [
//     'Plumber',
//     'Carpenter',
//     'Electrician',
//     'AC Maintenance',
//     'Painter',
//     'Cleaner',
//     'Appliance Repair',
//     'Handyman',
//   ];

//   Future<void> _pickImage(String type) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         switch (type) {
//           case 'profile':
//             _profileImage = File(image.path);
//             break;
//           case 'id':
//             _idCard = File(image.path);
//             break;
//           case 'license':
//             _license = File(image.path);
//             break;
//         }
//       });
//     }
//   }

//   Future<void> _submitApplication() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         // Simulate API call
//         await Future.delayed(Duration(seconds: 2));

//         // Navigate to confirmation screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ApplicationSubmittedScreen(),
//           ),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error submitting application. Please try again.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Register as Service Provider'),
//         centerTitle: true,
//         backgroundColor: Color(0xFF4CAF50),
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Profile picture
//               Center(
//                 child: GestureDetector(
//                   onTap: () => _pickImage('profile'),
//                   child: Container(
//                     width: 120,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Color(0xFF4CAF50), width: 3),
//                       color: Colors.grey[100],
//                     ),
//                     child: _profileImage != null
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(60),
//                             child: Image.file(
//                               _profileImage!,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                         : Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.camera_alt,
//                                 color: Color(0xFF4CAF50),
//                                 size: 30,
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 'Add Profile\nPhoto',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Color(0xFF4CAF50),
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 32),

//               // Full name
//               _buildTextField(
//                 controller: _fullNameController,
//                 label: 'Full Name',
//                 icon: Icons.person,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your full name';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16),

//               // Phone number
//               _buildTextField(
//                 controller: _phoneController,
//                 label: 'Phone Number',
//                 icon: Icons.phone,
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16),

//               // Email
//               _buildTextField(
//                 controller: _emailController,
//                 label: 'Email (Optional)',
//                 icon: Icons.email,
//                 keyboardType: TextInputType.emailAddress,
//               ),

//               SizedBox(height: 16),

//               // Password
//               _buildTextField(
//                 controller: _passwordController,
//                 label: 'Password',
//                 icon: Icons.lock,
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16),

//               // Confirm password
//               _buildTextField(
//                 controller: _confirmPasswordController,
//                 label: 'Confirm Password',
//                 icon: Icons.lock_outline,
//                 obscureText: true,
//                 validator: (value) {
//                   if (value != _passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16),

//               // Service type
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFFE0E0E0)),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: DropdownButtonFormField<String>(
//                   value: _selectedService,
//                   decoration: InputDecoration(
//                     labelText: 'Service Type',
//                     prefixIcon: Icon(Icons.work, color: Color(0xFF4CAF50)),
//                     border: InputBorder.none,
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                   ),
//                   items: _services.map((service) {
//                     return DropdownMenuItem(
//                       value: service,
//                       child: Text(service),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedService = value;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a service type';
//                     }
//                     return null;
//                   },
//                 ),
//               ),

//               SizedBox(height: 16),

//               // Years of experience
//               _buildTextField(
//                 controller: _experienceController,
//                 label: 'Years of Experience',
//                 icon: Icons.timeline,
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter years of experience';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 16),

//               // Bio
//               _buildTextField(
//                 controller: _bioController,
//                 label: 'About You',
//                 icon: Icons.info,
//                 maxLines: 4,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please tell us about yourself';
//                   }
//                   return null;
//                 },
//               ),

//               SizedBox(height: 24),

//               // Documents section
//               Text(
//                 'Documents (Optional)',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF212121),
//                 ),
//               ),

//               SizedBox(height: 16),

//               // Upload ID card
//               _buildDocumentUpload(
//                 'Upload ID Card',
//                 Icons.credit_card,
//                 _idCard,
//                 () => _pickImage('id'),
//               ),

//               SizedBox(height: 12),

//               // Upload professional license
//               _buildDocumentUpload(
//                 'Upload Professional License',
//                 Icons.description,
//                 _license,
//                 () => _pickImage('license'),
//               ),

//               SizedBox(height: 32),

//               // Submit button
//               SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: _isLoading
//                         ? null
//                         : () async {
//                             await _submitApplication(); // استدعاء الدالة
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => MainScreen()),
//                             );
//                           },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4CAF50),
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text(
//                             'Submit Application for Review',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                   )),

//               SizedBox(height: 16),

//               // Disclaimer text
//               Center(
//                 child: Text(
//                   'Your application will be reviewed and you will be notified of approval via SMS.',
//                   style: TextStyle(
//                     color: Color(0xFF757575),
//                     fontSize: 12,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     int maxLines = 1,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       maxLines: maxLines,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Color(0xFF4CAF50)),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Color(0xFFE0E0E0)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Color(0xFF4CAF50)),
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       ),
//     );
//   }

//   Widget _buildDocumentUpload(
//       String label, IconData icon, File? file, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(
//               color: file != null ? Color(0xFF4CAF50) : Color(0xFFE0E0E0)),
//           borderRadius: BorderRadius.circular(8),
//           color: file != null
//               ? Color(0xFF4CAF50).withOpacity(0.1)
//               : Colors.grey[50],
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: file != null ? Color(0xFF4CAF50) : Color(0xFF757575),
//             ),
//             SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 file != null ? 'File uploaded successfully' : label,
//                 style: TextStyle(
//                   color: file != null ? Color(0xFF4CAF50) : Color(0xFF757575),
//                   fontWeight:
//                       file != null ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//             ),
//             Icon(
//               file != null ? Icons.check_circle : Icons.upload_file,
//               color: file != null ? Color(0xFF4CAF50) : Color(0xFF757575),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTimelineItem(
//       String title, String description, bool isCompleted, bool isActive) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 16),
//       child: Row(
//         children: [
//           Container(
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               color: isCompleted
//                   ? Color(0xFF4CAF50)
//                   : (isActive ? Colors.orange : Color(0xFFE0E0E0)),
//               shape: BoxShape.circle,
//             ),
//             child: isCompleted
//                 ? Icon(Icons.check, color: Colors.white, size: 16)
//                 : (isActive
//                     ? Icon(Icons.schedule, color: Colors.white, size: 16)
//                     : null),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: isCompleted
//                         ? Color(0xFF4CAF50)
//                         : (isActive ? Colors.orange[800] : Color(0xFF757575)),
//                   ),
//                 ),
//                 SizedBox(height: 2),
//                 Text(
//                   description,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF757575),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//     );
//   }
// }

// // Application Submitted Screen
// class ApplicationSubmittedScreen extends StatelessWidget {
//   const ApplicationSubmittedScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Success icon
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: Color(0xFF4CAF50).withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.check_circle,
//                   color: Color(0xFF4CAF50),
//                   size: 80,
//                 ),
//               ),

//               SizedBox(height: 32),

//               // Success title
//               Text(
//                 'Application Submitted!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF212121),
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               SizedBox(height: 16),

//               // Success message
//               Text(
//                 'Thank you for applying to become a service provider. Your application has been submitted successfully and is now under review.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF757575),
//                   height: 1.5,
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               SizedBox(height: 24),

//               // Info box
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF4CAF50).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Color(0xFF4CAF50).withOpacity(0.3)),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.info_outline,
//                           color: Color(0xFF4CAF50),
//                           size: 20,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           'What happens next?',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF4CAF50),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 12),
//                     Text(
//                       '• Our team will review your application within 24-48 hours\n'
//                       '• You will receive an SMS notification with the decision\n'
//                       '• If approved, you can start receiving service requests\n'
//                       '• If additional information is needed, we will contact you',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Color(0xFF757575),
//                         height: 1.4,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 40),

//               // Action buttons
//               Column(
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserTypeSelectionScreen(),
//                           ),
//                           (route) => false,
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF4CAF50),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'Back to Home',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ApplicationStatusScreen(),
//                           ),
//                         );
//                       },
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: Color(0xFF4CAF50),
//                         side: BorderSide(color: Color(0xFF4CAF50)),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'Check Application Status',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Application Status Screen
// class ApplicationStatusScreen extends StatelessWidget {
//   const ApplicationStatusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Application Status'),
//         centerTitle: true,
//         backgroundColor: Color(0xFF4CAF50),
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Status card
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.orange.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.orange.withOpacity(0.3)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.pending,
//                         color: Colors.orange,
//                         size: 24,
//                       ),
//                       SizedBox(width: 12),
//                       Text(
//                         'Under Review',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.orange[800],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     'Your application is currently being reviewed by our team. This process typically takes 24-48 hours.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFF757575),
//                       height: 1.4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 24),

//             // Timeline
//             Text(
//               'Application Timeline',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF212121),
//               ),
//             ),

//             SizedBox(height: 16),

//             // Timeline items
//             _buildTimelineItem(
//               'Application Submitted',
//               'Your application has been received',
//               true,
//               true,
//             ),

//             _buildTimelineItem(
//               'Document Verification',
//               'Verifying submitted documents',
//               true,
//               false,
//             ),

//             _buildTimelineItem(
//               'Profile Review',
//               'Reviewing your profile and experience',
//               false,
//               false,
//             ),

//             _buildTimelineItem(
//               'Final Approval',
//               'Final decision and account activation',
//               false,
//               false,
//             ),

//             Spacer(),

//             // Contact support
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F5F5),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.support_agent,
//                     color: Color(0xFF4CAF50),
//                     size: 32,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Need Help?',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF212121),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Contact our support team if you have any questions about your application.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Color(0xFF757575),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 12),
//                   OutlinedButton(
//                     onPressed: () {
//                       // Contact support functionality
//                     },
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: Color(0xFF4CAF50),
//                       side: BorderSide(color: Color(0xFF4CAF50)),
//                     ),
//                     child: Text('Contact Support'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//     )
//     );}}