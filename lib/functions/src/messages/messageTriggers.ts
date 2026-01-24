import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const db = admin.firestore();

export const onMessageCreated = functions.firestore
  .document("chats/{chatId}/messages/{messageId}")
  .onCreate(async (snap, context) => {
    const message = snap.data();
    const chatRef = db.collection("chats").doc(context.params.chatId);

    const isBuyer = message.senderId === message.buyerId;

    await chatRef.update({
      lastMessage: message.text,
      lastMessageAt: message.createdAt,
      lastSenderId: message.senderId,
      [`unreadCount.${isBuyer ? "agent" : "buyer"}`]:
        admin.firestore.FieldValue.increment(1),
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });
  });
