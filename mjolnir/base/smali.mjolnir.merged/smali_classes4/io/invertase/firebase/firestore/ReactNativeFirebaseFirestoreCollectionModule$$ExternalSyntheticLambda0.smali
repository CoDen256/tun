.class public final synthetic Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lcom/google/firebase/firestore/QuerySnapshot;

.field public final synthetic f$2:Lcom/google/firebase/firestore/MetadataChanges;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;->f$1:Lcom/google/firebase/firestore/QuerySnapshot;

    iput-object p3, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;->f$2:Lcom/google/firebase/firestore/MetadataChanges;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;->f$1:Lcom/google/firebase/firestore/QuerySnapshot;

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule$$ExternalSyntheticLambda0;->f$2:Lcom/google/firebase/firestore/MetadataChanges;

    invoke-static {v0, v1, v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreCollectionModule;->lambda$sendOnSnapshotEvent$5(Ljava/lang/String;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/MetadataChanges;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    return-object v0
.end method
