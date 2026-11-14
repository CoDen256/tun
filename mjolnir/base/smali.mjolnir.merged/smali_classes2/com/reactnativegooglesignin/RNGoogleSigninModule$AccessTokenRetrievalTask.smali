.class Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;
.super Landroid/os/AsyncTask;
.source "RNGoogleSigninModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/reactnativegooglesignin/RNGoogleSigninModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AccessTokenRetrievalTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/facebook/react/bridge/WritableMap;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final weakModuleRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/reactnativegooglesignin/RNGoogleSigninModule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V
    .locals 1

    .line 318
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 319
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->weakModuleRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private attemptRecovery(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Ljava/lang/Exception;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 2

    .line 366
    invoke-static {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->access$100(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p3, 0x0

    .line 368
    invoke-static {p1, p3}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$fputpendingAuthRecovery(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/reactnativegooglesignin/PendingAuthRecovery;)V

    .line 369
    invoke-virtual {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getTokenRetrievalPromiseWrapper()Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Cannot attempt recovery auth because app is not in foreground. "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 370
    invoke-virtual {p2}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 369
    invoke-virtual {p1, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/String;)V

    goto :goto_0

    .line 372
    :cond_0
    new-instance v1, Lcom/reactnativegooglesignin/PendingAuthRecovery;

    invoke-direct {v1, p3}, Lcom/reactnativegooglesignin/PendingAuthRecovery;-><init>(Lcom/facebook/react/bridge/WritableMap;)V

    invoke-static {p1, v1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$fputpendingAuthRecovery(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/reactnativegooglesignin/PendingAuthRecovery;)V

    .line 373
    check-cast p2, Lcom/google/android/gms/auth/UserRecoverableAuthException;

    .line 374
    invoke-virtual {p2}, Lcom/google/android/gms/auth/UserRecoverableAuthException;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const p2, 0xd02e

    .line 375
    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void
.end method

.method private handleException(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Ljava/lang/Exception;Lcom/facebook/react/bridge/WritableMap;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 2

    .line 350
    instance-of v0, p2, Lcom/google/android/gms/auth/UserRecoverableAuthException;

    if-eqz v0, :cond_1

    if-eqz p4, :cond_0

    const-string v0, "SHOULD_RECOVER"

    .line 353
    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/WritableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 354
    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/WritableMap;->getBoolean(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_0

    .line 356
    invoke-direct {p0, p1, p2, p3}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->attemptRecovery(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Ljava/lang/Exception;Lcom/facebook/react/bridge/WritableMap;)V

    goto :goto_0

    .line 358
    :cond_0
    invoke-virtual {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getTokenRetrievalPromiseWrapper()Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/Exception;)V

    goto :goto_0

    .line 361
    :cond_1
    invoke-virtual {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getTokenRetrievalPromiseWrapper()Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private insertAccessTokenIntoUserProperties(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/WritableMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/gms/auth/GoogleAuthException;
        }
    .end annotation

    const-string v0, "user"

    .line 340
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/WritableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v0

    const-string v1, "email"

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 341
    invoke-static {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->access$000(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p1

    new-instance v1, Landroid/accounts/Account;

    const-string v2, "com.google"

    invoke-direct {v1, v0, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scopes"

    .line 343
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/WritableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v0

    invoke-static {v0}, Lcom/reactnativegooglesignin/Utils;->scopesToString(Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/String;

    move-result-object v0

    .line 341
    invoke-static {p1, v1, v0}, Lcom/google/android/gms/auth/GoogleAuthUtil;->getToken(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "accessToken"

    .line 345
    invoke-interface {p2, v0, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 314
    check-cast p1, [Lcom/facebook/react/bridge/WritableMap;

    invoke-virtual {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->doInBackground([Lcom/facebook/react/bridge/WritableMap;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/facebook/react/bridge/WritableMap;)Ljava/lang/Void;
    .locals 6

    const/4 v0, 0x0

    .line 324
    aget-object v0, p1, v0

    iget-object v1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->weakModuleRef:Ljava/lang/ref/WeakReference;

    .line 325
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 330
    :cond_0
    :try_start_0
    invoke-direct {p0, v1, v0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->insertAccessTokenIntoUserProperties(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/WritableMap;)V

    .line 331
    invoke-virtual {v1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getTokenRetrievalPromiseWrapper()Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/reactnativegooglesignin/PromiseWrapper;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 333
    array-length v4, p1

    const/4 v5, 0x2

    if-lt v4, v5, :cond_1

    const/4 v4, 0x1

    aget-object p1, p1, v4

    goto :goto_0

    :cond_1
    move-object p1, v2

    .line 334
    :goto_0
    invoke-direct {p0, v1, v3, v0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->handleException(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Ljava/lang/Exception;Lcom/facebook/react/bridge/WritableMap;Lcom/facebook/react/bridge/WritableMap;)V

    :goto_1
    return-object v2
.end method
