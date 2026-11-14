.class public final enum Lcom/amazon/device/iap/model/LWAConsentStatus;
.super Ljava/lang/Enum;
.source "LWAConsentStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/amazon/device/iap/model/LWAConsentStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/device/iap/model/LWAConsentStatus;

.field public static final enum CONSENTED:Lcom/amazon/device/iap/model/LWAConsentStatus;

.field public static final enum UNAVAILABLE:Lcom/amazon/device/iap/model/LWAConsentStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 10
    new-instance v0, Lcom/amazon/device/iap/model/LWAConsentStatus;

    const-string v1, "CONSENTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/amazon/device/iap/model/LWAConsentStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/device/iap/model/LWAConsentStatus;->CONSENTED:Lcom/amazon/device/iap/model/LWAConsentStatus;

    .line 14
    new-instance v1, Lcom/amazon/device/iap/model/LWAConsentStatus;

    const-string v3, "UNAVAILABLE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/amazon/device/iap/model/LWAConsentStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/amazon/device/iap/model/LWAConsentStatus;->UNAVAILABLE:Lcom/amazon/device/iap/model/LWAConsentStatus;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/amazon/device/iap/model/LWAConsentStatus;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/amazon/device/iap/model/LWAConsentStatus;->$VALUES:[Lcom/amazon/device/iap/model/LWAConsentStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEnumForValue(Ljava/lang/String;)Lcom/amazon/device/iap/model/LWAConsentStatus;
    .locals 5

    .line 23
    invoke-static {}, Lcom/amazon/device/iap/model/LWAConsentStatus;->values()[Lcom/amazon/device/iap/model/LWAConsentStatus;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 24
    invoke-virtual {v3}, Lcom/amazon/device/iap/model/LWAConsentStatus;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/amazon/device/iap/model/LWAConsentStatus;->UNAVAILABLE:Lcom/amazon/device/iap/model/LWAConsentStatus;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/device/iap/model/LWAConsentStatus;
    .locals 1

    const-class v0, Lcom/amazon/device/iap/model/LWAConsentStatus;

    .line 6
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/amazon/device/iap/model/LWAConsentStatus;

    return-object p0
.end method

.method public static values()[Lcom/amazon/device/iap/model/LWAConsentStatus;
    .locals 1

    sget-object v0, Lcom/amazon/device/iap/model/LWAConsentStatus;->$VALUES:[Lcom/amazon/device/iap/model/LWAConsentStatus;

    .line 6
    invoke-virtual {v0}, [Lcom/amazon/device/iap/model/LWAConsentStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/device/iap/model/LWAConsentStatus;

    return-object v0
.end method
