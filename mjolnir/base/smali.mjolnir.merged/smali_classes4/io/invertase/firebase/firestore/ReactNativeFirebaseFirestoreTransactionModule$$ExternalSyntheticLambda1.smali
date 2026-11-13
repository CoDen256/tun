.class public final synthetic Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

.field public final synthetic f$1:Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;


# direct methods
.method public synthetic constructor <init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;->f$0:Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    iput-object p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;->f$1:Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;->f$0:Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;->f$1:Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    invoke-static {v0, v1, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->lambda$transactionBegin$4(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
