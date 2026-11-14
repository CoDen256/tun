.class public final Lexpo/modules/constants/ConstantsServiceKt;
.super Ljava/lang/Object;
.source "ConstantsService.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0016\u0010\u0002\u001a\n \u0003*\u0004\u0018\u00010\u00010\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0004"
    }
    d2 = {
        "CONFIG_FILE_NAME",
        "",
        "TAG",
        "kotlin.jvm.PlatformType",
        "expo-constants_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final CONFIG_FILE_NAME:Ljava/lang/String; = "app.config"

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lexpo/modules/constants/ConstantsService;

    const-string v0, "ConstantsService"

    sput-object v0, Lexpo/modules/constants/ConstantsServiceKt;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$getTAG$p()Ljava/lang/String;
    .locals 1

    sget-object v0, Lexpo/modules/constants/ConstantsServiceKt;->TAG:Ljava/lang/String;

    return-object v0
.end method
