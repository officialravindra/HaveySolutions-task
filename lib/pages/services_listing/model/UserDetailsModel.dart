class UserDetailsModel {
  ServiceDetails? serviceDetails;
  PersonalDetails? personalDetails;
  ContactInformation? contactInformation;
  ReferralDetails? referralDetails;
  FamilyBookDetails? familyBookDetails;
  SpouseDetails? spouseDetails;
  IncomeDetails? incomeDetails;
  List<RentalPropertyIncome>? rentalPropertyIncome;
  List<EmploymentDetails>? employmentDetails;

  UserDetailsModel(
      {this.serviceDetails,
        this.personalDetails,
        this.contactInformation,
        this.referralDetails,
        this.familyBookDetails,
        this.spouseDetails,
        this.incomeDetails,
        this.rentalPropertyIncome,
        this.employmentDetails});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    serviceDetails = json['service_details'] != null
        ? new ServiceDetails.fromJson(json['service_details'])
        : null;
    personalDetails = json['personal_details'] != null
        ? new PersonalDetails.fromJson(json['personal_details'])
        : null;
    contactInformation = json['contact_information'] != null
        ? new ContactInformation.fromJson(json['contact_information'])
        : null;
    referralDetails = json['referral_details'] != null
        ? new ReferralDetails.fromJson(json['referral_details'])
        : null;
    familyBookDetails = json['family_book_details'] != null
        ? new FamilyBookDetails.fromJson(json['family_book_details'])
        : null;
    spouseDetails = json['spouse_details'] != null
        ? new SpouseDetails.fromJson(json['spouse_details'])
        : null;
    incomeDetails = json['income_details'] != null
        ? new IncomeDetails.fromJson(json['income_details'])
        : null;
    if (json['rental_property_income'] != null) {
      rentalPropertyIncome = <RentalPropertyIncome>[];
      json['rental_property_income'].forEach((v) {
        rentalPropertyIncome!.add(new RentalPropertyIncome.fromJson(v));
      });
    }
    if (json['employment_details'] != null) {
      employmentDetails = <EmploymentDetails>[];
      json['employment_details'].forEach((v) {
        employmentDetails!.add(new EmploymentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceDetails != null) {
      data['service_details'] = this.serviceDetails!.toJson();
    }
    if (this.personalDetails != null) {
      data['personal_details'] = this.personalDetails!.toJson();
    }
    if (this.contactInformation != null) {
      data['contact_information'] = this.contactInformation!.toJson();
    }
    if (this.referralDetails != null) {
      data['referral_details'] = this.referralDetails!.toJson();
    }
    if (this.familyBookDetails != null) {
      data['family_book_details'] = this.familyBookDetails!.toJson();
    }
    if (this.spouseDetails != null) {
      data['spouse_details'] = this.spouseDetails!.toJson();
    }
    if (this.incomeDetails != null) {
      data['income_details'] = this.incomeDetails!.toJson();
    }
    if (this.rentalPropertyIncome != null) {
      data['rental_property_income'] =
          this.rentalPropertyIncome!.map((v) => v.toJson()).toList();
    }
    if (this.employmentDetails != null) {
      data['employment_details'] =
          this.employmentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceDetails {
  String? serviceType;
  String? serviceLocation;

  ServiceDetails({this.serviceType, this.serviceLocation});

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    serviceType = json['service_type'];
    serviceLocation = json['service_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_type'] = this.serviceType;
    data['service_location'] = this.serviceLocation;
    return data;
  }
}

class PersonalDetails {
  String? fullName;
  String? emiratesId;
  String? birthday;
  String? maritalStatus;
  String? gender;

  PersonalDetails(
      {this.fullName,
        this.emiratesId,
        this.birthday,
        this.maritalStatus,
        this.gender});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    emiratesId = json['emirates_id'];
    birthday = json['Birthday'];
    maritalStatus = json['marital_status'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['emirates_id'] = this.emiratesId;
    data['Birthday'] = this.birthday;
    data['marital_status'] = this.maritalStatus;
    data['gender'] = this.gender;
    return data;
  }
}

class ContactInformation {
  PrimaryNumber? primaryNumber;
  PrimaryNumber? alternateNumber;

  ContactInformation({this.primaryNumber, this.alternateNumber});

  ContactInformation.fromJson(Map<String, dynamic> json) {
    primaryNumber = json['primary_number'] != null
        ? new PrimaryNumber.fromJson(json['primary_number'])
        : null;
    alternateNumber = json['alternate_number'] != null
        ? new PrimaryNumber.fromJson(json['alternate_number'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primaryNumber != null) {
      data['primary_number'] = this.primaryNumber!.toJson();
    }
    if (this.alternateNumber != null) {
      data['alternate_number'] = this.alternateNumber!.toJson();
    }
    return data;
  }
}

class PrimaryNumber {
  String? countryCode;
  String? mobileNumber;

  PrimaryNumber({this.countryCode, this.mobileNumber});

  PrimaryNumber.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}

class ReferralDetails {
  PrimaryNumber? referralNumber;
  String? referralName;

  ReferralDetails({this.referralNumber, this.referralName});

  ReferralDetails.fromJson(Map<String, dynamic> json) {
    referralNumber = json['referral_number'] != null
        ? new PrimaryNumber.fromJson(json['referral_number'])
        : null;
    referralName = json['referral_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.referralNumber != null) {
      data['referral_number'] = this.referralNumber!.toJson();
    }
    data['referral_name'] = this.referralName;
    return data;
  }
}

class FamilyBookDetails {
  String? town;
  String? familyNumber;
  String? numberOfWife;
  String? numberOfChildrens;

  FamilyBookDetails(
      {this.town,
        this.familyNumber,
        this.numberOfWife,
        this.numberOfChildrens});

  FamilyBookDetails.fromJson(Map<String, dynamic> json) {
    town = json['town'];
    familyNumber = json['family_number'];
    numberOfWife = json['number_of_wife'];
    numberOfChildrens = json['number_of_childrens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['town'] = this.town;
    data['family_number'] = this.familyNumber;
    data['number_of_wife'] = this.numberOfWife;
    data['number_of_childrens'] = this.numberOfChildrens;
    return data;
  }
}

class SpouseDetails {
  String? fullName;
  String? emirateId;
  String? nationality;
  String? birthday;

  SpouseDetails(
      {this.fullName, this.emirateId, this.nationality, this.birthday});

  SpouseDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    emirateId = json['emirate_id'];
    nationality = json['nationality'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['emirate_id'] = this.emirateId;
    data['nationality'] = this.nationality;
    data['birthday'] = this.birthday;
    return data;
  }
}

class IncomeDetails {
  String? monthlyGrossIncome;
  String? estimatedLoanAmount;

  IncomeDetails({this.monthlyGrossIncome, this.estimatedLoanAmount});

  IncomeDetails.fromJson(Map<String, dynamic> json) {
    monthlyGrossIncome = json['monthly_gross_income'];
    estimatedLoanAmount = json['estimated_loan_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monthly_gross_income'] = this.monthlyGrossIncome;
    data['estimated_loan_amount'] = this.estimatedLoanAmount;
    return data;
  }
}

class RentalPropertyIncome {
  String? propertyName;
  String? income;

  RentalPropertyIncome({this.propertyName, this.income});

  RentalPropertyIncome.fromJson(Map<String, dynamic> json) {
    propertyName = json['property_name'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property_name'] = this.propertyName;
    data['income'] = this.income;
    return data;
  }
}

class EmploymentDetails {
  String? employerName;
  String? employementStatus;
  String? salary;

  EmploymentDetails({this.employerName, this.employementStatus, this.salary});

  EmploymentDetails.fromJson(Map<String, dynamic> json) {
    employerName = json['employer_name'];
    employementStatus = json['employement_status'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employer_name'] = this.employerName;
    data['employement_status'] = this.employementStatus;
    data['salary'] = this.salary;
    return data;
  }
}










// class UserDetailsModel {
//   ServiceDetails? serviceDetails;
//   PersonalDetails? personalDetails;
//   ContactInformation? contactInformation;
//   ReferralDetails? referralDetails;
//   FamilyBookDetails? familyBookDetails;
//   SpouseDetails? spouseDetails;
//   IncomeDetails? incomeDetails;
//   List<RentalPropertyIncome>? rentalPropertyIncome;
//   List<EmploymentDetails>? employmentDetails;
//
//   UserDetailsModel(
//       {this.serviceDetails,
//         this.personalDetails,
//         this.contactInformation,
//         this.referralDetails,
//         this.familyBookDetails,
//         this.spouseDetails,
//         this.incomeDetails,
//         this.rentalPropertyIncome,
//         this.employmentDetails});
//
//   UserDetailsModel.fromJson(Map<String, dynamic> json) {
//     serviceDetails = json['service_details'] != null
//         ? new ServiceDetails.fromJson(json['service_details'])
//         : null;
//     personalDetails = json['personal_details'] != null
//         ? new PersonalDetails.fromJson(json['personal_details'])
//         : null;
//     contactInformation = json['contact_information'] != null
//         ? new ContactInformation.fromJson(json['contact_information'])
//         : null;
//     referralDetails = json['referral_details'] != null
//         ? new ReferralDetails.fromJson(json['referral_details'])
//         : null;
//     familyBookDetails = json['family_book_details'] != null
//         ? new FamilyBookDetails.fromJson(json['family_book_details'])
//         : null;
//     spouseDetails = json['spouse_details'] != null
//         ? new SpouseDetails.fromJson(json['spouse_details'])
//         : null;
//     incomeDetails = json['income_details'] != null
//         ? new IncomeDetails.fromJson(json['income_details'])
//         : null;
//     if (json['rental_property_income'] != null) {
//       rentalPropertyIncome = <RentalPropertyIncome>[];
//       json['rental_property_income'].forEach((v) {
//         rentalPropertyIncome!.add(new RentalPropertyIncome.fromJson(v));
//       });
//     }
//     if (json['employment_details'] != null) {
//       employmentDetails = <EmploymentDetails>[];
//       json['employment_details'].forEach((v) {
//         employmentDetails!.add(new EmploymentDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.serviceDetails != null) {
//       data['service_details'] = this.serviceDetails!.toJson();
//     }
//     if (this.personalDetails != null) {
//       data['personal_details'] = this.personalDetails!.toJson();
//     }
//     if (this.contactInformation != null) {
//       data['contact_information'] = this.contactInformation!.toJson();
//     }
//     if (this.referralDetails != null) {
//       data['referral_details'] = this.referralDetails!.toJson();
//     }
//     if (this.familyBookDetails != null) {
//       data['family_book_details'] = this.familyBookDetails!.toJson();
//     }
//     if (this.spouseDetails != null) {
//       data['spouse_details'] = this.spouseDetails!.toJson();
//     }
//     if (this.incomeDetails != null) {
//       data['income_details'] = this.incomeDetails!.toJson();
//     }
//     if (this.rentalPropertyIncome != null) {
//       data['rental_property_income'] =
//           this.rentalPropertyIncome!.map((v) => v.toJson()).toList();
//     }
//     if (this.employmentDetails != null) {
//       data['employment_details'] =
//           this.employmentDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ServiceDetails {
//   String? serviceType;
//   String? serviceLocation;
//
//   ServiceDetails({this.serviceType, this.serviceLocation});
//
//   ServiceDetails.fromJson(Map<String, dynamic> json) {
//     serviceType = json['service_type'];
//     serviceLocation = json['service_location'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['service_type'] = this.serviceType;
//     data['service_location'] = this.serviceLocation;
//     return data;
//   }
// }
//
// class PersonalDetails {
//   String? fullName;
//   String? emiratesId;
//   String? birthday;
//   String? maritalStatus;
//   String? gender;
//
//   PersonalDetails(
//       {this.fullName,
//         this.emiratesId,
//         this.birthday,
//         this.maritalStatus,
//         this.gender});
//
//   PersonalDetails.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//     emiratesId = json['emirates_id'];
//     birthday = json['Birthday'];
//     maritalStatus = json['marital_status'];
//     gender = json['gender'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['full_name'] = this.fullName;
//     data['emirates_id'] = this.emiratesId;
//     data['Birthday'] = this.birthday;
//     data['marital_status'] = this.maritalStatus;
//     data['gender'] = this.gender;
//     return data;
//   }
// }
//
// class ContactInformation {
//   String? primaryNumber;
//   String? alternateNumber;
//
//   ContactInformation({this.primaryNumber, this.alternateNumber});
//
//   ContactInformation.fromJson(Map<String, dynamic> json) {
//     primaryNumber = json['primary_number'];
//     alternateNumber = json['alternate_number'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['primary_number'] = this.primaryNumber;
//     data['alternate_number'] = this.alternateNumber;
//     return data;
//   }
// }
//
// class ReferralDetails {
//   String? referralNumber;
//   String? referralName;
//
//   ReferralDetails({this.referralNumber, this.referralName});
//
//   ReferralDetails.fromJson(Map<String, dynamic> json) {
//     referralNumber = json['referral_number'];
//     referralName = json['referral_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['referral_number'] = this.referralNumber;
//     data['referral_name'] = this.referralName;
//     return data;
//   }
// }
//
// class FamilyBookDetails {
//   String? town;
//   String? familyNumber;
//   String? numberOfWife;
//   String? numberOfChildrens;
//
//   FamilyBookDetails(
//       {this.town,
//         this.familyNumber,
//         this.numberOfWife,
//         this.numberOfChildrens});
//
//   FamilyBookDetails.fromJson(Map<String, dynamic> json) {
//     town = json['town'];
//     familyNumber = json['family_number'];
//     numberOfWife = json['number_of_wife'];
//     numberOfChildrens = json['number_of_childrens'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['town'] = this.town;
//     data['family_number'] = this.familyNumber;
//     data['number_of_wife'] = this.numberOfWife;
//     data['number_of_childrens'] = this.numberOfChildrens;
//     return data;
//   }
// }
//
// class SpouseDetails {
//   String? fullName;
//   String? emirateId;
//   String? nationality;
//   String? birthday;
//
//   SpouseDetails(
//       {this.fullName, this.emirateId, this.nationality, this.birthday});
//
//   SpouseDetails.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//     emirateId = json['emirate_id'];
//     nationality = json['nationality'];
//     birthday = json['birthday'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['full_name'] = this.fullName;
//     data['emirate_id'] = this.emirateId;
//     data['nationality'] = this.nationality;
//     data['birthday'] = this.birthday;
//     return data;
//   }
// }
//
// class IncomeDetails {
//   String? monthlyGrossIncome;
//   String? estimatedLoanAmount;
//
//   IncomeDetails({this.monthlyGrossIncome, this.estimatedLoanAmount});
//
//   IncomeDetails.fromJson(Map<String, dynamic> json) {
//     monthlyGrossIncome = json['monthly_gross_income'];
//     estimatedLoanAmount = json['estimated_loan_amount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['monthly_gross_income'] = this.monthlyGrossIncome;
//     data['estimated_loan_amount'] = this.estimatedLoanAmount;
//     return data;
//   }
// }
//
// class RentalPropertyIncome {
//   String? propertyName;
//   String? income;
//
//   RentalPropertyIncome({this.propertyName, this.income});
//
//   RentalPropertyIncome.fromJson(Map<String, dynamic> json) {
//     propertyName = json['property_name'];
//     income = json['income'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['property_name'] = this.propertyName;
//     data['income'] = this.income;
//     return data;
//   }
// }
//
// class EmploymentDetails {
//   String? employerName;
//   String? employementStatus;
//   String? salary;
//
//   EmploymentDetails({this.employerName, this.employementStatus, this.salary});
//
//   EmploymentDetails.fromJson(Map<String, dynamic> json) {
//     employerName = json['employer_name'];
//     employementStatus = json['employement_status'];
//     salary = json['salary'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['employer_name'] = this.employerName;
//     data['employement_status'] = this.employementStatus;
//     data['salary'] = this.salary;
//     return data;
//   }
// }
