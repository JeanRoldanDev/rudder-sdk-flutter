import 'package:rudder_sdk_flutter/Utils.dart';

class RudderTraits {
  /// Initialise RudderTraits
  ///
  /// @param address     Address
  /// @param age         String
  /// @param birthday    String
  /// @param company     Company
  /// @param createdAt   String
  /// @param description String
  /// @param email       String
  /// @param firstName   String
  /// @param gender      String
  /// @param id          String
  /// @param lastName    String
  /// @param name        String
  /// @param phone       String
  /// @param title       String
  /// @param userName    String
  const RudderTraits({
    this.address,
    this.age,
    this.birthday,
    this.company,
    this.createdAt,
    this.description,
    this.email,
    this.firstName,
    this.gender,
    this.id,
    this.lastName,
    this.name,
    this.phone,
    this.title,
    this.userName,
    this.extras,
  });

  final Address? address;
  final int? age;
  final String? birthday;
  final Company? company;
  final String? createdAt;
  final String? description;
  final String? email;
  final String? firstName;
  final String? gender;
  final String? id;
  final String? lastName;
  final String? name;
  final String? phone;
  final String? title;
  final String? userName;
  final Map<String, dynamic>? extras;

  /// Put Address
  ///
  /// @param address Address
  /// @return traits RudderTraits
  RudderTraits putAddress(Address address) {
    return copyWith(address: address);
  }

  /// put Age
  ///
  /// @param age int
  /// @return traits RudderTraits
  RudderTraits putAge(int age) {
    return copyWith(age: age);
  }

  /// put Birthday as Date
  ///
  /// @param birthday Date
  /// @return traits RudderTraits
  RudderTraits putBirthdayDate(DateTime birthdayDate) {
    return copyWith(birthday: Utils.toDateString(birthdayDate));
  }

  RudderTraits putBirthdayString(String birthdayString) {
    return copyWith(birthday: birthdayString);
  }

  /// put Company
  ///
  /// @param company Company
  /// @return traits RudderTraits
  RudderTraits putCompany(Company company) {
    return copyWith(company: company);
  }

  /// put Created At
  ///
  /// @param createdAt String
  /// @return traits RudderTraits
  RudderTraits putCreatedAt(String createdAt) {
    return copyWith(createdAt: createdAt);
  }

  /// put description
  ///
  /// @param description String
  /// @return traits RudderTraits
  RudderTraits putDescription(String description) {
    return copyWith(description: description);
  }

  /// put email
  ///
  /// @param email String
  /// @return traits RudderTraits
  RudderTraits putEmail(String email) {
    return copyWith(email: email);
  }

  /// put First Name
  ///
  /// @param firstName String
  /// @return traits RudderTraits
  RudderTraits putFirstName(String firstName) {
    return copyWith(firstName: firstName);
  }

  /// put gender
  ///
  /// @param gender String
  /// @return traits RudderTraits
  RudderTraits putGender(String gender) {
    return copyWith(gender: gender);
  }

  /// put id
  ///
  /// @param id String
  /// @return traits RudderTraits
  RudderTraits putId(String id) {
    return copyWith(id: id);
  }

  /// put Last Name
  ///
  /// @param lastName String
  /// @return traits RudderTraits
  RudderTraits putLastName(String lastName) {
    return copyWith(lastName: lastName);
  }

  /// put name
  ///
  /// @param name String
  /// @return traits RudderTraits
  RudderTraits putName(String name) {
    return copyWith(name: name);
  }

  /// put phone
  ///
  /// @param phone String
  /// @return traits RudderTraits
  RudderTraits putPhone(String phone) {
    return copyWith(phone: phone);
  }

  /// put title
  ///
  /// @param title String
  /// @return traits RudderTraits
  RudderTraits putTitle(String title) {
    return copyWith(title: title);
  }

  /// put User Name
  ///
  /// @param userName String
  /// @return traits RudderTraits
  RudderTraits putUserName(String userName) {
    return copyWith(userName: userName);
  }

