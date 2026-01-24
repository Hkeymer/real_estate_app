import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const db = admin.firestore();
export const preventDuplicateChats = functions.firestore
  .document("chats/{chatId}")
  .onCreate(async (snap, context) => {
    const chat = snap.data();

    const existing = await db
      .collection("chats")
      .where("propertyId", "==", chat.propertyId)
      .where("buyerId", "==", chat.buyerId)
      .get();

    if (existing.size > 1) {
      await snap.ref.delete();
      throw new functions.https.HttpsError(
        "already-exists",
        "Chat already exists for this property"
      );
    }
  });
