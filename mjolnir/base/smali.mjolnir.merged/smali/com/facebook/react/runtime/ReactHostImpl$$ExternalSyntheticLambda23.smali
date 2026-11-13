.class public final synthetic Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/runtime/ReactHostImpl$VeniceThenable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/runtime/ReactHostImpl;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lcom/facebook/react/runtime/ReactSurfaceImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;->f$2:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda23;->f$2:Lcom/facebook/react/runtime/ReactSurfaceImpl;

    check-cast p1, Lcom/facebook/react/runtime/ReactInstance;

    invoke-static {v0, v1, v2, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->$r8$lambda$RcJIr_OauBU33g9Fjv-32QaDk7c(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/String;Lcom/facebook/react/runtime/ReactSurfaceImpl;Lcom/facebook/react/runtime/ReactInstance;)V

    return-void
.end method
