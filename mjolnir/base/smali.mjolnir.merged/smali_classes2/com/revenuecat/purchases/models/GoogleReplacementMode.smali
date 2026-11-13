.class public final enum Lcom/revenuecat/purchases/models/GoogleReplacementMode;
.super Ljava/lang/Enum;
.source "GoogleReplacementMode.kt"

# interfaces
.implements Lcom/revenuecat/purchases/ReplacementMode;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/models/GoogleReplacementMode$CREATOR;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/revenuecat/purchases/models/GoogleReplacementMode;",
        ">;",
        "Lcom/revenuecat/purchases/ReplacementMode;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0086\u0001\u0018\u0000 \u00132\u0008\u0012\u0004\u0012\u00020\u00000\u00012\u00020\u0002:\u0001\u0013B\u000f\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0008\u0010\u0008\u001a\u00020\u0004H\u0016J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0004H\u0016R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/revenuecat/purchases/models/GoogleReplacementMode;",
        "",
        "Lcom/revenuecat/purchases/ReplacementMode;",
        "playBillingClientMode",
        "",
        "(Ljava/lang/String;II)V",
        "getPlayBillingClientMode",
        "()I",
        "describeContents",
        "writeToParcel",
        "",
        "out",
        "Landroid/os/Parcel;",
        "flags",
        "WITHOUT_PRORATION",
        "WITH_TIME_PRORATION",
        "CHARGE_FULL_PRICE",
        "CHARGE_PRORATED_PRICE",
        "DEFERRED",
        "CREATOR",
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
.field private static final synthetic $VALUES:[Lcom/revenuecat/purchases/models/GoogleReplacementMode;

.field public static final enum CHARGE_FULL_PRICE:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

.field public static final enum CHARGE_PRORATED_PRICE:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

.field public static final CREATOR:Lcom/revenuecat/purchases/models/GoogleReplacementMode$CREATOR;

.field public static final enum DEFERRED:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

.field public static final enum WITHOUT_PRORATION:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

.field public static final enum WITH_TIME_PRORATION:Lcom/revenuecat/purchases/models/GoogleReplacementMode;


# instance fields
.field private final playBillingClientMode:I


# direct methods
.method private static final synthetic $values()[Lcom/revenuecat/purchases/models/GoogleReplacementMode;
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const/4 v1, 0x0

    sget-object v2, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->WITHOUT_PRORATION:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->WITH_TIME_PRORATION:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->CHARGE_FULL_PRICE:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->CHARGE_PRORATED_PRICE:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->DEFERRED:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 23
    new-instance v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const-string v1, "WITHOUT_PRORATION"

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-direct {v0, v1, v2, v3}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->WITHOUT_PRORATION:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    .line 33
    new-instance v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const-string v1, "WITH_TIME_PRORATION"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->WITH_TIME_PRORATION:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    .line 45
    new-instance v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const/4 v1, 0x5

    const-string v2, "CHARGE_FULL_PRICE"

    const/4 v4, 0x2

    invoke-direct {v0, v2, v4, v1}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->CHARGE_FULL_PRICE:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    .line 58
    new-instance v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const-string v1, "CHARGE_PRORATED_PRICE"

    invoke-direct {v0, v1, v3, v4}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->CHARGE_PRORATED_PRICE:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    .line 66
    new-instance v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    const/4 v1, 0x4

    const/4 v2, 0x6

    const-string v3, "DEFERRED"

    invoke-direct {v0, v3, v1, v2}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->DEFERRED:Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    invoke-static {}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->$values()[Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->$VALUES:[Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    new-instance v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode$CREATOR;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/models/GoogleReplacementMode$CREATOR;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->CREATOR:Lcom/revenuecat/purchases/models/GoogleReplacementMode$CREATOR;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->playBillingClientMode:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/revenuecat/purchases/models/GoogleReplacementMode;
    .locals 1

    const-class v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    return-object p0
.end method

.method public static values()[Lcom/revenuecat/purchases/models/GoogleReplacementMode;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->$VALUES:[Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/revenuecat/purchases/models/GoogleReplacementMode;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic getName()Ljava/lang/String;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getPlayBillingClientMode()I
    .locals 1

    iget v0, p0, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->playBillingClientMode:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    const-string p2, "out"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/revenuecat/purchases/models/GoogleReplacementMode;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
