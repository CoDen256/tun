.class public Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;
.super Ljava/lang/Object;
.source "BaseProducerContextCallbacks.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0016\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016J\u0008\u0010\u0005\u001a\u00020\u0004H\u0016J\u0008\u0010\u0006\u001a\u00020\u0004H\u0016J\u0008\u0010\u0007\u001a\u00020\u0004H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/BaseProducerContextCallbacks;",
        "Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;",
        "()V",
        "onCancellationRequested",
        "",
        "onIsIntermediateResultExpectedChanged",
        "onIsPrefetchChanged",
        "onPriorityChanged",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellationRequested()V
    .locals 0

    return-void
.end method

.method public onIsIntermediateResultExpectedChanged()V
    .locals 0

    return-void
.end method

.method public onIsPrefetchChanged()V
    .locals 0

    return-void
.end method

.method public onPriorityChanged()V
    .locals 0

    return-void
.end method
