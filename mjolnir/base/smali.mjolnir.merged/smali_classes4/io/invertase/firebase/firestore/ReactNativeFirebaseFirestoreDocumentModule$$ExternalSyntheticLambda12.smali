.class public final synthetic Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/firestore/FirebaseFirestore;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestore;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda12;->f$0:Lcom/google/firebase/firestore/FirebaseFirestore;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda12;->f$0:Lcom/google/firebase/firestore/FirebaseFirestore;

    invoke-static {v0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;->lambda$documentBatch$11(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
