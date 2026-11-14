.class Lcom/swmansion/reanimated/AndroidUIScheduler$1;
.super Ljava/lang/Object;
.source "AndroidUIScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/swmansion/reanimated/AndroidUIScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;


# direct methods
.method constructor <init>(Lcom/swmansion/reanimated/AndroidUIScheduler;)V
    .locals 0

    iput-object p1, p0, Lcom/swmansion/reanimated/AndroidUIScheduler$1;->this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/swmansion/reanimated/AndroidUIScheduler$1;->this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;

    .line 23
    invoke-static {v0}, Lcom/swmansion/reanimated/AndroidUIScheduler;->-$$Nest$fgetmActive(Lcom/swmansion/reanimated/AndroidUIScheduler;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/swmansion/reanimated/AndroidUIScheduler$1;->this$0:Lcom/swmansion/reanimated/AndroidUIScheduler;

    .line 24
    invoke-virtual {v0}, Lcom/swmansion/reanimated/AndroidUIScheduler;->triggerUI()V

    :cond_0
    return-void
.end method
