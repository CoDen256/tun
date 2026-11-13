.class Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;
.super Ljava/lang/Object;
.source "RNInstallReferrerClient.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InstallReferrerStateListenerProxy"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;


# direct methods
.method private constructor <init>(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)V
    .locals 0

    iput-object p1, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;->this$0:Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;-><init>(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 68
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p1

    :try_start_0
    const-string p2, "onInstallReferrerSetupFinished"

    .line 70
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    aget-object p2, p3, p2

    instance-of p3, p2, Ljava/lang/Integer;

    if-eqz p3, :cond_0

    .line 71
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;->onInstallReferrerSetupFinished(I)V

    goto :goto_0

    :cond_0
    const-string p2, "onInstallReferrerServiceDisconnected"

    .line 72
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 73
    invoke-virtual {p0}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;->onInstallReferrerServiceDisconnected()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    .line 76
    new-instance p2, Ljava/lang/RuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "unexpected invocation exception: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public onInstallReferrerServiceDisconnected()V
    .locals 2

    const-string v0, "RNInstallReferrerClient"

    const-string v1, "InstallReferrerService disconnected"

    .line 121
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onInstallReferrerSetupFinished(I)V
    .locals 4

    const-string v0, "getInstallReferrer"

    const-string v1, "InstallReferrerState"

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const-string p1, "FEATURE_NOT_SUPPORTED"

    .line 106
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_1
    const-string p1, "SERVICE_UNAVAILABLE"

    .line 111
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    :try_start_0
    const-string p1, "OK"

    .line 88
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-static {}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->-$$Nest$sfgetInstallReferrerClientClazz()Ljava/lang/Class;

    move-result-object p1

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object v2, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;->this$0:Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;

    .line 90
    invoke-static {v2}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->-$$Nest$fgetmReferrerClient(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)Ljava/lang/Object;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 91
    invoke-static {}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->-$$Nest$sfgetReferrerDetailsClazz()Ljava/lang/Class;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v0, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    .line 92
    invoke-virtual {v0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;->this$0:Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;

    .line 93
    invoke-static {v0}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->-$$Nest$fgetsharedPreferences(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "installReferrer"

    .line 94
    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 95
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 97
    invoke-static {}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->-$$Nest$sfgetInstallReferrerClientClazz()Ljava/lang/Class;

    move-result-object p1

    const-string v0, "endConnection"

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object v0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;->this$0:Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;

    .line 98
    invoke-static {v0}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->-$$Nest$fgetmReferrerClient(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)Ljava/lang/Object;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 100
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RNInstallReferrerClient exception. getInstallReferrer will be unavailable: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 101
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    :goto_0
    return-void
.end method
