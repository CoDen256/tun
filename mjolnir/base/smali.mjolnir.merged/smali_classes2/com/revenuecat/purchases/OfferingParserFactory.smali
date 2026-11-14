.class public final Lcom/revenuecat/purchases/OfferingParserFactory;
.super Ljava/lang/Object;
.source "OfferingParserFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/OfferingParserFactory$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nOfferingParserFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 OfferingParserFactory.kt\ncom/revenuecat/purchases/OfferingParserFactory\n+ 2 logUtils.kt\ncom/revenuecat/purchases/common/LogUtilsKt\n*L\n1#1,35:1\n38#2,2:36\n37#2,3:38\n*S KotlinDebug\n*F\n+ 1 OfferingParserFactory.kt\ncom/revenuecat/purchases/OfferingParserFactory\n*L\n24#1:36,2\n29#1:38,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/revenuecat/purchases/OfferingParserFactory;",
        "",
        "()V",
        "createOfferingParser",
        "Lcom/revenuecat/purchases/common/OfferingParser;",
        "store",
        "Lcom/revenuecat/purchases/Store;",
        "apiKeyValidationResult",
        "Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;",
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/OfferingParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/OfferingParserFactory;

    invoke-direct {v0}, Lcom/revenuecat/purchases/OfferingParserFactory;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/OfferingParserFactory;->INSTANCE:Lcom/revenuecat/purchases/OfferingParserFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createOfferingParser(Lcom/revenuecat/purchases/Store;Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;)Lcom/revenuecat/purchases/common/OfferingParser;
    .locals 4

    const-string v0, "store"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "apiKeyValidationResult"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    sget-object v0, Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;->SIMULATED_STORE:Lcom/revenuecat/purchases/APIKeyValidator$ValidationResult;

    if-ne p2, v0, :cond_0

    .line 15
    new-instance p1, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreOfferingParser;

    invoke-direct {p1}, Lcom/revenuecat/purchases/simulatedstore/SimulatedStoreOfferingParser;-><init>()V

    check-cast p1, Lcom/revenuecat/purchases/common/OfferingParser;

    return-object p1

    .line 17
    :cond_0
    sget-object p2, Lcom/revenuecat/purchases/OfferingParserFactory$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/revenuecat/purchases/Store;->ordinal()I

    move-result v0

    aget p2, p2, v0

    const/4 v0, 0x1

    if-eq p2, v0, :cond_2

    const/4 v0, 0x2

    const-string v1, "[Purchases] - ERROR"

    if-ne p2, v0, :cond_1

    :try_start_0
    const-string p1, "com.revenuecat.purchases.amazon.AmazonOfferingParser"

    .line 21
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const/4 p2, 0x0

    new-array v0, p2, [Ljava/lang/Class;

    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    new-array p2, p2, [Ljava/lang/Object;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const-string p2, "null cannot be cast to non-null type com.revenuecat.purchases.common.OfferingParser"

    .line 21
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/revenuecat/purchases/common/OfferingParser;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 36
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    const-string v0, "Make sure purchases-amazon is added as dependency"

    move-object v2, p1

    check-cast v2, Ljava/lang/Throwable;

    invoke-interface {p2, v1, v0, v2}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    throw p1

    .line 39
    :cond_1
    invoke-static {}, Lcom/revenuecat/purchases/common/LogWrapperKt;->getCurrentLogHandler()Lcom/revenuecat/purchases/LogHandler;

    move-result-object p2

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Incompatible store ("

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ") used"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    .line 39
    invoke-interface {p2, v1, v0, v3}, Lcom/revenuecat/purchases/LogHandler;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Couldn\'t configure SDK. Incompatible store ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 18
    :cond_2
    new-instance p1, Lcom/revenuecat/purchases/common/GoogleOfferingParser;

    invoke-direct {p1}, Lcom/revenuecat/purchases/common/GoogleOfferingParser;-><init>()V

    check-cast p1, Lcom/revenuecat/purchases/common/OfferingParser;

    :goto_0
    return-object p1
.end method
