class Company {
  String rfc;
  String nameCompany;
  String email;
  String street;
  String numberExt;
  String suburb;
  String postalCode;
  String creationDate;
  String modified;
  String createdBy;
  String modifiedBy;
  String pathLogo;

  Company({
    this.rfc,
    this.nameCompany,
    this.email,
    this.street,
    this.numberExt,
    this.suburb,
    this.postalCode,
    this.creationDate,
    this.modified,
    this.createdBy,
    this.modifiedBy,
    this.pathLogo,
  });

  factory Company.fromDatabaseJson(Map<String, dynamic> data) => Company(
    rfc:data['rfc'],
    nameCompany : data['name_company'],
    email : data['email'],
    street : data['street'],
    numberExt : data['number_ext'],
    suburb : data['suburb'],
    postalCode : data['postal_code'],
    creationDate : data['creation_date'],
    modified : data['modified'],
    createdBy : data['created_by'],
    modifiedBy : data['modified_by'],
    pathLogo : data['pathLogo'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        "rfc": this.rfc,
        "nameCompany": this.nameCompany,
        "email": this.email,
        "street": this.street,
        "numberExt": this.numberExt,
        "suburb": this.suburb,
        "postalCode": this.postalCode,
        "creationDate": this.creationDate,
        "modified": this.modified,
        "createdBy": this.createdBy,
        "modifiedBy": this.modifiedBy,
        "pathLogo": this.pathLogo
      };
}




class Area{
  
}