.class public Lcom/amazon/device/iap/model/UserDataRequest;
.super Ljava/lang/Object;
.source "UserDataRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/device/iap/model/UserDataRequest$Builder;
    }
.end annotation


# instance fields
.field private fetchLWAConsentStatus:Z


# direct methods
.method public constructor <init>(Lcom/amazon/device/iap/model/UserDataRequest$Builder;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {p1}, Lcom/amazon/device/iap/model/UserDataRequest$Builder;->access$000(Lcom/amazon/device/iap/model/UserDataRequest$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/amazon/device/iap/model/UserDataRequest;->fetchLWAConsentStatus:Z

    return-void
.end method

.method public static newBuilder()Lcom/amazon/device/iap/model/UserDataRequest$Builder;
    .locals 2

    .line 30
    new-instance v0, Lcom/amazon/device/iap/model/UserDataRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/amazon/device/iap/model/UserDataRequest$Builder;-><init>(Lcom/amazon/device/iap/model/UserDataRequest$1;)V

    return-object v0
.end method


# virtual methods
.method public getFetchLWAConsentStatus()Z
    .locals 1

    iget-boolean v0, p0, Lcom/amazon/device/iap/model/UserDataRequest;->fetchLWAConsentStatus:Z

    return v0
.end method
