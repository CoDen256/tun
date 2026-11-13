.class Lcom/facebook/react/modules/image/ImageLoaderModule$3;
.super Lcom/facebook/datasource/BaseDataSubscriber;
.source "ImageLoaderModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/modules/image/ImageLoaderModule;->prefetchImage(Ljava/lang/String;DLcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/datasource/BaseDataSubscriber<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/react/modules/image/ImageLoaderModule;

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;

.field final synthetic val$requestId:I


# direct methods
.method constructor <init>(Lcom/facebook/react/modules/image/ImageLoaderModule;ILcom/facebook/react/bridge/Promise;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->this$0:Lcom/facebook/react/modules/image/ImageLoaderModule;

    iput p2, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$requestId:I

    iput-object p3, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 224
    invoke-direct {p0}, Lcom/facebook/datasource/BaseDataSubscriber;-><init>()V

    return-void
.end method


# virtual methods
.method protected onFailureImpl(Lcom/facebook/datasource/DataSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->this$0:Lcom/facebook/react/modules/image/ImageLoaderModule;

    iget v1, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$requestId:I

    .line 243
    invoke-static {v0, v1}, Lcom/facebook/react/modules/image/ImageLoaderModule;->-$$Nest$mremoveRequest(Lcom/facebook/react/modules/image/ImageLoaderModule;I)Lcom/facebook/datasource/DataSource;

    iget-object v0, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    const-string v1, "E_PREFETCH_FAILURE"

    .line 244
    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->getFailureCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->close()Z

    return-void

    :catchall_0
    move-exception v0

    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->close()Z

    .line 247
    throw v0
.end method

.method protected onNewResultImpl(Lcom/facebook/datasource/DataSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 227
    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->this$0:Lcom/facebook/react/modules/image/ImageLoaderModule;

    iget v1, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$requestId:I

    .line 231
    invoke-static {v0, v1}, Lcom/facebook/react/modules/image/ImageLoaderModule;->-$$Nest$mremoveRequest(Lcom/facebook/react/modules/image/ImageLoaderModule;I)Lcom/facebook/datasource/DataSource;

    iget-object v0, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    const/4 v1, 0x1

    .line 232
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    iget-object v1, p0, Lcom/facebook/react/modules/image/ImageLoaderModule$3;->val$promise:Lcom/facebook/react/bridge/Promise;

    const-string v2, "E_PREFETCH_FAILURE"

    .line 234
    invoke-interface {v1, v2, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 236
    :goto_0
    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->close()Z

    return-void

    :goto_1
    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->close()Z

    .line 237
    throw v0
.end method
