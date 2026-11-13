.class public Lcom/google/firebase/firestore/bundle/NamedQuery;
.super Ljava/lang/Object;
.source "NamedQuery.java"

# interfaces
.implements Lcom/google/firebase/firestore/bundle/BundleElement;


# instance fields
.field private final bundledQuery:Lcom/google/firebase/firestore/bundle/BundledQuery;

.field private final name:Ljava/lang/String;

.field private final readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/firebase/firestore/bundle/BundledQuery;Lcom/google/firebase/firestore/model/SnapshotVersion;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->bundledQuery:Lcom/google/firebase/firestore/bundle/BundledQuery;

    iput-object p3, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_4

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 51
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/bundle/NamedQuery;

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->name:Ljava/lang/String;

    .line 53
    iget-object v2, p1, Lcom/google/firebase/firestore/bundle/NamedQuery;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v0

    :cond_2
    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->bundledQuery:Lcom/google/firebase/firestore/bundle/BundledQuery;

    .line 54
    iget-object v2, p1, Lcom/google/firebase/firestore/bundle/NamedQuery;->bundledQuery:Lcom/google/firebase/firestore/bundle/BundledQuery;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/bundle/BundledQuery;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    :cond_3
    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 55
    iget-object p1, p1, Lcom/google/firebase/firestore/bundle/NamedQuery;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/SnapshotVersion;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_4
    :goto_0
    return v0
.end method

.method public getBundledQuery()Lcom/google/firebase/firestore/bundle/BundledQuery;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->bundledQuery:Lcom/google/firebase/firestore/bundle/BundledQuery;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->name:Ljava/lang/String;

    .line 60
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->bundledQuery:Lcom/google/firebase/firestore/bundle/BundledQuery;

    .line 61
    invoke-virtual {v1}, Lcom/google/firebase/firestore/bundle/BundledQuery;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/firebase/firestore/bundle/NamedQuery;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 62
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/SnapshotVersion;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
