.class public final Lexpo/modules/constants/ConstantsService$Companion;
.super Ljava/lang/Object;
.source "ConstantsService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/constants/ConstantsService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0002\u00a8\u0006\t"
    }
    d2 = {
        "Lexpo/modules/constants/ConstantsService$Companion;",
        "",
        "()V",
        "convertPixelsToDp",
        "",
        "px",
        "",
        "context",
        "Landroid/content/Context;",
        "expo-constants_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lexpo/modules/constants/ConstantsService$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$convertPixelsToDp(Lexpo/modules/constants/ConstantsService$Companion;FLandroid/content/Context;)I
    .locals 0

    .line 88
    invoke-direct {p0, p1, p2}, Lexpo/modules/constants/ConstantsService$Companion;->convertPixelsToDp(FLandroid/content/Context;)I

    move-result p0

    return p0
.end method

.method private final convertPixelsToDp(FLandroid/content/Context;)I
    .locals 1

    .line 90
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    .line 91
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    .line 92
    iget p2, p2, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p2, p2

    const/high16 v0, 0x43200000    # 160.0f

    div-float/2addr p2, v0

    div-float/2addr p1, p2

    float-to-int p1, p1

    return p1
.end method
