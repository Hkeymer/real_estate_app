import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const db = admin.firestore();
export const incrementPropertyView = functions.https.onCall(
  async ({ propertyId }) => {
    const ref = db.collection("properties").doc(propertyId);

    await ref.update({
      "stats.views": admin.firestore.FieldValue.increment(1),
    });

    return { success: true };
  }
);
