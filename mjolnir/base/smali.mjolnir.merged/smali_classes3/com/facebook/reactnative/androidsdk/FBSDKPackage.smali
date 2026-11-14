.class public Lcom/facebook/reactnative/androidsdk/FBSDKPackage;
.super Ljava/lang/Object;
.source "FBSDKPackage.java"

# interfaces
.implements Lcom/facebook/react/ReactPackage;


# instance fields
.field private mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-direct {v0}, Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;-><init>()V

    iput-object v0, p0, Lcom/facebook/reactnative/androidsdk/FBSDKPackage;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    return-void
.end method


# virtual methods
.method public createNativeModules(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;"
        }
    .end annotation

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/facebook/react/bridge/NativeModule;

    .line 38
    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;

    invoke-direct {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBAccessTokenModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;

    invoke-direct {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBAppEventsLoggerModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBAppLinkModule;

    invoke-direct {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBAppLinkModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/FBSDKPackage;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-direct {v1, p1, v2}, Lcom/facebook/reactnative/androidsdk/FBGameRequestDialogModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;

    invoke-direct {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/FBSDKPackage;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-direct {v1, p1, v2}, Lcom/facebook/reactnative/androidsdk/FBLoginManagerModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/FBSDKPackage;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-direct {v1, p1, v2}, Lcom/facebook/reactnative/androidsdk/FBMessageDialogModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBProfileModule;

    invoke-direct {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBProfileModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBSettingsModule;

    invoke-direct {v1}, Lcom/facebook/reactnative/androidsdk/FBSettingsModule;-><init>()V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule;

    iget-object v2, p0, Lcom/facebook/reactnative/androidsdk/FBSDKPackage;->mActivityEventListener:Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;

    invoke-direct {v1, p1, v2}, Lcom/facebook/reactnative/androidsdk/FBShareDialogModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/reactnative/androidsdk/FBActivityEventListener;)V

    const/16 p1, 0x9

    aput-object v1, v0, p1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/facebook/react/uimanager/ViewManager;

    .line 54
    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBLoginButtonManager;

    invoke-direct {v1, p1}, Lcom/facebook/reactnative/androidsdk/FBLoginButtonManager;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    const/4 p1, 0x0

    aput-object v1, v0, p1

    new-instance p1, Lcom/facebook/reactnative/androidsdk/FBSendButtonManager;

    invoke-direct {p1}, Lcom/facebook/reactnative/androidsdk/FBSendButtonManager;-><init>()V

    const/4 v1, 0x1

    aput-object p1, v0, v1

    new-instance p1, Lcom/facebook/reactnative/androidsdk/FBShareButtonManager;

    invoke-direct {p1}, Lcom/facebook/reactnative/androidsdk/FBShareButtonManager;-><init>()V

    const/4 v1, 0x2

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public synthetic getModule(Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/react/ReactPackage$-CC;->$default$getModule(Lcom/facebook/react/ReactPackage;Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;

    move-result-object p1

    return-object p1
.end method
