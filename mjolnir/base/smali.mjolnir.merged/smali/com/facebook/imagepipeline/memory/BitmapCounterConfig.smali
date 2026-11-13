.class public final Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;
.super Ljava/lang/Object;
.source "BitmapCounterConfig.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/memory/BitmapCounterConfig$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007B\u000f\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;",
        "",
        "maxBitmapCount",
        "",
        "(I)V",
        "getMaxBitmapCount",
        "()I",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/memory/BitmapCounterConfig$Companion;

.field public static final DEFAULT_MAX_BITMAP_COUNT:I = 0x180


# instance fields
.field private final maxBitmapCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;->Companion:Lcom/facebook/imagepipeline/memory/BitmapCounterConfig$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;->maxBitmapCount:I

    return-void
.end method

.method public synthetic constructor <init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/16 p1, 0x180

    .line 10
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final getMaxBitmapCount()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;->maxBitmapCount:I

    return v0
.end method
