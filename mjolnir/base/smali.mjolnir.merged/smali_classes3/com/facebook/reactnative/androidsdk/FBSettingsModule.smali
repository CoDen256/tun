.class public Lcom/facebook/reactnative/androidsdk/FBSettingsModule;
.super Lcom/facebook/react/bridge/BaseJavaModule;
.source "FBSettingsModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBSettings"
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "FBSettings"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/facebook/react/bridge/BaseJavaModule;-><init>()V

    return-void
.end method

.method public static initializeSDK()V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 55
    invoke-static {}, Lcom/facebook/FacebookSdk;->fullyInitialize()V

    return-void
.end method

.method public static setAppID(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 64
    invoke-static {p0}, Lcom/facebook/FacebookSdk;->setApplicationId(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBSettings"

    return-object v0
.end method

.method public setDataProcessingOptions(Lcom/facebook/react/bridge/ReadableArray;II)V
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 44
    invoke-static {p1}, Lcom/facebook/reactnative/androidsdk/Utility;->reactArrayToStringList(Lcom/facebook/react/bridge/ReadableArray;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    .line 46
    invoke-static {p1, p2, p3}, Lcom/facebook/FacebookSdk;->setDataProcessingOptions([Ljava/lang/String;II)V

    return-void
.end method
