.class final Lcom/google/firebase/firestore/core/QueryView;
.super Ljava/lang/Object;
.source "QueryView.java"


# instance fields
.field private final query:Lcom/google/firebase/firestore/core/Query;

.field private final targetId:I

.field private final view:Lcom/google/firebase/firestore/core/View;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/core/Query;ILcom/google/firebase/firestore/core/View;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/QueryView;->query:Lcom/google/firebase/firestore/core/Query;

    iput p2, p0, Lcom/google/firebase/firestore/core/QueryView;->targetId:I

    iput-object p3, p0, Lcom/google/firebase/firestore/core/QueryView;->view:Lcom/google/firebase/firestore/core/View;

    return-void
.end method


# virtual methods
.method public getQuery()Lcom/google/firebase/firestore/core/Query;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/QueryView;->query:Lcom/google/firebase/firestore/core/Query;

    return-object v0
.end method

.method public getTargetId()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/core/QueryView;->targetId:I

    return v0
.end method

.method public getView()Lcom/google/firebase/firestore/core/View;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/core/QueryView;->view:Lcom/google/firebase/firestore/core/View;

    return-object v0
.end method
