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

  Future<List<Partner>> getPartners({required List<dynamic> partnerIDs}) async {
    final partners = partnerIDs.map((partnerID) async => await getPartner(partnerID: partnerID));

    return Future.wait(partners);
  }
}
