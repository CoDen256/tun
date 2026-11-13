.class public interface abstract Lcom/google/firebase/firestore/model/Document;
.super Ljava/lang/Object;
.source "Document.java"


# static fields
.field public static final KEY_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/google/firebase/firestore/model/Document;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lcom/google/firebase/firestore/model/Document$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/google/firebase/firestore/model/Document$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/model/Document;->KEY_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public abstract getData()Lcom/google/firebase/firestore/model/ObjectValue;
.end method

.method public abstract getField(Lcom/google/firebase/firestore/model/FieldPath;)Lcom/google/firestore/v1/Value;
.end method

.method public abstract getKey()Lcom/google/firebase/firestore/model/DocumentKey;
.end method

.method public abstract getReadTime()Lcom/google/firebase/firestore/model/SnapshotVersion;
.end method

.method public abstract getVersion()Lcom/google/firebase/firestore/model/SnapshotVersion;
.end method

.method public abstract hasCommittedMutations()Z
.end method

.method public abstract hasLocalMutations()Z
.end method

.method public abstract hasPendingWrites()Z
.end method

.method public abstract isFoundDocument()Z
.end method

.method public abstract isNoDocument()Z
.end method

.method public abstract isUnknownDocument()Z
.end method

.method public abstract isValidDocument()Z
.end method

.method public abstract mutableCopy()Lcom/google/firebase/firestore/model/MutableDocument;
.end method
