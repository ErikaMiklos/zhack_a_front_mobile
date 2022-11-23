class FestivalsModel {
  FestivalsModel({
    required this.datasetid,
    required this.recordid,
    required this.fields,
    required this.geometry,
    required this.recordTimestamp,
  });
  late final String datasetid;
  late final String recordid;
  late final Fields fields;
  late final Geometry geometry;
  late final String recordTimestamp;

  FestivalsModel.fromJson(Map<String, dynamic> json){
    datasetid = json['datasetid'];
    recordid = json['recordid'];
    fields = Fields.fromJson(json['fields']);
    geometry = Geometry.fromJson(json['geometry']);
    recordTimestamp = json['record_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['datasetid'] = datasetid;
    _data['recordid'] = recordid;
    _data['fields'] = fields.toJson();
    _data['geometry'] = geometry.toJson();
    _data['record_timestamp'] = recordTimestamp;
    return _data;
  }
}

class Fields {
  Fields({
    required this.geolocalisation,
    required this.nomDuFestival,
    required this.codePostalDeLaCommunePrincipaleDeDeroulement,
    required this.libelleEpciCollageEnValeur,
    required this.codeInseeCommune,
    required this.decennieDeCreationDuFestival,
    required this.regionPrincipaleDeDeroulement,
    required this.anneeDeCreationDuFestival,
    required this.departementPrincipalDeDeroulement,
    required this.communePrincipaleDeDeroulement,
    required this.codeInseeEpciCollageEnValeur,
    required this.disciplineDominante,
    required this.periodePrincipaleDeDeroulementDuFestival,
    required this.identifiant,
    required this.siteInternetDuFestival,
  });
  late final List<double> geolocalisation;
  late final String nomDuFestival;
  late final String codePostalDeLaCommunePrincipaleDeDeroulement;
  late final String libelleEpciCollageEnValeur;
  late final String codeInseeCommune;
  late final String decennieDeCreationDuFestival;
  late final String regionPrincipaleDeDeroulement;
  late final String anneeDeCreationDuFestival;
  late final String departementPrincipalDeDeroulement;
  late final String communePrincipaleDeDeroulement;
  late final String codeInseeEpciCollageEnValeur;
  late final String disciplineDominante;
  late final String periodePrincipaleDeDeroulementDuFestival;
  late final String identifiant;
  late final String siteInternetDuFestival;

  Fields.fromJson(Map<String, dynamic> json){
    geolocalisation = List.castFrom<dynamic, double>(json['geolocalisation']);
    nomDuFestival = json['nom_du_festival'];
    codePostalDeLaCommunePrincipaleDeDeroulement = json['code_postal_de_la_commune_principale_de_deroulement'];
    libelleEpciCollageEnValeur = json['libelle_epci_collage_en_valeur'];
    codeInseeCommune = json['code_insee_commune'];
    decennieDeCreationDuFestival = json['decennie_de_creation_du_festival'];
    regionPrincipaleDeDeroulement = json['region_principale_de_deroulement'];
    anneeDeCreationDuFestival = json['annee_de_creation_du_festival'];
    departementPrincipalDeDeroulement = json['departement_principal_de_deroulement'];
    communePrincipaleDeDeroulement = json['commune_principale_de_deroulement'];
    codeInseeEpciCollageEnValeur = json['code_insee_epci_collage_en_valeur'];
    disciplineDominante = json['discipline_dominante'];
    periodePrincipaleDeDeroulementDuFestival = json['periode_principale_de_deroulement_du_festival'];
    identifiant = json['identifiant'];
    siteInternetDuFestival = json['site_internet_du_festival'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['geolocalisation'] = geolocalisation;
    _data['nom_du_festival'] = nomDuFestival;
    _data['code_postal_de_la_commune_principale_de_deroulement'] = codePostalDeLaCommunePrincipaleDeDeroulement;
    _data['libelle_epci_collage_en_valeur'] = libelleEpciCollageEnValeur;
    _data['code_insee_commune'] = codeInseeCommune;
    _data['decennie_de_creation_du_festival'] = decennieDeCreationDuFestival;
    _data['region_principale_de_deroulement'] = regionPrincipaleDeDeroulement;
    _data['annee_de_creation_du_festival'] = anneeDeCreationDuFestival;
    _data['departement_principal_de_deroulement'] = departementPrincipalDeDeroulement;
    _data['commune_principale_de_deroulement'] = communePrincipaleDeDeroulement;
    _data['code_insee_epci_collage_en_valeur'] = codeInseeEpciCollageEnValeur;
    _data['discipline_dominante'] = disciplineDominante;
    _data['periode_principale_de_deroulement_du_festival'] = periodePrincipaleDeDeroulementDuFestival;
    _data['identifiant'] = identifiant;
    _data['site_internet_du_festival'] = siteInternetDuFestival;
    return _data;
  }
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });
  late final String type;
  late final List<double> coordinates;

  Geometry.fromJson(Map<String, dynamic> json){
    type = json['type'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}