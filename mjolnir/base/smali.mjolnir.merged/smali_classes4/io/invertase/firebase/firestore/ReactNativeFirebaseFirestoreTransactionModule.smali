.class public Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;
.super Lio/invertase/firebase/common/ReactNativeFirebaseModule;
.source "ReactNativeFirebaseFirestoreTransactionModule.java"


# static fields
.field private static final SERVICE_NAME:Ljava/lang/String; = "FirestoreTransaction"


# instance fields
.field private transactionHandlers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 1

    const-string v0, "FirestoreTransaction"

    .line 44
    invoke-direct {p0, p1, v0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)V

    .line 40
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    return-void
.end method

.method static synthetic lambda$transactionBegin$2(Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;)V
    .locals 4

    .line 132
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "type"

    const-string v2, "update"

    .line 133
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;

    .line 140
    invoke-virtual {p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getAppName()Ljava/lang/String;

    move-result-object v2

    .line 141
    invoke-virtual {p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getTransactionId()I

    move-result p1

    const-string v3, "firestore_transaction_event"

    invoke-direct {v1, v3, v0, v2, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;I)V

    .line 136
    invoke-virtual {p0, v1}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->sendEvent(Lio/invertase/firebase/interfaces/NativeEvent;)V

    return-void
.end method

.method static synthetic lambda$transactionBegin$3(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/firebase/firestore/Transaction;)Ljava/lang/Void;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/firestore/FirebaseFirestoreException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->resetState(Lcom/google/firebase/firestore/Transaction;)V

    .line 130
    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1, p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda2;-><init>(Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    .line 145
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->await()V

    .line 149
    iget-boolean p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->aborted:Z

    if-nez p1, :cond_9

    .line 156
    iget-boolean p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->timeout:Z

    if-nez p1, :cond_8

    .line 162
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getCommandBuffer()Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p0

    const/4 p1, 0x0

    if-nez p0, :cond_0

    return-object p1

    .line 170
    :cond_0
    invoke-interface {p0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_7

    .line 173
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    .line 174
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/react/bridge/ReadableMap;

    const-string v5, "path"

    invoke-interface {v4, v5}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "type"

    .line 175
    invoke-interface {v3, v5}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 177
    invoke-static {p2, v4}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getDocumentForFirestore(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v4

    .line 179
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    const/4 v7, -0x1

    sparse-switch v6, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v6, "DELETE"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v7, 0x2

    goto :goto_1

    :sswitch_1
    const-string v6, "SET"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v7, 0x1

    goto :goto_1

    :sswitch_2
    const-string v6, "UPDATE"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_1

    :cond_3
    move v7, v1

    :goto_1
    const-string v5, "data"

    packed-switch v7, :pswitch_data_0

    goto :goto_3

    .line 207
    :pswitch_0
    invoke-virtual {p3, v4}, Lcom/google/firebase/firestore/Transaction;->delete(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/Transaction;

    goto :goto_3

    .line 181
    :pswitch_1
    invoke-interface {v3, v5}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v5

    invoke-static {p2, v5}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;

    move-result-object v5

    const-string v6, "options"

    .line 182
    invoke-interface {v3, v6}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    .line 184
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/facebook/react/bridge/ReadableMap;

    const-string v7, "merge"

    invoke-interface {v6, v7}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 185
    invoke-interface {v3, v7}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 186
    invoke-static {}, Lcom/google/firebase/firestore/SetOptions;->merge()Lcom/google/firebase/firestore/SetOptions;

    move-result-object v3

    invoke-virtual {p3, v4, v5, v3}, Lcom/google/firebase/firestore/Transaction;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/firebase/firestore/Transaction;

    goto :goto_3

    :cond_4
    const-string v6, "mergeFields"

    .line 187
    invoke-interface {v3, v6}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 188
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 189
    invoke-interface {v3, v6}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v3

    .line 191
    invoke-static {v3}, Lio/invertase/firebase/common/RCTConvertFirebase;->toArrayList(Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 192
    check-cast v6, Ljava/lang/String;

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 196
    :cond_5
    invoke-static {v7}, Lcom/google/firebase/firestore/SetOptions;->mergeFields(Ljava/util/List;)Lcom/google/firebase/firestore/SetOptions;

    move-result-object v3

    .line 195
    invoke-virtual {p3, v4, v5, v3}, Lcom/google/firebase/firestore/Transaction;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/firebase/firestore/Transaction;

    goto :goto_3

    .line 198
    :cond_6
    invoke-virtual {p3, v4, v5}, Lcom/google/firebase/firestore/Transaction;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;)Lcom/google/firebase/firestore/Transaction;

    goto :goto_3

    .line 203
    :pswitch_2
    invoke-interface {v3, v5}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    invoke-static {p2, v3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->parseReadableMap(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/facebook/react/bridge/ReadableMap;)Ljava/util/Map;

    move-result-object v3

    .line 204
    invoke-virtual {p3, v4, v3}, Lcom/google/firebase/firestore/Transaction;->update(Lcom/google/firebase/firestore/DocumentReference;Ljava/util/Map;)Lcom/google/firebase/firestore/Transaction;

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_7
    return-object p1

    .line 157
    :cond_8
    new-instance p0, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string p1, "timeout"

    sget-object p2, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    throw p0

    .line 150
    :cond_9
    new-instance p0, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string p1, "abort"

    sget-object p2, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->ABORTED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    throw p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x6a6cd337 -> :sswitch_2
        0x14042 -> :sswitch_1
        0x77f979ab -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic lambda$transactionBegin$4(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;Lcom/google/android/gms/tasks/Task;)V
    .locals 6

    .line 216
    iget-boolean v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->aborted:Z

    if-eqz v0, :cond_0

    return-void

    .line 220
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 222
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v1

    const-string v2, "firestore_transaction_event"

    const-string v3, "type"

    if-eqz v1, :cond_1

    const-string p2, "complete"

    .line 223
    invoke-interface {v0, v3, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;

    .line 229
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getAppName()Ljava/lang/String;

    move-result-object v1

    .line 230
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getTransactionId()I

    move-result p0

    invoke-direct {p2, v2, v0, v1, p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;I)V

    .line 225
    invoke-virtual {p1, p2}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->sendEvent(Lio/invertase/firebase/interfaces/NativeEvent;)V

    goto :goto_0

    :cond_1
    const-string v1, "error"

    .line 232
    invoke-interface {v0, v3, v1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    .line 235
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v3

    .line 237
    new-instance v4, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;

    move-object v5, p2

    check-cast v5, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    .line 239
    invoke-virtual {p2}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    invoke-direct {v4, v5, p2}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreException;Ljava/lang/Throwable;)V

    const-string p2, "code"

    .line 240
    invoke-virtual {v4}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->getCode()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, p2, v5}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "message"

    .line 241
    invoke-virtual {v4}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, p2, v4}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    invoke-interface {v0, v1, v3}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 245
    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;

    .line 249
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getAppName()Ljava/lang/String;

    move-result-object v1

    .line 250
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getTransactionId()I

    move-result p0

    invoke-direct {p2, v2, v0, v1, p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;-><init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;I)V

    .line 245
    invoke-virtual {p1, p2}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->sendEvent(Lio/invertase/firebase/interfaces/NativeEvent;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$transactionGetDocument$0(Ljava/lang/String;Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lcom/google/firebase/firestore/DocumentReference;)Lcom/facebook/react/bridge/WritableMap;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    invoke-virtual {p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->getDocument(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/DocumentSnapshot;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreSerialize;->snapshotToWritableMap(Ljava/lang/String;Lcom/google/firebase/firestore/DocumentSnapshot;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$transactionGetDocument$1(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 85
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 88
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p0, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->rejectPromiseWithExceptionMap(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onCatalystInstanceDestroy()V
    .locals 4

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 49
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 50
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    iget-object v3, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 52
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    if-eqz v2, :cond_0

    .line 55
    invoke-virtual {v2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->abort()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 59
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 60
    invoke-super {p0}, Lio/invertase/firebase/common/ReactNativeFirebaseModule;->onCatalystInstanceDestroy()V

    return-void
.end method

.method public transactionApplyBuffer(Ljava/lang/String;ILcom/facebook/react/bridge/ReadableArray;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 107
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    if-eqz p1, :cond_0

    .line 110
    invoke-virtual {p1, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->signalBufferReceived(Lcom/facebook/react/bridge/ReadableArray;)V

    :cond_0
    return-void
.end method

.method public transactionBegin(Ljava/lang/String;I)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 116
    new-instance v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    invoke-direct {v0, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;-><init>(Ljava/lang/String;I)V

    iget-object v1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 118
    invoke-virtual {v1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 120
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    .line 121
    invoke-static {}, Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;->getSharedInstance()Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;

    move-result-object p2

    .line 124
    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, p2, p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda0;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;Lcom/google/firebase/firestore/FirebaseFirestore;)V

    .line 125
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->runTransaction(Lcom/google/firebase/firestore/Transaction$Function;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;

    invoke-direct {v1, v0, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda1;-><init>(Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lio/invertase/firebase/common/ReactNativeFirebaseEventEmitter;)V

    .line 214
    invoke-virtual {p1, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public transactionDispose(Ljava/lang/String;I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 96
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    if-eqz p1, :cond_0

    .line 99
    invoke-virtual {p1}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;->abort()V

    iget-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 100
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->delete(I)V

    :cond_0
    return-void
.end method

.method public transactionGetDocument(Ljava/lang/String;ILjava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->transactionHandlers:Landroid/util/SparseArray;

    .line 67
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;

    if-nez p2, :cond_0

    const-string p1, "internal-error"

    const-string p2, "An internal error occurred whilst attempting to find a native transaction by id."

    .line 70
    invoke-static {p4, p1, p2}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->rejectPromiseWithCodeAndMessage(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 77
    :cond_0
    invoke-static {p1}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getFirestoreForApp(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    .line 78
    invoke-static {v0, p3}, Lio/invertase/firebase/firestore/UniversalFirebaseFirestoreCommon;->getDocumentForFirestore(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p3

    .line 81
    invoke-virtual {p0}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule;->getTransactionalExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p2, p3}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionHandler;Lcom/google/firebase/firestore/DocumentReference;)V

    .line 80
    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda4;

    invoke-direct {p2, p4}, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreTransactionModule$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/react/bridge/Promise;)V

    .line 83
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
