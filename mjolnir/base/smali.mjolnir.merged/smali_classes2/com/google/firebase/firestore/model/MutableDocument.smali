.class public final Lcom/google/firebase/firestore/model/MutableDocument;
.super Ljava/lang/Object;
.source "MutableDocument.java"

# interfaces
.implements Lcom/google/firebase/firestore/model/Document;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;,
        Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;
    }
.end annotation


# instance fields
.field private documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

.field private documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

.field private final key:Lcom/google/firebase/firestore/model/DocumentKey;

.field private readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

.field private value:Lcom/google/firebase/firestore/model/ObjectValue;

.field private version:Lcom/google/firebase/firestore/model/SnapshotVersion;


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/model/DocumentKey;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    .line 71
    sget-object p1, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-void
.end method

.method private constructor <init>(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;)V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    iput-object p3, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput-object p4, p0, Lcom/google/firebase/firestore/model/MutableDocument;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput-object p2, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    iput-object p6, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    iput-object p5, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    return-void
.end method

.method public static newFoundDocument(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/ObjectValue;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    .line 106
    new-instance v0, Lcom/google/firebase/firestore/model/MutableDocument;

    invoke-direct {v0, p0}, Lcom/google/firebase/firestore/model/MutableDocument;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;)V

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/firestore/model/MutableDocument;->convertToFoundDocument(Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/ObjectValue;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p0

    return-object p0
.end method

.method public static newInvalidDocument(Lcom/google/firebase/firestore/model/DocumentKey;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 8

    .line 94
    new-instance v7, Lcom/google/firebase/firestore/model/MutableDocument;

    sget-object v2, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->INVALID:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    sget-object v3, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    sget-object v4, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    new-instance v5, Lcom/google/firebase/firestore/model/ObjectValue;

    invoke-direct {v5}, Lcom/google/firebase/firestore/model/ObjectValue;-><init>()V

    sget-object v6, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->SYNCED:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    move-object v0, v7

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/firestore/model/MutableDocument;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;)V

    return-object v7
.end method

.method public static newNoDocument(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    .line 111
    new-instance v0, Lcom/google/firebase/firestore/model/MutableDocument;

    invoke-direct {v0, p0}, Lcom/google/firebase/firestore/model/MutableDocument;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;)V

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/MutableDocument;->convertToNoDocument(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p0

    return-object p0
.end method

.method public static newUnknownDocument(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    .line 120
    new-instance v0, Lcom/google/firebase/firestore/model/MutableDocument;

    invoke-direct {v0, p0}, Lcom/google/firebase/firestore/model/MutableDocument;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;)V

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/MutableDocument;->convertToUnknownDocument(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public convertToFoundDocument(Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/ObjectValue;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 128
    sget-object p1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->FOUND_DOCUMENT:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    iput-object p2, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    .line 130
    sget-object p1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->SYNCED:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    return-object p0
.end method

.method public convertToNoDocument(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 137
    sget-object p1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->NO_DOCUMENT:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 138
    new-instance p1, Lcom/google/firebase/firestore/model/ObjectValue;

    invoke-direct {p1}, Lcom/google/firebase/firestore/model/ObjectValue;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    .line 139
    sget-object p1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->SYNCED:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    return-object p0
.end method

.method public convertToUnknownDocument(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 149
    sget-object p1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->UNKNOWN_DOCUMENT:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 150
    new-instance p1, Lcom/google/firebase/firestore/model/ObjectValue;

    invoke-direct {p1}, Lcom/google/firebase/firestore/model/ObjectValue;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    .line 151
    sget-object p1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->HAS_COMMITTED_MUTATIONS:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_6

    .line 240
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 242
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/model/MutableDocument;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    .line 244
    iget-object v2, p1, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/model/DocumentKey;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v0

    :cond_2
    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    .line 245
    iget-object v2, p1, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/model/SnapshotVersion;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    :cond_3
    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 248
    iget-object v2, p1, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v0

    :cond_4
    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    .line 249
    iget-object v2, p1, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v0

    :cond_5
    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    .line 250
    iget-object p1, p1, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/ObjectValue;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_6
    :goto_0
    return v0
.end method

.method public getData()Lcom/google/firebase/firestore/model/ObjectValue;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    return-object v0
.end method

.method public getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;
    .locals 1

    .line 208
    invoke-virtual {p0}, Lcom/google/firebase/firestore/model/MutableDocument;->getData()Lcom/google/firebase/firestore/model/ObjectValue;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/model/ObjectValue;->get(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;

    move-result-object p1

    return-object p1
.end method

.method public getKey()Lcom/google/firebase/firestore/model/DocumentKey;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    return-object v0
.end method

.method public getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object v0
.end method

.method public getVersion()Lcom/google/firebase/firestore/model/SnapshotVersion;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object v0
.end method

.method public hasCommittedMutations()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    .line 193
    sget-object v1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->HAS_COMMITTED_MUTATIONS:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasLocalMutations()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    .line 188
    sget-object v1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->HAS_LOCAL_MUTATIONS:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasPendingWrites()Z
    .locals 1

    .line 198
    invoke-virtual {p0}, Lcom/google/firebase/firestore/model/MutableDocument;->hasLocalMutations()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/firebase/firestore/model/MutableDocument;->hasCommittedMutations()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    .line 259
    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/DocumentKey;->hashCode()I

    move-result v0

    return v0
.end method

.method public isFoundDocument()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 218
    sget-object v1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->FOUND_DOCUMENT:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isNoDocument()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 223
    sget-object v1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->NO_DOCUMENT:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isUnknownDocument()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 228
    sget-object v1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->UNKNOWN_DOCUMENT:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isValidDocument()Z
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    .line 213
    sget-object v1, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->INVALID:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public mutableCopy()Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 8

    .line 234
    new-instance v7, Lcom/google/firebase/firestore/model/MutableDocument;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    iget-object v2, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    iget-object v3, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v4, p0, Lcom/google/firebase/firestore/model/MutableDocument;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iget-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/ObjectValue;->clone()Lcom/google/firebase/firestore/model/ObjectValue;

    move-result-object v5

    iget-object v6, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/firestore/model/MutableDocument;-><init>(Lcom/google/firebase/firestore/model/DocumentKey;Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/SnapshotVersion;Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;)V

    return-object v7
.end method

.method public setHasCommittedMutations()Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    .line 156
    sget-object v0, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->HAS_COMMITTED_MUTATIONS:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    iput-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    return-object p0
.end method

.method public setHasLocalMutations()Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 1

    .line 161
    sget-object v0, Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;->HAS_LOCAL_MUTATIONS:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    iput-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    .line 162
    sget-object v0, Lcom/google/firebase/firestore/model/SnapshotVersion;->NONE:Lcom/google/firebase/firestore/model/SnapshotVersion;

    iput-object v0, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object p0
.end method

.method public setReadTime(Lcom/google/firebase/firestore/model/SnapshotVersion;)Lcom/google/firebase/firestore/model/MutableDocument;
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Document{key="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->key:Lcom/google/firebase/firestore/model/DocumentKey;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", version="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->version:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", readTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->readTime:Lcom/google/firebase/firestore/model/SnapshotVersion;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentType:Lcom/google/firebase/firestore/model/MutableDocument$DocumentType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", documentState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->documentState:Lcom/google/firebase/firestore/model/MutableDocument$DocumentState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/MutableDocument;->value:Lcom/google/firebase/firestore/model/ObjectValue;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
