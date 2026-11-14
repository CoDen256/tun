.class public final Lcom/revenuecat/purchases/JsonTools;
.super Ljava/lang/Object;
.source "JsonTools.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u0017\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0005\u0010\u0002\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/revenuecat/purchases/JsonTools;",
        "",
        "()V",
        "json",
        "Lkotlinx/serialization/json/Json;",
        "getJson$annotations",
        "getJson",
        "()Lkotlinx/serialization/json/Json;",
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


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/JsonTools;

.field private static final json:Lkotlinx/serialization/json/Json;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/revenuecat/purchases/JsonTools;

    invoke-direct {v0}, Lcom/revenuecat/purchases/JsonTools;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/JsonTools;->INSTANCE:Lcom/revenuecat/purchases/JsonTools;

    .line 9
    sget-object v0, Lcom/revenuecat/purchases/JsonTools$json$1;->INSTANCE:Lcom/revenuecat/purchases/JsonTools$json$1;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v2, v0, v1, v2}, Lkotlinx/serialization/json/JsonKt;->Json$default(Lkotlinx/serialization/json/Json;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlinx/serialization/json/Json;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/JsonTools;->json:Lkotlinx/serialization/json/Json;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic getJson$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final getJson()Lkotlinx/serialization/json/Json;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/JsonTools;->json:Lkotlinx/serialization/json/Json;

    return-object v0
.end method
