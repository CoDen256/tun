.class public Lcom/facebook/reactnative/androidsdk/FBProfileModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "FBProfileModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBProfile"
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "FBProfile"


# instance fields
.field private mProfileTracker:Lcom/facebook/ProfileTracker;


# direct methods
.method static bridge synthetic -$$Nest$fgetmProfileTracker(Lcom/facebook/reactnative/androidsdk/FBProfileModule;)Lcom/facebook/ProfileTracker;
    .locals 0

    iget-object p0, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule;->mProfileTracker:Lcom/facebook/ProfileTracker;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-void
.end method


# virtual methods
.method public getCurrentProfile(Lcom/facebook/react/bridge/Callback;)V
    .locals 4
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 42
    invoke-static {}, Lcom/facebook/Profile;->getCurrentProfile()Lcom/facebook/Profile;

    move-result-object v0

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/facebook/reactnative/androidsdk/FBProfileModule$1;-><init>(Lcom/facebook/reactnative/androidsdk/FBProfileModule;Ljava/util/Timer;Lcom/facebook/react/bridge/Callback;)V

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 55
    new-instance v1, Lcom/facebook/reactnative/androidsdk/FBProfileModule$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/facebook/reactnative/androidsdk/FBProfileModule$2;-><init>(Lcom/facebook/reactnative/androidsdk/FBProfileModule;Ljava/util/Timer;Lcom/facebook/react/bridge/Callback;)V

    iput-object v1, p0, Lcom/facebook/reactnative/androidsdk/FBProfileModule;->mProfileTracker:Lcom/facebook/ProfileTracker;

    .line 63
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 65
    invoke-static {}, Lcom/facebook/Profile;->getCurrentProfile()Lcom/facebook/Profile;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/reactnative/androidsdk/Utility;->profileToReactMap(Lcom/facebook/Profile;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBProfile"

    return-object v0
.end method
