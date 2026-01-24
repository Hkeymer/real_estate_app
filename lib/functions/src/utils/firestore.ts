import * as admin from "firebase-admin";

const db = admin.firestore();

/* =====================================
   TIMESTAMPS
===================================== */
export const serverTimestamp = admin.firestore.FieldValue.serverTimestamp;

/* =====================================
   REFERENCIAS
===================================== */
export const usersRef = () => db.collection("users");
export const propertiesRef = () => db.collection("properties");
export const chatsRef = () => db.collection("chats");
export const reviewsRef = () => db.collection("reviews");

/* =====================================
   VALIDACIONES
===================================== */
export function assertRequired<T>(
  value: T | undefined | null,
  fieldName: string
): asserts value is T {
  if (value === undefined || value === null) {
    throw new Error(`Missing required field: ${fieldName}`);
  }
}

/* =====================================
   CONTADORES ATÓMICOS
===================================== */
export const increment = (value = 1) =>
  admin.firestore.FieldValue.increment(value);

export const decrement = (value = 1) =>
  admin.firestore.FieldValue.increment(-value);

/* =====================================
   HELPERS DE USUARIO
===================================== */
export async function userExists(userId: string): Promise<boolean> {
  const doc = await usersRef().doc(userId).get();
  return doc.exists;
}

/* =====================================
   HELPERS DE PROPIEDAD
===================================== */
export async function propertyExists(propertyId: string): Promise<boolean> {
  const doc = await propertiesRef().doc(propertyId).get();
  return doc.exists;
}

/* =====================================
   HELPERS DE CHAT
===================================== */
export async function findExistingChat(
  buyerId: string,
  agentId: string,
  propertyId: string
) {
  const snapshot = await chatsRef()
    .where("buyerId", "==", buyerId)
    .where("agentId", "==", agentId)
    .where("propertyId", "==", propertyId)
    .limit(1)
    .get();

  return snapshot.empty ? null : snapshot.docs[0];
}

/* =====================================
   HELPERS DE REVIEWS
===================================== */
export async function userAlreadyReviewed(
  userId: string,
  propertyId: string
): Promise<boolean> {
  const snapshot = await reviewsRef()
    .where("userId", "==", userId)
    .where("propertyId", "==", propertyId)
    .limit(1)
    .get();

  return !snapshot.empty;
}
