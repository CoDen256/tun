.class public final synthetic Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/common/internal/Supplier;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/cache/AnimatedCache;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/cache/AnimatedCache;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda3;->f$0:Lcom/facebook/imagepipeline/cache/AnimatedCache;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda3;->f$0:Lcom/facebook/imagepipeline/cache/AnimatedCache;

    invoke-static {v0}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->$r8$lambda$mYJUxolUmTMC7REbNbee6ew04UM(Lcom/facebook/imagepipeline/cache/AnimatedCache;)Lcom/facebook/imagepipeline/cache/MemoryCacheParams;

    move-result-object v0

    return-object v0
.end method
