.class public final Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoaderKt;
.super Ljava/lang/Object;
.source "RNHeadlessAppLoader.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\"\u001a\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0004"
    }
    d2 = {
        "appRecords",
        "",
        "",
        "Lcom/facebook/react/ReactInstanceManager;",
        "expo-modules-core_release"
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
.field private static final appRecords:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/ReactInstanceManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    sput-object v0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoaderKt;->appRecords:Ljava/util/Map;

    return-void
.end method

.method public static final synthetic access$getAppRecords$p()Ljava/util/Map;
    .locals 1

    sget-object v0, Lexpo/modules/adapters/react/apploader/RNHeadlessAppLoaderKt;->appRecords:Ljava/util/Map;

    return-object v0
.end method
