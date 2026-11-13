.class public final synthetic Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda35;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;


# instance fields
.field public final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda35;->f$0:I

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)V
    .locals 1

    iget v0, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda35;->f$0:I

    check-cast p1, Lcom/facebook/react/runtime/ReactInstance;

    invoke-static {v0, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->lambda$new$0(ILcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method
