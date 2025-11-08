class ProfileSetupData {
  final String fullName;
  final int age;
  final String email;
  final String disability;
  final String caregiverRelation;
  final String caregiverPhone;
  final String caregiverEmail;
  final bool dailyReminders;
  final bool visualSchedules;
  final bool emergencyAlerts;
  final bool caregiverNotifications;

  const ProfileSetupData({
    required this.fullName,
    required this.age,
    required this.email,
    required this.disability,
    required this.caregiverRelation,
    required this.caregiverPhone,
    required this.caregiverEmail,
    required this.dailyReminders,
    required this.visualSchedules,
    required this.emergencyAlerts,
    required this.caregiverNotifications,
  });
}
