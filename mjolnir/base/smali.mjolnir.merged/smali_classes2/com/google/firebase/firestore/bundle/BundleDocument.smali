.class public Lcom/google/firebase/firestore/bundle/BundleDocument;
.super Ljava/lang/Object;
.source "BundleDocument.java"

# interfaces
.implements Lcom/google/firebase/firestore/bundle/BundleElement;


# instance fields
.field private document:Lcom/google/firebase/firestore/model/MutableDocument;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/model/MutableDocument;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/bundle/BundleDocument;->document:Lcom/google/firebase/firestore/model/MutableDocument;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    if-eqz p1, :cond_2

    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 43
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/bundle/BundleDocument;

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleDocument;->document:Lcom/google/firebase/firestore/model/MutableDocument;

    .line 45
    iget-object p1, p1, Lcom/google/firebase/firestore/bundle/BundleDocument;->document:Lcom/google/firebase/firestore/model/MutableDocument;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/MutableDocument;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public getDocument()Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleDocument;->document:Lcom/google/firebase/firestore/model/MutableDocument;

    return-object v0
.end method

.method public getKey()Lcom/google/firebase/firestore/model/DocumentKey;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleDocument;->document:Lcom/google/firebase/firestore/model/MutableDocument;

    .line 30
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/MutableDocument;->getKey()Lcom/google/firebase/firestore/model/DocumentKey;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/bundle/BundleDocument;->document:Lcom/google/firebase/firestore/model/MutableDocument;

    .line 50
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/MutableDocument;->hashCode()I

    move-result v0

    return v0
.end method
