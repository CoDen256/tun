.class Lcom/google/firebase/firestore/remote/Datastore$1;
.super Lcom/google/firebase/firestore/remote/FirestoreChannel$StreamingListener;
.source "Datastore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/firestore/remote/Datastore;->lookup(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/firebase/firestore/remote/FirestoreChannel$StreamingListener<",
        "Lcom/google/firestore/v1/BatchGetDocumentsResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/firestore/remote/Datastore;

.field final synthetic val$completionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

.field final synthetic val$keys:Ljava/util/List;

.field final synthetic val$responses:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/remote/Datastore;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->this$0:Lcom/google/firebase/firestore/remote/Datastore;

    iput-object p2, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$responses:Ljava/util/List;

    iput-object p3, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$keys:Ljava/util/List;

    iput-object p4, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$completionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 190
    invoke-direct {p0}, Lcom/google/firebase/firestore/remote/FirestoreChannel$StreamingListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lio/grpc/Status;)V
    .locals 2

    .line 210
    invoke-virtual {p1}, Lio/grpc/Status;->isOk()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$completionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 211
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    goto :goto_0

    .line 213
    :cond_0
    invoke-static {p1}, Lcom/google/firebase/firestore/util/Util;->exceptionFromStatus(Lio/grpc/Status;)Lcom/google/firebase/firestore/FirebaseFirestoreException;

    move-result-object p1

    .line 214
    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getCode()Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    move-result-object v0

    sget-object v1, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->UNAUTHENTICATED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->this$0:Lcom/google/firebase/firestore/remote/Datastore;

    .line 215
    invoke-static {v0}, Lcom/google/firebase/firestore/remote/Datastore;->access$100(Lcom/google/firebase/firestore/remote/Datastore;)Lcom/google/firebase/firestore/remote/FirestoreChannel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/remote/FirestoreChannel;->invalidateToken()V

    :cond_1
    iget-object v0, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$completionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 217
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetException(Ljava/lang/Exception;)Z

    :goto_0
    return-void
.end method

.method public onMessage(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$responses:Ljava/util/List;

    .line 193
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$responses:Ljava/util/List;

    .line 194
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$keys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne p1, v0, :cond_2

    .line 195
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$responses:Ljava/util/List;

    .line 196
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    iget-object v2, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->this$0:Lcom/google/firebase/firestore/remote/Datastore;

    .line 197
    invoke-static {v2}, Lcom/google/firebase/firestore/remote/Datastore;->access$000(Lcom/google/firebase/firestore/remote/Datastore;)Lcom/google/firebase/firestore/remote/RemoteSerializer;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/google/firebase/firestore/remote/RemoteSerializer;->decodeMaybeDocument(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object v1

    .line 198
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/MutableDocument;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v2

    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 200
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$keys:Ljava/util/List;

    .line 201
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 202
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/MutableDocument;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/google/firebase/firestore/remote/Datastore$1;->val$completionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 204
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method public bridge synthetic onMessage(Ljava/lang/Object;)V
    .locals 0

    .line 190
    check-cast p1, Lcom/google/firestore/v1/BatchGetDocumentsResponse;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/remote/Datastore$1;->onMessage(Lcom/google/firestore/v1/BatchGetDocumentsResponse;)V

    return-void
.end method
