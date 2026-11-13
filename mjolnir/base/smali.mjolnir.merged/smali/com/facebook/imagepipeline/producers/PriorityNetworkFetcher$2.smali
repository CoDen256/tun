.class Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;
.super Ljava/lang/Object;
.source "PriorityNetworkFetcher.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->delegateFetch(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

.field final synthetic val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 373
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .locals 3

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    const-string v2, "CANCEL"

    .line 415
    invoke-static {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$300(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 416
    iget-object v0, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    if-eqz v0, :cond_0

    .line 418
    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onCancellation()V

    :cond_0
    return-void
.end method

.method public onFailure(Ljava/lang/Throwable;)V
    .locals 9

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 384
    iget v2, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->attemptCount:I

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 387
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$500(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I

    move-result v3

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 388
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$600(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I

    move-result v4

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 389
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$700(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z

    move-result v5

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 390
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$800(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z

    move-result v6

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 391
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$900(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z

    move-result v7

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 392
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->getContext()Lcom/facebook/imagepipeline/producers/ProducerContext;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getPriority()Lcom/facebook/imagepipeline/common/Priority;

    move-result-object v8

    move-object v1, p1

    .line 384
    invoke-static/range {v1 .. v8}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->shouldRetry(Ljava/lang/Throwable;IIIZZZLcom/facebook/imagepipeline/common/Priority;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 393
    invoke-static {p1, v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$1000(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 398
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$1100(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    iget v0, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->requeueCount:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 399
    invoke-static {v1}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$1100(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)I

    move-result v1

    if-ge v0, v1, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    .line 401
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$1200(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;)Z

    move-result v0

    if-eqz v0, :cond_3

    instance-of v0, p1, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$NonrecoverableException;

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    const-string v2, "FAIL"

    .line 405
    invoke-static {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$300(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 406
    iget-object v0, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    if-eqz v0, :cond_4

    .line 408
    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onFailure(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->this$0:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 403
    invoke-static {p1, v0}, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;->access$1300(Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher;Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public onResponse(Ljava/io/InputStream;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$2;->val$fetchState:Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;

    .line 376
    iget-object v0, v0, Lcom/facebook/imagepipeline/producers/PriorityNetworkFetcher$PriorityFetchState;->callback:Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;

    if-eqz v0, :cond_0

    .line 378
    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/NetworkFetcher$Callback;->onResponse(Ljava/io/InputStream;I)V

    :cond_0
    return-void
.end method
