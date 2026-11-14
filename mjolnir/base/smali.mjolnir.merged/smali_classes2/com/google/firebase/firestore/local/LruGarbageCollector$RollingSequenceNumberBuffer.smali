.class Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;
.super Ljava/lang/Object;
.source "LruGarbageCollector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/local/LruGarbageCollector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RollingSequenceNumberBuffer"
.end annotation


# static fields
.field private static final COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final maxElements:I

.field private final queue:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 178
    new-instance v0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(I)V
    .locals 2

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->maxElements:I

    .line 184
    new-instance v0, Ljava/util/PriorityQueue;

    sget-object v1, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->COMPARATOR:Ljava/util/Comparator;

    invoke-direct {v0, p1, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Long;Ljava/lang/Long;)I
    .locals 0

    .line 178
    invoke-virtual {p1, p0}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result p0

    return p0
.end method


# virtual methods
.method addElement(Ljava/lang/Long;)V
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    .line 188
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->size()I

    move-result v0

    iget v1, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->maxElements:I

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    .line 189
    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    .line 191
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 192
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v0, v1, v3

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    .line 193
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    .line 194
    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method getMaxValue()J
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/local/LruGarbageCollector$RollingSequenceNumberBuffer;->queue:Ljava/util/PriorityQueue;

    .line 200
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method
