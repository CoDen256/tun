.class public final synthetic Lcom/facebook/imagepipeline/cache/AnimatedCache$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/imagepipeline/cache/ValueDescriptor;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getSizeInBytes(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/facebook/imagepipeline/cache/AnimationFrames;

    invoke-static {p1}, Lcom/facebook/imagepipeline/cache/AnimatedCache;->$r8$lambda$R_V3YshJ0sXLfH338L0vdkYEm90(Lcom/facebook/imagepipeline/cache/AnimationFrames;)I

    move-result p1

    return p1
.end method
