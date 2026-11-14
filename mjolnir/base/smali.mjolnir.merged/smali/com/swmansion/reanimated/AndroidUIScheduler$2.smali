.class Lcom/swmansion/reanimated/AndroidUIScheduler$2;
.super Lcom/facebook/react/bridge/GuardedRunnable;
.source "AndroidUIScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/swmansion/reanimated/AndroidUIScheduler;->scheduleTriggerOnUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;


# direct methods
.method constructor <init>(Lcom/swmansion/reanimated/AndroidUIScheduler;Lcom/facebook/react/bridge/JSExceptionHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/AndroidUIScheduler$2;->this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;

    .line 41
    invoke-direct {p0, p2}, Lcom/facebook/react/bridge/GuardedRunnable;-><init>(Lcom/facebook/react/bridge/JSExceptionHandler;)V

    return-void
.end method


# virtual methods
.method public runGuarded()V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/AndroidUIScheduler$2;->this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;

    .line 43
    invoke-static {v0}, Lcom/swmansion/reanimated/AndroidUIScheduler;->-$$Nest$fgetmUIThreadRunnable(Lcom/swmansion/reanimated/AndroidUIScheduler;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
