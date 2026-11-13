.class public Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "AppleAuthenticationAndroidModule.java"


# static fields
.field private static final E_NOT_CONFIGURED_ERROR:Ljava/lang/String; = "E_NOT_CONFIGURED_ERROR"

.field private static final E_SIGNIN_CANCELLED_ERROR:Ljava/lang/String; = "E_SIGNIN_CANCELLED_ERROR"

.field private static final E_SIGNIN_FAILED_ERROR:Ljava/lang/String; = "E_SIGNIN_FAILED_ERROR"


# instance fields
.field private configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

.field private final reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;


# direct methods
.method static bridge synthetic -$$Nest$fgetconfiguration(Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;
    .locals 0

    iget-object p0, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    iput-object p1, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->reactContext:Lcom/facebook/react/bridge/ReactApplicationContext;

    return-void
.end method

.method private static bytesToHex([B)Ljava/lang/String;
    .locals 4

    .line 51
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    .line 52
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 53
    aget-byte v2, p0, v1

    shr-int/lit8 v2, v2, 0x4

    and-int/lit8 v2, v2, 0xf

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 54
    aget-byte v2, p0, v1

    and-int/lit8 v2, v2, 0xf

    invoke-static {v2, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getFragmentManagerHelper()Landroidx/fragment/app/FragmentManager;
    .locals 2

    .line 85
    invoke-virtual {p0}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 86
    instance-of v1, v0, Landroidx/fragment/app/FragmentActivity;

    if-nez v1, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public configure(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 7
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 96
    sget-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    .line 97
    sget-object v0, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    .line 98
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nonceEnabled"

    .line 99
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 100
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 99
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "clientId"

    .line 105
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v3

    const-string v4, ""

    if-eqz v3, :cond_1

    .line 106
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, v4

    :goto_1
    const-string v3, "redirectUri"

    .line 109
    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 110
    invoke-interface {p1, v3}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    :cond_2
    move-object v3, v4

    :goto_2
    const-string v5, "scope"

    .line 113
    invoke-interface {p1, v5}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 114
    invoke-interface {p1, v5}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 116
    invoke-static {v5}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->valueOf(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    :cond_3
    const-string v5, "responseType"

    .line 120
    invoke-interface {p1, v5}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 121
    invoke-interface {p1, v5}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 123
    invoke-static {v5}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->valueOf(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    :cond_4
    const-string v5, "state"

    .line 127
    invoke-interface {p1, v5}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 128
    invoke-interface {p1, v5}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    :cond_5
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "nonce"

    .line 132
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 133
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_3

    .line 136
    :cond_6
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_3
    move-object v4, p1

    :try_start_0
    const-string p1, "SHA-256"

    .line 141
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    .line 142
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 143
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    .line 144
    invoke-static {p1}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->bytesToHex([B)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    :cond_7
    move-object p1, v4

    .line 149
    :goto_4
    new-instance v1, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    invoke-direct {v1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;-><init>()V

    .line 150
    invoke-virtual {v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->clientId(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object v1

    .line 151
    invoke-virtual {v1, v3}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->redirectUri(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object v1

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    .line 152
    invoke-virtual {v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->responseType(Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object v1

    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    .line 153
    invoke-virtual {v1, v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->scope(Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object v1

    .line 154
    invoke-virtual {v1, v0}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->state(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object v0

    .line 155
    invoke-virtual {v0, v4}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->rawNonce(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object v0

    .line 156
    invoke-virtual {v0, p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->nonce(Ljava/lang/String;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;

    move-result-object p1

    .line 157
    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Builder;->build()Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    return-void
.end method

.method public getConstants()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 62
    sget-object v1, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    invoke-virtual {v1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ALL"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v1, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->CODE:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    invoke-virtual {v1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "CODE"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v1, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->ID_TOKEN:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;

    invoke-virtual {v1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$ResponseType;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "ID_TOKEN"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 67
    sget-object v3, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->ALL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    invoke-virtual {v3}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->EMAIL:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    invoke-virtual {v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "EMAIL"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v2, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->NAME:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;

    invoke-virtual {v2}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration$Scope;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NAME"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "E_NOT_CONFIGURED_ERROR"

    .line 72
    invoke-interface {v2, v3, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "E_SIGNIN_FAILED_ERROR"

    .line 73
    invoke-interface {v2, v3, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "E_SIGNIN_CANCELLED_ERROR"

    .line 74
    invoke-interface {v2, v3, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "ResponseType"

    .line 76
    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "Scope"

    .line 77
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    .line 78
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "isSupported"

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "RNAppleAuthModuleAndroid"

    return-object v0
.end method

.method public signIn(Lcom/facebook/react/bridge/Promise;)V
    .locals 5
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    const-string v1, "E_NOT_CONFIGURED_ERROR"

    if-nez v0, :cond_0

    .line 163
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;)V

    return-void

    .line 166
    :cond_0
    invoke-direct {p0}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->getFragmentManagerHelper()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    if-nez v0, :cond_1

    .line 169
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;)V

    return-void

    .line 173
    :cond_1
    new-instance v1, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;

    invoke-direct {v1, p0, p1}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;-><init>(Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;Lcom/facebook/react/bridge/Promise;)V

    .line 225
    new-instance v2, Lcom/RNAppleAuthentication/SignInWithAppleService;

    iget-object v3, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->configuration:Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    const-string v4, "SignInWithAppleButton-$id-SignInWebViewDialogFragment"

    invoke-direct {v2, v0, v4, v3, v1}, Lcom/RNAppleAuthentication/SignInWithAppleService;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;Lcom/RNAppleAuthentication/SignInWithAppleCallback;)V

    .line 232
    invoke-virtual {p0}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_2

    .line 234
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Activity is not found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 236
    :cond_2
    new-instance p1, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$2;

    invoke-direct {p1, p0, v2}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$2;-><init>(Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;Lcom/RNAppleAuthentication/SignInWithAppleService;)V

    invoke-virtual {v0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
