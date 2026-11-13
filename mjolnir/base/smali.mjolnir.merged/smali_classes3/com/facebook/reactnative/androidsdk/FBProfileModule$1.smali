.class Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;
.super Ljava/util/TimerTask;
.source "FBProfileModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/reactnative/androidsdk/FBProfileModule;->getCurrentProfile(Lcom/facebook/react/bridge/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/reactnative/androidsdk/FBProfileModule;

.field final synthetic val$callback:Lcom/facebook/react/bridge/Callback;

.field final synthetic val$timer:Ljava/util/Timer;


# direct methods
.method constructor <init>(Lcom/facebook/reactnative/androidsdk/FBProfileModule;Ljava/util/Timer;Lcom/facebook/react/bridge/Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;->this$0:Lcom/facebook/reactnative/androidsdk/FBProfileModule;

    iput-object p2, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;->val$timer:Ljava/util/Timer;

    iput-object p3, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;->val$callback:Lcom/facebook/react/bridge/Callback;

    .line 46
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;->val$timer:Ljava/util/Timer;

    .line 49
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;->val$callback:Lcom/facebook/react/bridge/Callback;

    const/4 v1, 0x0

    .line 50
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    return-void
.end method
