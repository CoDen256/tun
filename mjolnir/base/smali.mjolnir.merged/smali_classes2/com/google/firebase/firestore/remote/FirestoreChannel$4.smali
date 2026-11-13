.class Lcom/google/firebase/firestore/remote/FirestoreChannel$4;
.super Lio/grpc/ClientCall$Listener;
.source "FirestoreChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/firestore/remote/FirestoreChannel;->lambda$runRpc$2$com-google-firebase-firestore-remote-FirestoreChannel(Lcom/google/android/gms/tasks/TaskCompletionSource;Ljava/lang/Object;Lcom/google/android/gms/tasks/Task;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/grpc/ClientCall$Listener<",
        "TRespT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/remote/FirestoreChannel;

.field final synthetic val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/remote/FirestoreChannel;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->this$0:Lcom/google/firebase/firestore/remote/FirestoreChannel;

    iput-object p2, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 240
    invoke-direct {p0}, Lio/grpc/ClientCall$Listener;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lio/grpc/Status;Lio/grpc/Metadata;)V
    .locals 2

    .line 249
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 250
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 251
    new-instance p2, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string v0, "Received onClose with status OK, but no message."

    sget-object v1, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->INTERNAL:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {p2, v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->this$0:Lcom/google/firebase/firestore/remote/FirestoreChannel;

    .line 257
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/remote/FirestoreChannel;->access$100(Lcom/google/firebase/firestore/remote/FirestoreChannel;Lio/grpc/Status;)Lcom/google/firebase/firestore/FirebaseFirestoreException;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onMessage(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRespT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/FirestoreChannel$4;->val$tcs:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 244
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method
