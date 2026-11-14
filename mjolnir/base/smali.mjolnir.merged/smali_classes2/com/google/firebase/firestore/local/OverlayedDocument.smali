.class public Lcom/google/firebase/firestore/local/OverlayedDocument;
.super Ljava/lang/Object;
.source "OverlayedDocument.java"


# instance fields
.field private mutatedFields:Lcom/google/firebase/firestore/model/mutation/FieldMask;

.field private overlayedDocument:Lcom/google/firebase/firestore/model/Document;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/model/Document;Lcom/google/firebase/firestore/model/mutation/FieldMask;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/OverlayedDocument;->overlayedDocument:Lcom/google/firebase/firestore/model/Document;

    iput-object p2, p0, Lcom/google/firebase/firestore/local/OverlayedDocument;->mutatedFields:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    return-void
.end method


# virtual methods
.method public getDocument()Lcom/google/firebase/firestore/model/Document;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/OverlayedDocument;->overlayedDocument:Lcom/google/firebase/firestore/model/Document;

    return-object v0
.end method

.method public getMutatedFields()Lcom/google/firebase/firestore/model/mutation/FieldMask;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/firestore/local/OverlayedDocument;->mutatedFields:Lcom/google/firebase/firestore/model/mutation/FieldMask;

    return-object v0
.end method
