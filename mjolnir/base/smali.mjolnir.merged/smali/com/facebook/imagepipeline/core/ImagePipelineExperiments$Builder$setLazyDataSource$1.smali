.class final Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;
.super Lkotlin/jvm/internal/Lambda;
.source "ImagePipelineExperiments.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setLazyDataSource(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $lazyDataSource:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;->this$0:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    iput-object p2, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;->$lazyDataSource:Lcom/facebook/common/internal/Supplier;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 262
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;->this$0:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$setLazyDataSource$1;->$lazyDataSource:Lcom/facebook/common/internal/Supplier;

    .line 263
    iput-object v1, v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->lazyDataSource:Lcom/facebook/common/internal/Supplier;

    return-void
.end method
