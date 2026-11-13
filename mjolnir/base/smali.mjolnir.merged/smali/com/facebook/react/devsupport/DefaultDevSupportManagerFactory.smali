.class public Lcom/facebook/react/devsupport/DefaultDevSupportManagerFactory;
.super Ljava/lang/Object;
.source "DefaultDevSupportManagerFactory.java"

# interfaces
.implements Lcom/facebook/react/devsupport/DevSupportManagerFactory;


# static fields
.field private static final DEVSUPPORT_IMPL_CLASS:Ljava/lang/String; = "BridgeDevSupportManager"

.field private static final DEVSUPPORT_IMPL_PACKAGE:Ljava/lang/String; = "com.facebook.react.devsupport"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Landroid/content/Context;Lcom/facebook/react/devsupport/ReactInstanceDevHelper;Ljava/lang/String;ZI)Lcom/facebook/react/devsupport/interfaces/DevSupportManager;
    .locals 11
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v7, p5

    .line 43
    invoke-virtual/range {v0 .. v10}, Lcom/facebook/react/devsupport/DefaultDevSupportManagerFactory;->create(Landroid/content/Context;Lcom/facebook/react/devsupport/ReactInstanceDevHelper;Ljava/lang/String;ZLcom/facebook/react/devsupport/interfaces/RedBoxHandler;Lcom/facebook/react/devsupport/interfaces/DevBundleDownloadListener;ILjava/util/Map;Lcom/facebook/react/common/SurfaceDelegateFactory;Lcom/facebook/react/devsupport/interfaces/DevLoadingViewManager;)Lcom/facebook/react/devsupport/interfaces/DevSupportManager;

    move-result-object v0

    return-object v0
.end method

.method public create(Landroid/content/Context;Lcom/facebook/react/devsupport/ReactInstanceDevHelper;Ljava/lang/String;ZLcom/facebook/react/devsupport/interfaces/RedBoxHandler;Lcom/facebook/react/devsupport/interfaces/DevBundleDownloadListener;ILjava/util/Map;Lcom/facebook/react/common/SurfaceDelegateFactory;Lcom/facebook/react/devsupport/interfaces/DevLoadingViewManager;)Lcom/facebook/react/devsupport/interfaces/DevSupportManager;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/facebook/react/devsupport/ReactInstanceDevHelper;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/facebook/react/devsupport/interfaces/RedBoxHandler;",
            "Lcom/facebook/react/devsupport/interfaces/DevBundleDownloadListener;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/packagerconnection/RequestHandler;",
            ">;",
            "Lcom/facebook/react/common/SurfaceDelegateFactory;",
            "Lcom/facebook/react/devsupport/interfaces/DevLoadingViewManager;",
            ")",
            "Lcom/facebook/react/devsupport/interfaces/DevSupportManager;"
        }
    .end annotation

    move-object/from16 v0, p1

    if-nez p4, :cond_0

    .line 69
    new-instance v0, Lcom/facebook/react/devsupport/DisabledDevSupportManager;

    invoke-direct {v0}, Lcom/facebook/react/devsupport/DisabledDevSupportManager;-><init>()V

    return-object v0

    :cond_0
    :try_start_0
    const-string v1, "com.facebook.react.devsupport.BridgeDevSupportManager"

    .line 84
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/16 v2, 0xa

    new-array v3, v2, [Ljava/lang/Class;

    .line 85
    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Lcom/facebook/react/devsupport/ReactInstanceDevHelper;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-class v4, Ljava/lang/String;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    aput-object v4, v3, v8

    const-class v4, Lcom/facebook/react/devsupport/interfaces/RedBoxHandler;

    const/4 v9, 0x4

    aput-object v4, v3, v9

    const-class v4, Lcom/facebook/react/devsupport/interfaces/DevBundleDownloadListener;

    const/4 v10, 0x5

    aput-object v4, v3, v10

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x6

    aput-object v4, v3, v11

    const-class v4, Ljava/util/Map;

    const/4 v12, 0x7

    aput-object v4, v3, v12

    const-class v4, Lcom/facebook/react/common/SurfaceDelegateFactory;

    const/16 v13, 0x8

    aput-object v4, v3, v13

    const-class v4, Lcom/facebook/react/devsupport/interfaces/DevLoadingViewManager;

    const/16 v14, 0x9

    aput-object v4, v3, v14

    .line 86
    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v5

    aput-object p2, v2, v6

    aput-object p3, v2, v7

    .line 102
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v8

    aput-object p5, v2, v9

    aput-object p6, v2, v10

    .line 105
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v11

    aput-object p8, v2, v12

    aput-object p9, v2, v13

    aput-object p10, v2, v14

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/devsupport/interfaces/DevSupportManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 110
    :catch_0
    new-instance v1, Lcom/facebook/react/devsupport/PerftestDevSupportManager;

    invoke-direct {v1, v0}, Lcom/facebook/react/devsupport/PerftestDevSupportManager;-><init>(Landroid/content/Context;)V

    return-object v1
.end method
