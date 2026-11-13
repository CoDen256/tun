.class public final synthetic Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/common/internal/Predicate;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->$r8$lambda$Mod9vLTImJz4axV--yiikQ4miXs(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
