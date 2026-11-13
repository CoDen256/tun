.class Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;
.super Ljava/lang/Object;
.source "AsyncStorageModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->execute(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;

.field final synthetic val$r:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;->this$1:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;

    iput-object p2, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;->val$r:Ljava/lang/Runnable;

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;->val$r:Ljava/lang/Runnable;

    .line 63
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;->this$1:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;

    .line 65
    invoke-virtual {v0}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->scheduleNext()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor$1;->this$1:Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;

    invoke-virtual {v1}, Lcom/reactnativecommunity/asyncstorage/AsyncStorageModule$SerialExecutor;->scheduleNext()V

    .line 66
    throw v0
.end method
