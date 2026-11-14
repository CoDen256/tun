.class Lcom/facebook/react/jstasks/HeadlessJsTaskContext$2;
.super Ljava/lang/Object;
.source "HeadlessJsTaskContext.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/jstasks/HeadlessJsTaskContext;->finishTask(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

.field final synthetic val$taskId:I


# direct methods
.method constructor <init>(Lcom/facebook/react/jstasks/HeadlessJsTaskContext;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/jstasks/HeadlessJsTaskContext$2;->this$0:Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

    iput p2, p0, Lcom/facebook/react/jstasks/HeadlessJsTaskContext$2;->val$taskId:I

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/react/jstasks/HeadlessJsTaskContext$2;->this$0:Lcom/facebook/react/jstasks/HeadlessJsTaskContext;

    .line 189
    invoke-static {v0}, Lcom/facebook/react/jstasks/HeadlessJsTaskContext;->-$$Nest$fgetmHeadlessJsTaskEventListeners(Lcom/facebook/react/jstasks/HeadlessJsTaskContext;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;

    iget v2, p0, Lcom/facebook/react/jstasks/HeadlessJsTaskContext$2;->val$taskId:I

    .line 190
    invoke-interface {v1, v2}, Lcom/facebook/react/jstasks/HeadlessJsTaskEventListener;->onHeadlessJsTaskFinish(I)V

    goto :goto_0

    :cond_0
    return-void
.end method