  /// put generic key value pairs
  ///
  /// @param key   String
  /// @param value Object
  /// @return traits RudderTraits
  RudderTraits put(String key, dynamic value) {
    var newExtras = <String, dynamic>{};
    if (extras != null) {
      newExtras = extras!;
    }
    newExtras[key] = value;
    return copyWith(extras: newExtras);
  }

  RudderTraits putValue(Map<String, dynamic> map) {
    var newExtras = <String, dynamic>{};
    if (extras != null) {
      newExtras = extras!;
    }
    newExtras.addAll(map);
    return copyWith(extras: newExtras);
  }

  RudderTraits copyWith({
    Address? address,
    int? age,
    String? birthday,
    Company? company,
    String? createdAt,
    String? description,
    String? email,
    String? firstName,
    String? gender,
    String? id,
    String? lastName,
    String? name,
    String? phone,
    String? title,
    String? userName,
    Map<String, dynamic>? extras,
  }) {
    return RudderTraits(
      address: address ?? this.address,
      age: age ?? this.age,
      birthday: birthday ?? this.birthday,
      company: company ?? this.company,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      title: title ?? this.title,
      userName: userName ?? this.userName,
      extras: extras ?? this.extras,
    );
  }

  Map<String, dynamic> traitsMap() => <String, dynamic>{
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'name': name,
        'age': age,
        'email': email,
        'phone': phone,
        'address': address != null ? address!.addressMap : null,
        'birthday': birthday.toString(),
        'company': company != null ? company!.companyMap : null,
        'createdAt': createdAt,
        'description': description,
        'gender': gender,
        'title': title,
        'username': userName,
        'extras': extras
      };
}

class Address {
  /// constructor
  ///
  /// @param city       String
  /// @param country    String
  /// @param postalCode String
  /// @param state      String
  /// @param street     String
  const Address({
    this.city,
    this.country,
    this.postalCode,
    this.state,
    this.street,
  });

  final String? city;
  final String? country;
  final String? postalCode;
  final String? state;
  final String? street;

  /// put city
  ///
  /// @param city String
  /// @return address Address
  Address putCity(String city) {
    return copyWith(city: city);
  }

  /// put country
  ///
  /// @param country String
  /// @return address Address
  Address putCountry(String country) {
    return copyWith(country: country);
  }

  /// put postal code
  ///
  /// @param postalCode String
  /// @return address Address
  Address putPostalCode(String postalCode) {
    return copyWith(postalCode: postalCode);
  }

  /// put state String
  ///
  /// @param state String
  /// @return address Address
  Address putState(String state) {
    return copyWith(state: state);
  }

  /// put street String
  ///
  /// @param street String
  /// @return address Address
  Address putStreet(String street) {
    return copyWith(street: street);
  }

  Address copyWith({
    String? city,
    String? country,
    String? postalCode,
    String? state,
    String? street,
  }) {
    return Address(
      city: city ?? this.city,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      state: state ?? this.state,
      street: street ?? this.street,
    );
  }

  Map<String, dynamic> get addressMap => <String, dynamic>{
        'city': city,
        'country': country,
        'postalCode': postalCode,
        'state': state,
        'street': street,
      };
}

class Company {
  // Map<String, String> companyMap = {};

  /// constructor
  ///
  /// @param name     String
  /// @param id       String
  /// @param industry String
  const Company({
    this.name,
    this.id,
    this.industry,
  });
  final String? name;
  final String? id;
  final String? industry;

  /// put name
  ///
  /// @param name String
  /// @return company Company
  Company putName(String name) {
    return copyWith(name: name);
  }

  /// put company Id
  ///
  /// @param id String
  /// @return company Company
  Company putId(String id) {
    return copyWith(id: id);
  }

  /// put industry
  ///
  /// @param industry String
  /// @return company Company
  Company putIndustry(String industry) {
    return copyWith(industry: industry);
  }

  Company copyWith({
    String? name,
    String? id,
    String? industry,
  }) {
    return Company(
      name: name ?? this.name,
      id: id ?? this.id,
      industry: industry ?? this.industry,
    );
  }

  Map<String, dynamic> get companyMap => <String, dynamic>{
        'name': name,
        'id': id,
        'industry': industry,
      };
}
