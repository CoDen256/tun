.class public final Lcom/facebook/imagepipeline/debug/NoOpCloseableReferenceLeakTracker;
.super Ljava/lang/Object;
.source "NoOpCloseableReferenceLeakTracker.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0003\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0016J\"\u0010\n\u001a\u00020\u00072\u000e\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\r0\u000c2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0016R\u0014\u0010\u0003\u001a\u00020\u00048VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010\u0005\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/debug/NoOpCloseableReferenceLeakTracker;",
        "Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker;",
        "()V",
        "isSet",
        "",
        "()Z",
        "setListener",
        "",
        "listener",
        "Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker$Listener;",
        "trackCloseableReferenceLeak",
        "reference",
        "Lcom/facebook/common/references/SharedReference;",
        "",
        "stacktrace",
        "",
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

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isSet()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setListener(Lcom/facebook/imagepipeline/debug/CloseableReferenceLeakTracker$Listener;)V
    .locals 0

    return-void
.end method

.method public trackCloseableReferenceLeak(Lcom/facebook/common/references/SharedReference;Ljava/lang/Throwable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/references/SharedReference<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    const-string p2, "reference"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
