.class final Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;
.super Ljava/lang/Object;
.source "DefaultFrescoSystrace.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DefaultArgsBuilder"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultFrescoSystrace.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultFrescoSystrace.kt\ncom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,73:1\n1#2:74\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0006\n\u0002\u0010\u0008\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J \u0010\u0008\u001a\n \t*\u0004\u0018\u00010\u00060\u00062\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u000cH\u0002J\u0018\u0010\r\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u000cH\u0016J\u0018\u0010\r\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u000eH\u0016J\u0018\u0010\r\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u000fH\u0016J\u0018\u0010\r\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u0012\u0010\u0005\u001a\u00060\u0006j\u0002`\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;",
        "Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;",
        "name",
        "",
        "(Ljava/lang/String;)V",
        "stringBuilder",
        "Ljava/lang/StringBuilder;",
        "Lkotlin/text/StringBuilder;",
        "appendArgument",
        "kotlin.jvm.PlatformType",
        "key",
        "value",
        "",
        "arg",
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


# instance fields
.field private final stringBuilder:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->stringBuilder:Ljava/lang/StringBuilder;

    return-void
.end method

.method private final appendArgument(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;
    .locals 2

    iget-object v0, p0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->stringBuilder:Ljava/lang/StringBuilder;

    const/16 v1, 0x3b

    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x3d

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-object v0
.end method


# virtual methods
.method public arg(Ljava/lang/String;D)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->appendArgument(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public arg(Ljava/lang/String;I)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->appendArgument(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public arg(Ljava/lang/String;J)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->appendArgument(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public arg(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "value"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    move-object v0, p0

    check-cast v0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->appendArgument(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public bridge synthetic arg(Ljava/lang/String;D)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    .line 45
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->arg(Ljava/lang/String;D)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public bridge synthetic arg(Ljava/lang/String;I)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->arg(Ljava/lang/String;I)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public bridge synthetic arg(Ljava/lang/String;J)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    .line 45
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->arg(Ljava/lang/String;J)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public bridge synthetic arg(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;
    .locals 0

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->arg(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/systrace/FrescoSystrace$ArgsBuilder;

    return-object p1
.end method

.method public flush()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->stringBuilder:Ljava/lang/StringBuilder;

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/16 v1, 0x7f

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->stringBuilder:Ljava/lang/StringBuilder;

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/systrace/DefaultFrescoSystrace$DefaultArgsBuilder;->stringBuilder:Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    return-void
.end method
