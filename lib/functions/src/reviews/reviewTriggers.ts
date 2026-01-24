import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const db = admin.firestore();

export const onReviewCreated = functions.firestore
  .document("reviews/{reviewId}")
  .onCreate(async (snap) => {
    const review = snap.data();
    const propertyRef = db.collection("properties").doc(review.propertyId);

    await db.runTransaction(async (tx) => {
      const propertySnap = await tx.get(propertyRef);
      if (!propertySnap.exists) return;

      const stats = propertySnap.data()!.stats || {};

      const newCount = (stats.reviewsCount || 0) + 1;
      const newAverage =
        ((stats.ratingAverage || 0) * (newCount - 1) + review.rating) /
        newCount;

      tx.update(propertyRef, {
        "stats.reviewsCount": newCount,
        "stats.ratingAverage": Number(newAverage.toFixed(1)),
      });
    });
  });
