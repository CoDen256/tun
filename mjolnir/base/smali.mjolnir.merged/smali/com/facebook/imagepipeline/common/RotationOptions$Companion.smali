.class public final Lcom/facebook/imagepipeline/common/RotationOptions$Companion;
.super Ljava/lang/Object;
.source "RotationOptions.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/common/RotationOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\t\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u000e\u001a\u00020\nH\u0007J\u0008\u0010\u000f\u001a\u00020\nH\u0007J\u0008\u0010\u0010\u001a\u00020\nH\u0007J\u0010\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0004H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/common/RotationOptions$Companion;",
        "",
        "()V",
        "DISABLE_ROTATION",
        "",
        "NO_ROTATION",
        "ROTATE_180",
        "ROTATE_270",
        "ROTATE_90",
        "ROTATION_OPTIONS_AUTO_ROTATE",
        "Lcom/facebook/imagepipeline/common/RotationOptions;",
        "ROTATION_OPTIONS_DISABLE_ROTATION",
        "ROTATION_OPTIONS_ROTATE_AT_RENDER_TIME",
        "USE_EXIF_ROTATION_ANGLE",
        "autoRotate",
        "autoRotateAtRenderTime",
        "disableRotation",
        "forceRotation",
        "angle",
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
.method private constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final autoRotate()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 108
    invoke-static {}, Lcom/facebook/imagepipeline/common/RotationOptions;->access$getROTATION_OPTIONS_AUTO_ROTATE$cp()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    return-object v0
.end method

.method public final autoRotateAtRenderTime()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 120
    invoke-static {}, Lcom/facebook/imagepipeline/common/RotationOptions;->access$getROTATION_OPTIONS_ROTATE_AT_RENDER_TIME$cp()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    return-object v0
.end method

.method public final disableRotation()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 111
    invoke-static {}, Lcom/facebook/imagepipeline/common/RotationOptions;->access$getROTATION_OPTIONS_DISABLE_ROTATION$cp()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    return-object v0
.end method

.method public final forceRotation(I)Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 130
    new-instance v0, Lcom/facebook/imagepipeline/common/RotationOptions;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lcom/facebook/imagepipeline/common/RotationOptions;-><init>(IZLkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method
