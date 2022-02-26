import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/partner.dart';

class PartnersTable {
  final CollectionReference partnersRef =
      FirebaseFirestore.instance.collection("partners").withConverter<Partner>(
            fromFirestore: (snapshot, _) => Partner.fromJson(snapshot.data()!),
            toFirestore: (partner, _) => partner.toJson(),
          );

  Future<bool> isPartnerExist(id) async {
    return await partnersRef
        .doc(id)
        .get()
        .then((value) => (value.exists) ? true : false);
  }

  Future<Partner> getPartner({required String partnerID}) async {
    final Partner partner =
        (await partnersRef.doc(partnerID).get()).data()! as Partner;

    return partner;
  }

  Future<List<Partner>> getPartnersByIds(
      {required List<dynamic> partnerIDs}) async {
    final partners = partnerIDs
        .map((partnerID) async => await getPartner(partnerID: partnerID));

    return Future.wait(partners);
  }

  Future<List<Partner>> getPartners(
      {int limit = 50,}) async {
    final List<Partner> operators = (await partnersRef.limit(limit).get())
            .docs
            .map((document) => document.data() as Partner)
            .toList();

    return operators;
  }

  Future<List<Partner>> getNextPartners({required DocumentSnapshot documentSnapshot,int limit = 50}) async {
    final List<Partner> operators = (await partnersRef.limit(limit).startAfterDocument(
        documentSnapshot).get())
        .docs
        .map((document) => document.data() as Partner)
        .toList();

    return operators;
  }

  Future<DocumentSnapshot> getPartnerDocumentByID({required String partnerID}) async{
    return partnersRef.doc(partnerID).get();
  }

  Future<bool> addPartner(
      {required Partner partner, required String partnerID}) {
    return partnersRef
        .doc(partnerID)
        .set(partner)
        .then((value) => true)
        .catchError((error) => print("Failed to add partner: $error"));
  }
}
