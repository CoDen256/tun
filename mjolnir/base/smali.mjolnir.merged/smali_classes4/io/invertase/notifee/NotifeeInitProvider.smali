.class public Lio/invertase/notifee/NotifeeInitProvider;
.super Lapp/notifee/core/InitProvider;
.source "NotifeeInitProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lapp/notifee/core/InitProvider;-><init>()V

    return-void
.end method

.method private getApplicationVersionString()Ljava/lang/String;
    .locals 3

    .line 32
    invoke-virtual {p0}, Lio/invertase/notifee/NotifeeInitProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 34
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 36
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 37
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    const-string v0, "unknown"

    :goto_0
    return-object v0
.end method

.method private getReactNativeVersionString()Ljava/lang/String;
    .locals 5

    .line 48
    sget-object v0, Lcom/facebook/react/modules/systeminfo/ReactNativeVersion;->VERSION:Ljava/util/Map;

    const-string v1, "major"

    .line 49
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "minor"

    .line 50
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "patch"

    .line 51
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string v4, "prerelease"

    .line 52
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 54
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_0

    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_0
    return-object v2
.end method


# virtual methods
.method public onCreate()Z
    .locals 3

    .line 19
    invoke-super {p0}, Lapp/notifee/core/InitProvider;->onCreate()Z

    move-result v0

    .line 21
    new-instance v1, Lapp/notifee/core/NotifeeConfig$Builder;

    invoke-direct {v1}, Lapp/notifee/core/NotifeeConfig$Builder;-><init>()V

    .line 22
    invoke-direct {p0}, Lio/invertase/notifee/NotifeeInitProvider;->getApplicationVersionString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lapp/notifee/core/NotifeeConfig$Builder;->setProductVersion(Ljava/lang/String;)V

    .line 23
    invoke-direct {p0}, Lio/invertase/notifee/NotifeeInitProvider;->getReactNativeVersionString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lapp/notifee/core/NotifeeConfig$Builder;->setFrameworkVersion(Ljava/lang/String;)V

    .line 24
    new-instance v2, Lio/invertase/notifee/NotifeeEventSubscriber;

    invoke-direct {v2}, Lio/invertase/notifee/NotifeeEventSubscriber;-><init>()V

    invoke-virtual {v1, v2}, Lapp/notifee/core/NotifeeConfig$Builder;->setEventSubscriber(Lapp/notifee/core/interfaces/EventListener;)V

    .line 26
    invoke-virtual {v1}, Lapp/notifee/core/NotifeeConfig$Builder;->build()Lapp/notifee/core/NotifeeConfig;

    move-result-object v1

    invoke-static {v1}, Lapp/notifee/core/Notifee;->configure(Lapp/notifee/core/NotifeeConfig;)V

    return v0
.end method
