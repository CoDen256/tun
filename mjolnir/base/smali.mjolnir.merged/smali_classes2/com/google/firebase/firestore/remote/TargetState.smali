.class final Lcom/google/firebase/firestore/remote/TargetState;
.super Ljava/lang/Object;
.source "TargetState.java"


# instance fields
.field private current:Z

.field private final documentChanges:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            "Lcom/google/firebase/firestore/core/DocumentViewChange$Type;",
            ">;"
        }
    .end annotation
.end field

.field private hasChanges:Z

.field private outstandingResponses:I

.field private resumeToken:Lcom/google/protobuf/ByteString;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->outstandingResponses:I

    .line 40
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/google/firebase/firestore/remote/TargetState;->documentChanges:Ljava/util/Map;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    .line 49
    sget-object v1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v1, p0, Lcom/google/firebase/firestore/remote/TargetState;->resumeToken:Lcom/google/protobuf/ByteString;

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->current:Z

    return-void
.end method


# virtual methods
.method addDocumentChange(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/core/DocumentViewChange$Type;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->documentChanges:Ljava/util/Map;

    .line 125
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method clearChanges()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->documentChanges:Ljava/util/Map;

    .line 120
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method hasChanges()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    return v0
.end method

.method isCurrent()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->current:Z

    return v0
.end method

.method isPending()Z
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->outstandingResponses:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method markCurrent()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->current:Z

    return-void
.end method

.method recordPendingTargetRequest()V
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->outstandingResponses:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->outstandingResponses:I

    return-void
.end method

.method recordTargetResponse()V
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->outstandingResponses:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->outstandingResponses:I

    return-void
.end method

.method removeDocumentChange(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    iget-object v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->documentChanges:Ljava/util/Map;

    .line 130
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method toTargetChange()Lcom/google/firebase/firestore/remote/TargetChange;
    .locals 10

    .line 91
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    .line 92
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v1

    .line 93
    invoke-static {}, Lcom/google/firebase/firestore/model/DocumentKey;->emptyKeySet()Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/firestore/remote/TargetState;->documentChanges:Ljava/util/Map;

    .line 95
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v7, v0

    move-object v8, v1

    move-object v9, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 96
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/DocumentKey;

    .line 97
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 98
    sget-object v2, Lcom/google/firebase/firestore/remote/TargetState$1;->$SwitchMap$com$google$firebase$firestore$core$DocumentViewChange$Type:[I

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->ordinal()I

    move-result v4

    aget v2, v2, v4

    const/4 v4, 0x1

    if-eq v2, v4, :cond_2

    const/4 v5, 0x2

    if-eq v2, v5, :cond_1

    const/4 v5, 0x3

    if-ne v2, v5, :cond_0

    .line 106
    invoke-virtual {v9, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    move-object v9, v0

    goto :goto_0

    :cond_0
    new-array v1, v4, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "Encountered invalid change type: %s"

    .line 109
    invoke-static {v0, v1}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 103
    :cond_1
    invoke-virtual {v8, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    move-object v8, v0

    goto :goto_0

    .line 100
    :cond_2
    invoke-virtual {v7, v1}, Lcom/google/firebase/database/collection/ImmutableSortedSet;->insert(Ljava/lang/Object;)Lcom/google/firebase/database/collection/ImmutableSortedSet;

    move-result-object v0

    move-object v7, v0

    goto :goto_0

    .line 113
    :cond_3
    new-instance v0, Lcom/google/firebase/firestore/remote/TargetChange;

    iget-object v5, p0, Lcom/google/firebase/firestore/remote/TargetState;->resumeToken:Lcom/google/protobuf/ByteString;

    iget-boolean v6, p0, Lcom/google/firebase/firestore/remote/TargetState;->current:Z

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Lcom/google/firebase/firestore/remote/TargetChange;-><init>(Lcom/google/protobuf/ByteString;ZLcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/database/collection/ImmutableSortedSet;Lcom/google/firebase/database/collection/ImmutableSortedSet;)V

    return-object v0
.end method

.method updateResumeToken(Lcom/google/protobuf/ByteString;)V
    .locals 1

    .line 79
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/firestore/remote/TargetState;->hasChanges:Z

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/TargetState;->resumeToken:Lcom/google/protobuf/ByteString;

    :cond_0
    return-void
.end method
