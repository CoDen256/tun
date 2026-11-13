.class public final synthetic Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/react/bridge/MemoryPressureListener;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/runtime/ReactHostImpl;

.field public final synthetic f$1:Ljava/lang/ref/WeakReference;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/ref/WeakReference;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iput-object p2, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;->f$1:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final handleMemoryPressure(I)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;->f$0:Lcom/facebook/react/runtime/ReactHostImpl;

    iget-object v1, p0, Lcom/facebook/react/runtime/ReactHostImpl$$ExternalSyntheticLambda4;->f$1:Ljava/lang/ref/WeakReference;

    invoke-static {v0, v1, p1}, Lcom/facebook/react/runtime/ReactHostImpl;->$r8$lambda$AulCbpMdpzNtc3SECZEnFfTdzpM(Lcom/facebook/react/runtime/ReactHostImpl;Ljava/lang/ref/WeakReference;I)V

    return-void
.end method
