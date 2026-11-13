.class public final synthetic Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/firestore/EventListener;


# instance fields
.field public final synthetic f$0:Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;->f$0:Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;

    iput p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;->f$1:I

    iput-object p3, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onEvent(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 3

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;->f$0:Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;

    iget v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;->f$1:I

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    check-cast p1, Lcom/google/firebase/firestore/DocumentSnapshot;

    invoke-static {v0, v1, v2, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;->$r8$lambda$UnKE4Xs-EMmvO3N2seKZv1wdQu4(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;ILjava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    return-void
.end method
