.class public final enum Lcom/revenuecat/purchases/Store;
.super Ljava/lang/Enum;
.source "EntitlementInfo.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/Store$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/Store;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\r\u0008\u0087\u0001\u0018\u0000 \r2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\rB\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/revenuecat/purchases/Store;",
        "",
        "(Ljava/lang/String;I)V",
        "APP_STORE",
        "MAC_APP_STORE",
        "PLAY_STORE",
        "STRIPE",
        "PROMOTIONAL",
        "UNKNOWN_STORE",
        "AMAZON",
        "RC_BILLING",
        "EXTERNAL",
        "PADDLE",
        "Companion",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlinx/serialization/Serializable;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/Store;

.field private static final $cachedSerializer$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lkotlinx/serialization/KSerializer<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final enum AMAZON:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "amazon"
    .end annotation
.end field

.field public static final enum APP_STORE:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "app_store"
    .end annotation
.end field

.field public static final Companion:Lcom/revenuecat/purchases/Store$Companion;

.field public static final enum EXTERNAL:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "external"
    .end annotation
.end field

.field public static final enum MAC_APP_STORE:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "mac_app_store"
    .end annotation
.end field

.field public static final enum PADDLE:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "paddle"
    .end annotation
.end field

.field public static final enum PLAY_STORE:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "play_store"
    .end annotation
.end field

.field public static final enum PROMOTIONAL:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "promotional"
    .end annotation
.end field

.field public static final enum RC_BILLING:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "rc_billing"
    .end annotation
.end field

.field public static final enum STRIPE:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "stripe"
    .end annotation
.end field

.field public static final enum UNKNOWN_STORE:Lcom/revenuecat/purchases/Store;
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "unknown"
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/Store;
    .locals 3

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/revenuecat/purchases/Store;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/Store;->APP_STORE:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/Store;->MAC_APP_STORE:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/Store;->STRIPE:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/Store;->PROMOTIONAL:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/revenuecat/purchases/Store;->UNKNOWN_STORE:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/revenuecat/purchases/Store;->AMAZON:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/revenuecat/purchases/Store;->RC_BILLING:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/revenuecat/purchases/Store;->EXTERNAL:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/revenuecat/purchases/Store;->PADDLE:Lcom/revenuecat/purchases/Store;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 183
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "APP_STORE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->APP_STORE:Lcom/revenuecat/purchases/Store;

    .line 189
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "MAC_APP_STORE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->MAC_APP_STORE:Lcom/revenuecat/purchases/Store;

    .line 195
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "PLAY_STORE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;

    .line 201
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "STRIPE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->STRIPE:Lcom/revenuecat/purchases/Store;

    .line 207
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "PROMOTIONAL"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->PROMOTIONAL:Lcom/revenuecat/purchases/Store;

    .line 213
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "UNKNOWN_STORE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->UNKNOWN_STORE:Lcom/revenuecat/purchases/Store;

    .line 219
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "AMAZON"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->AMAZON:Lcom/revenuecat/purchases/Store;

    .line 225
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "RC_BILLING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->RC_BILLING:Lcom/revenuecat/purchases/Store;

    .line 231
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "EXTERNAL"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->EXTERNAL:Lcom/revenuecat/purchases/Store;

    .line 237
    new-instance v0, Lcom/revenuecat/purchases/Store;

    const-string v1, "PADDLE"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/revenuecat/purchases/Store;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->PADDLE:Lcom/revenuecat/purchases/Store;

    invoke-static {}, Lcom/revenuecat/purchases/Store;->$values()[Lcom/revenuecat/purchases/Store;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/Store;->$VALUES:[Lcom/revenuecat/purchases/Store;

    new-instance v0, Lcom/revenuecat/purchases/Store$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/Store$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/Store;->Companion:Lcom/revenuecat/purchases/Store$Companion;

    .line 241
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    sget-object v1, Lcom/revenuecat/purchases/Store$Companion$1;->INSTANCE:Lcom/revenuecat/purchases/Store$Companion$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/Store;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 178
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final synthetic access$get$cachedSerializer$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Store;->$cachedSerializer$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/Store;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/Store;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/Store;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/Store;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/Store;->$VALUES:[Lcom/revenuecat/purchases/Store;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/Store;

    return-object v0
.end method
