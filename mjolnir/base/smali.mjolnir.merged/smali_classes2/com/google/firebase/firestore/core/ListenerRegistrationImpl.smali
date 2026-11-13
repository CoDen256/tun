.class public Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;
.super Ljava/lang/Object;
.source "ListenerRegistrationImpl.java"

# interfaces
.implements Lcom/google/firebase/firestore/ListenerRegistration;


# instance fields
.field private final asyncEventListener:Lcom/google/firebase/firestore/core/AsyncEventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/core/AsyncEventListener<",
            "Lcom/google/firebase/firestore/core/ViewSnapshot;",
            ">;"
        }
    .end annotation
.end field

.field private final client:Lcom/google/firebase/firestore/core/FirestoreClient;

.field private final queryListener:Lcom/google/firebase/firestore/core/QueryListener;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/core/FirestoreClient;Lcom/google/firebase/firestore/core/QueryListener;Lcom/google/firebase/firestore/core/AsyncEventListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/core/FirestoreClient;",
            "Lcom/google/firebase/firestore/core/QueryListener;",
            "Lcom/google/firebase/firestore/core/AsyncEventListener<",
            "Lcom/google/firebase/firestore/core/ViewSnapshot;",
            ">;)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;->client:Lcom/google/firebase/firestore/core/FirestoreClient;

    iput-object p2, p0, Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;->queryListener:Lcom/google/firebase/firestore/core/QueryListener;

    iput-object p3, p0, Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;->asyncEventListener:Lcom/google/firebase/firestore/core/AsyncEventListener;

    return-void
.end method


# virtual methods
.method public remove()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;->asyncEventListener:Lcom/google/firebase/firestore/core/AsyncEventListener;

    .line 41
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/AsyncEventListener;->mute()V

    iget-object v0, p0, Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;->client:Lcom/google/firebase/firestore/core/FirestoreClient;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/ListenerRegistrationImpl;->queryListener:Lcom/google/firebase/firestore/core/QueryListener;

    .line 42
    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FirestoreClient;->stopListening(Lcom/google/firebase/firestore/core/QueryListener;)V

    return-void
.end method
