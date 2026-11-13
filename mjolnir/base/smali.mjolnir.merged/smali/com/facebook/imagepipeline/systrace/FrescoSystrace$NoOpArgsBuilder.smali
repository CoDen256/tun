.class final Lcom/facebook/imagepipeline/systrace/FrescoSystrace$NoOpArgsBuilder;
.super Ljava/lang/Object;
.source "FrescoSystrace.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/systrace/FrescoSystrace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoOpArgsBuilder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0000\n\u0002\u0010\u0006\n\u0002\u0010\u0008\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0008H\u0016J\u0018\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\tH\u0016J\u0018\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/systrace/FrescoSystrace$NoOpArgsBuilder;",
        "Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;",
        "()V",
        "arg",
        "key",
        "",
        "value",
        "",
        "",
        "",
        "",
        "flush",
        "",
        "imagepipeline-base_release"
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

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public arg(Ljava/lang/String;D)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    const-string p2, "key"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    move-object p1, p0

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public arg(Ljava/lang/String;I)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    const-string p2, "key"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    move-object p1, p0

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public arg(Ljava/lang/String;J)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    const-string p2, "key"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 108
    move-object p1, p0

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public arg(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo p1, "value"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    move-object p1, p0

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public flush()V
    .locals 0

    return-void
.end method
