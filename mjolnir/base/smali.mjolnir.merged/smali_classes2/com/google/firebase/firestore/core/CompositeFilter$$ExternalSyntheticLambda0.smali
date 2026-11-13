.class public final synthetic Lcom/google/firebase/firestore/core/CompositeFilter$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/firestore/util/Function;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/google/firebase/firestore/core/FieldFilter;

    invoke-static {p1}, Lcom/google/firebase/firestore/core/CompositeFilter;->lambda$getFirstInequalityField$0(Lcom/google/firebase/firestore/core/FieldFilter;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
