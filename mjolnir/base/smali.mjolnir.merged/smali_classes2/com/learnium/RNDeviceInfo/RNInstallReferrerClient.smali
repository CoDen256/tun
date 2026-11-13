.class public Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;
.super Ljava/lang/Object;
.source "RNInstallReferrerClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;
    }
.end annotation


# static fields
.field private static InstallReferrerClientClazz:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static InstallReferrerStateListenerClazz:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final R_RESPONSE_FEATURE_NOT_SUPPORTED:I = 0x2

.field private static final R_RESPONSE_OK:I = 0x0

.field private static final R_RESPONSE_SERVICE_UNAVAILABLE:I = 0x1

.field private static ReferrerDetailsClazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field private installReferrerStateListener:Ljava/lang/Object;

.field private mReferrerClient:Ljava/lang/Object;

.field private final sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static bridge synthetic -$$Nest$fgetmReferrerClient(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->mReferrerClient:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetsharedPreferences(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;)Landroid/content/SharedPreferences;
    .locals 0

    iget-object p0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->sharedPreferences:Landroid/content/SharedPreferences;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetInstallReferrerClientClazz()Ljava/lang/Class;
    .locals 1

    sget-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerClientClazz:Ljava/lang/Class;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetReferrerDetailsClazz()Ljava/lang/Class;
    .locals 1

    sget-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->ReferrerDetailsClazz:Ljava/lang/Class;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    :try_start_0
    const-string v0, "com.android.installreferrer.api.InstallReferrerClient"

    .line 19
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerClientClazz:Ljava/lang/Class;

    const-string v0, "com.android.installreferrer.api.InstallReferrerStateListener"

    .line 20
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerStateListenerClazz:Ljava/lang/Class;

    const-string v0, "com.android.installreferrer.api.ReferrerDetails"

    .line 21
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->ReferrerDetailsClazz:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 23
    :catch_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "RNInstallReferrerClient exception. \'installreferrer\' APIs are unavailable."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "react-native-device-info"

    const/4 v1, 0x0

    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->sharedPreferences:Landroid/content/SharedPreferences;

    sget-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerClientClazz:Ljava/lang/Class;

    if-eqz v0, :cond_1

    sget-object v2, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerStateListenerClazz:Ljava/lang/Class;

    if-eqz v2, :cond_1

    sget-object v2, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->ReferrerDetailsClazz:Ljava/lang/Class;

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v2, "newBuilder"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    .line 45
    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v1

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const/4 p1, 0x0

    .line 46
    invoke-virtual {v0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "build"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v4, v1, [Ljava/lang/Object;

    .line 48
    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->mReferrerClient:Ljava/lang/Object;

    sget-object v0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerStateListenerClazz:Ljava/lang/Class;

    .line 52
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Class;

    sget-object v4, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerStateListenerClazz:Ljava/lang/Class;

    aput-object v4, v2, v1

    new-instance v4, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;

    invoke-direct {v4, p0, p1}, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy;-><init>(Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient$InstallReferrerStateListenerProxy-IA;)V

    .line 51
    invoke-static {v0, v2, v4}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->installReferrerStateListener:Ljava/lang/Object;

    sget-object p1, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerClientClazz:Ljava/lang/Class;

    const-string v0, "startConnection"

    new-array v2, v3, [Ljava/lang/Class;

    sget-object v4, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->InstallReferrerStateListenerClazz:Ljava/lang/Class;

    aput-object v4, v2, v1

    .line 57
    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object v0, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->mReferrerClient:Ljava/lang/Object;

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/learnium/RNDeviceInfo/RNInstallReferrerClient;->installReferrerStateListener:Ljava/lang/Object;

    aput-object v3, v2, v1

    .line 58
    invoke-virtual {p1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 60
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

    .line 61
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_1
    :goto_0
    return-void
.end method
