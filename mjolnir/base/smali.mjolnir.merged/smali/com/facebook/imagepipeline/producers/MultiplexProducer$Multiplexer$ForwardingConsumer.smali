.class Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;
.super Lcom/facebook/imagepipeline/producers/BaseConsumer;
.source "MultiplexProducer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ForwardingConsumer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/imagepipeline/producers/BaseConsumer<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;


# direct methods
.method private constructor <init>(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    .line 562
    invoke-direct {p0}, Lcom/facebook/imagepipeline/producers/BaseConsumer;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;Lcom/facebook/imagepipeline/producers/MultiplexProducer$1;)V
    .locals 0

    .line 562
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;-><init>(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;)V

    return-void
.end method


# virtual methods
.method protected onCancellationImpl()V
    .locals 2

    .line 594
    :try_start_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MultiplexProducer#onCancellation"

    .line 595
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    .line 597
    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->onCancelled(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 599
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 600
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    .line 599
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 600
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    .line 602
    :cond_2
    throw v0
.end method

.method protected onFailureImpl(Ljava/lang/Throwable;)V
    .locals 1

    .line 580
    :try_start_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MultiplexProducer#onFailure"

    .line 581
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    .line 583
    invoke-virtual {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->onFailure(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 585
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 586
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 585
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 586
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    .line 588
    :cond_2
    throw p1
.end method

.method protected onNewResultImpl(Ljava/io/Closeable;I)V
    .locals 1
    .param p1    # Ljava/io/Closeable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 566
    :try_start_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MultiplexProducer#onNewResult"

    .line 567
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    .line 569
    invoke-virtual {v0, p0, p1, p2}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->onNextResult(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;Ljava/io/Closeable;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 571
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 572
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 571
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 572
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    .line 574
    :cond_2
    throw p1
.end method

.method protected bridge synthetic onNewResultImpl(Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 562
    check-cast p1, Ljava/io/Closeable;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;->onNewResultImpl(Ljava/io/Closeable;I)V

    return-void
.end method

.method protected onProgressUpdateImpl(F)V
    .locals 1

    .line 608
    :try_start_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MultiplexProducer#onProgressUpdate"

    .line 609
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;->this$1:Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;

    .line 611
    invoke-virtual {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer;->onProgressUpdate(Lcom/facebook/imagepipeline/producers/MultiplexProducer$Multiplexer$ForwardingConsumer;F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 613
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 614
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 613
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 614
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    .line 616
    :cond_2
    throw p1
.end method
