.class Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;
.super Ljava/lang/Object;
.source "SyncEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/core/SyncEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LimboResolution"
.end annotation


# instance fields
.field private final key:Lcom/google/firebase/firestore/model/DocumentKey;

.field private receivedDocument:Z


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Z
    .locals 0

    .line 88
    iget-boolean p0, p0, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->receivedDocument:Z

    return p0
.end method

.method static synthetic access$002(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;Z)Z
    .locals 0

    .line 88
    iput-boolean p1, p0, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->receivedDocument:Z

    return p1
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;)Lcom/google/firebase/firestore/model/DocumentKey;
    .locals 0

    .line 88
    iget-object p0, p0, Lcom/google/firebase/firestore/core/SyncEngine$LimboResolution;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    return-object p0
.end method
