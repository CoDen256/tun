.class public final synthetic Lcom/facebook/react/devsupport/DevSupportManagerBase$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/devsupport/DevSupportManagerBase;

.field public final synthetic f$1:Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/devsupport/DevSupportManagerBase$$ExternalSyntheticLambda14;->f$0:Lcom/facebook/react/devsupport/DevSupportManagerBase;

    iput-object p2, p0, Lcom/facebook/react/devsupport/DevSupportManagerBase$$ExternalSyntheticLambda14;->f$1:Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/devsupport/DevSupportManagerBase$$ExternalSyntheticLambda14;->f$0:Lcom/facebook/react/devsupport/DevSupportManagerBase;

    iget-object v1, p0, Lcom/facebook/react/devsupport/DevSupportManagerBase$$ExternalSyntheticLambda14;->f$1:Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;

    invoke-static {v0, v1}, Lcom/facebook/react/devsupport/DevSupportManagerBase;->$r8$lambda$qpu6QQbqfjijQWvmkVc3DMck4qw(Lcom/facebook/react/devsupport/DevSupportManagerBase;Lcom/facebook/react/devsupport/interfaces/PackagerStatusCallback;)V

    return-void
.end method
