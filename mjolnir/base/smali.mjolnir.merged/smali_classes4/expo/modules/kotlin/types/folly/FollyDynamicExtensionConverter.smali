.class public final Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;
.super Ljava/lang/Object;
.source "FollyDynamicExtensionConverter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;",
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
.field public static final Companion:Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;

.field private static final instanceMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static nextId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->Companion:Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;

    .line 18
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    sput-object v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->instanceMap:Landroid/util/ArrayMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getInstanceMap$cp()Landroid/util/ArrayMap;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->instanceMap:Landroid/util/ArrayMap;

    return-object v0
.end method

.method public static final synthetic access$getNextId$cp()I
    .locals 1

    sget v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->nextId:I

    return v0
.end method

.method public static final synthetic access$setNextId$cp(I)V
    .locals 0

    sput p0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->nextId:I

    return-void
.end method

.method public static final declared-synchronized get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-class v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->Companion:Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;

    invoke-virtual {v1, p0}, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static final declared-synchronized put(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-class v0, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->Companion:Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;

    invoke-virtual {v1, p0}, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;->put(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
