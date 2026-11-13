.class public final synthetic Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lcom/google/firebase/firestore/DocumentSnapshot;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda14;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda14;->f$1:Lcom/google/firebase/firestore/DocumentSnapshot;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda14;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule$$ExternalSyntheticLambda14;->f$1:Lcom/google/firebase/firestore/DocumentSnapshot;

    invoke-static {v0, v1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreDocumentModule;->lambda$sendOnSnapshotEvent$13(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    return-object v0
.end method
