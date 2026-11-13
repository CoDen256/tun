.class public Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;
.super Ljava/lang/Object;
.source "LruGarbageCollector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/local/LruGarbageCollector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Results"
.end annotation


# instance fields
.field private final documentsRemoved:I

.field private final hasRun:Z

.field private final sequenceNumbersCollected:I

.field private final targetsRemoved:I


# direct methods
.method constructor <init>(ZIII)V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->hasRun:Z

    iput p2, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->sequenceNumbersCollected:I

    iput p3, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->targetsRemoved:I

    iput p4, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->documentsRemoved:I

    return-void
.end method

.method static DidNotRun()Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;
    .locals 2

    .line 82
    new-instance v0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;-><init>(ZIII)V

    return-object v0
.end method


# virtual methods
.method public getDocumentsRemoved()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->documentsRemoved:I

    return v0
.end method

.method public getSequenceNumbersCollected()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->sequenceNumbersCollected:I

    return v0
.end method

.method public getTargetsRemoved()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->targetsRemoved:I

    return v0
.end method

.method public hasRun()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$Results;->hasRun:Z

    return v0
.end method
