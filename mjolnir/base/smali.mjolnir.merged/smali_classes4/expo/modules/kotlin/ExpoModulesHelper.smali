.class public final Lexpo/modules/kotlin/ExpoModulesHelper;
.super Ljava/lang/Object;
.source "ExpoModulesHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/ExpoModulesHelper$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lexpo/modules/kotlin/ExpoModulesHelper;",
        "",
        "()V",
        "Companion",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lexpo/modules/kotlin/ExpoModulesHelper$Companion;

.field private static final modulesProvider$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lexpo/modules/kotlin/ModulesProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/kotlin/ExpoModulesHelper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/ExpoModulesHelper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/ExpoModulesHelper;->Companion:Lexpo/modules/kotlin/ExpoModulesHelper$Companion;

    .line 7
    sget-object v0, Lexpo/modules/kotlin/ExpoModulesHelper$Companion$modulesProvider$2;->INSTANCE:Lexpo/modules/kotlin/ExpoModulesHelper$Companion$modulesProvider$2;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/ExpoModulesHelper;->modulesProvider$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getModulesProvider$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/ExpoModulesHelper;->modulesProvider$delegate:Lkotlin/Lazy;

    return-object v0
.end method
