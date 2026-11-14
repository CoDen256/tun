.class public Lcom/google/firebase/firestore/bundle/BundledQuery;
.super Ljava/lang/Object;
.source "BundledQuery.java"

# interfaces
.implements Lcom/google/firebase/firestore/bundle/BundleElement;


# instance fields
.field private final limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

.field private final target:Lcom/google/firebase/firestore/core/Target;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/core/Target;Lcom/google/firebase/firestore/core/Query$LimitType;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->target:Lcom/google/firebase/firestore/core/Target;

    iput-object p2, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 48
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/bundle/BundledQuery;

    iget-object v2, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->target:Lcom/google/firebase/firestore/core/Target;

    .line 50
    iget-object v3, p1, Lcom/google/firebase/firestore/bundle/BundledQuery;->target:Lcom/google/firebase/firestore/core/Target;

    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/core/Target;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    :cond_2
    iget-object v2, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    .line 51
    iget-object p1, p1, Lcom/google/firebase/firestore/bundle/BundledQuery;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    if-ne v2, p1, :cond_3

    goto :goto_0

    :cond_3
    move v0, v1

    :goto_0
    return v0

    :cond_4
    :goto_1
    return v1
.end method

.method public getLimitType()Lcom/google/firebase/firestore/core/Query$LimitType;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    return-object v0
.end method

.method public getTarget()Lcom/google/firebase/firestore/core/Target;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->target:Lcom/google/firebase/firestore/core/Target;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->target:Lcom/google/firebase/firestore/core/Target;

    .line 56
    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/Target;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/BundledQuery;->limitType:Lcom/google/firebase/firestore/core/Query$LimitType;

    .line 57
    invoke-virtual {v1}, Lcom/google/firebase/firestore/core/Query$LimitType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
