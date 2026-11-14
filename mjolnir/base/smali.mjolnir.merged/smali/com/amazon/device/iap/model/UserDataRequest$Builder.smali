.class public Lcom/amazon/device/iap/model/UserDataRequest$Builder;
.super Ljava/lang/Object;
.source "UserDataRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/device/iap/model/UserDataRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private fetchLWAConsentStatus:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/amazon/device/iap/model/UserDataRequest$1;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/amazon/device/iap/model/UserDataRequest$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/amazon/device/iap/model/UserDataRequest$Builder;)Z
    .locals 0

    .line 36
    iget-boolean p0, p0, Lcom/amazon/device/iap/model/UserDataRequest$Builder;->fetchLWAConsentStatus:Z

    return p0
.end method


# virtual methods
.method public build()Lcom/amazon/device/iap/model/UserDataRequest;
    .locals 1

    .line 64
    new-instance v0, Lcom/amazon/device/iap/model/UserDataRequest;

    invoke-direct {v0, p0}, Lcom/amazon/device/iap/model/UserDataRequest;-><init>(Lcom/amazon/device/iap/model/UserDataRequest$Builder;)V

    return-object v0
.end method

.method public setFetchLWAConsentStatus(Z)Lcom/amazon/device/iap/model/UserDataRequest$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/amazon/device/iap/model/UserDataRequest$Builder;->fetchLWAConsentStatus:Z

    return-object p0
.end method
