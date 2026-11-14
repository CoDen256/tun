.class public Lcom/reactnativegooglesignin/RNGoogleSigninModule;
.super Lcom/reactnativegooglesignin/NativeGoogleSigninSpec;
.source "RNGoogleSigninModule.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;,
        Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;,
        Lcom/reactnativegooglesignin/RNGoogleSigninModule$TokenClearingTask;
    }
.end annotation


# static fields
.field public static final PLAY_SERVICES_NOT_AVAILABLE:Ljava/lang/String; = "PLAY_SERVICES_NOT_AVAILABLE"

.field public static final RC_SIGN_IN:I = 0x2329

.field public static final REQUEST_CODE_ADD_SCOPES:I = 0xd02f

.field public static final REQUEST_CODE_RECOVER_AUTH:I = 0xd02e

.field private static final SHOULD_RECOVER:Ljava/lang/String; = "SHOULD_RECOVER"


# instance fields
.field private _apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

.field private pendingAuthRecovery:Lcom/reactnativegooglesignin/PendingAuthRecovery;

.field private final signInOrAddScopesPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

.field private final silentSignInPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

.field private final tokenClearingPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

.field private final tokenRetrievalPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;


# direct methods
.method public static synthetic $r8$lambda$1lvTZVx5JbDj7C8iFRYF2Heztw8(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->lambda$revokeAccess$4(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic $r8$lambda$6bZe58BwVibPkT208OaZbb-3obU(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->lambda$signIn$2(Landroid/app/Activity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$OVSFtwG36-hw5FAU6uADm8OHHF4(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->lambda$signInSilently$0(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic $r8$lambda$_JLlaC_XS_LxAyM_zMr8JNoO2hI(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V
    .locals 0

    invoke-direct {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->lambda$signInSilently$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$_Z20YeGFbobW5KwJdY8YOppI7oM(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->lambda$signOut$3(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetsignInOrAddScopesPromiseWrapper(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/reactnativegooglesignin/PromiseWrapper;
    .locals 0

    iget-object p0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->signInOrAddScopesPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgettokenRetrievalPromiseWrapper(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/reactnativegooglesignin/PromiseWrapper;
    .locals 0

    iget-object p0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenRetrievalPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputpendingAuthRecovery(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/reactnativegooglesignin/PendingAuthRecovery;)V
    .locals 0

    iput-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->pendingAuthRecovery:Lcom/reactnativegooglesignin/PendingAuthRecovery;

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleSignInTaskResult(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/google/android/gms/tasks/Task;Lcom/reactnativegooglesignin/PromiseWrapper;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->handleSignInTaskResult(Lcom/google/android/gms/tasks/Task;Lcom/reactnativegooglesignin/PromiseWrapper;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrerunFailedAuthTokenTask(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V
    .locals 0

    invoke-direct {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rerunFailedAuthTokenTask()V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 2

    .line 74
    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/NativeGoogleSigninSpec;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    .line 61
    new-instance v0, Lcom/reactnativegooglesignin/PromiseWrapper;

    const-string v1, "RNGoogleSignin"

    invoke-direct {v0, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->signInOrAddScopesPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 62
    new-instance v0, Lcom/reactnativegooglesignin/PromiseWrapper;

    invoke-direct {v0, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->silentSignInPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 63
    new-instance v0, Lcom/reactnativegooglesignin/PromiseWrapper;

    invoke-direct {v0, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenRetrievalPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 64
    new-instance v0, Lcom/reactnativegooglesignin/PromiseWrapper;

    invoke-direct {v0, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenClearingPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 75
    new-instance v0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener-IA;)V

    invoke-virtual {p1, v0}, Lcom/facebook/react/bridge/ReactApplicationContext;->addActivityEventListener(Lcom/facebook/react/bridge/ActivityEventListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Landroid/app/Activity;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/facebook/react/bridge/ReactApplicationContext;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p0

    return-object p0
.end method

.method private handleSignInTaskResult(Lcom/google/android/gms/tasks/Task;Lcom/reactnativegooglesignin/PromiseWrapper;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;",
            ">;",
            "Lcom/reactnativegooglesignin/PromiseWrapper;",
            ")V"
        }
    .end annotation

    .line 160
    :try_start_0
    const-class v0, Lcom/google/android/gms/common/api/ApiException;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->getResult(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    if-nez p1, :cond_0

    const-string p1, "GoogleSignInAccount instance was null"

    .line 162
    invoke-virtual {p2, p1}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/String;)V

    goto :goto_0

    .line 164
    :cond_0
    invoke-static {p1}, Lcom/reactnativegooglesignin/Utils;->getUserProperties(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    .line 165
    invoke-virtual {p2, p1}, Lcom/reactnativegooglesignin/PromiseWrapper;->resolve(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/android/gms/common/api/ApiException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 168
    invoke-virtual {p2, p1}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method private handleSignOutOrRevokeAccessTask(Lcom/google/android/gms/tasks/Task;Lcom/facebook/react/bridge/Promise;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/facebook/react/bridge/Promise;",
            ")V"
        }
    .end annotation

    .line 257
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 258
    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    .line 260
    :cond_0
    invoke-static {p1}, Lcom/reactnativegooglesignin/Utils;->getExceptionCode(Lcom/google/android/gms/tasks/Task;)I

    move-result p1

    .line 261
    invoke-static {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInStatusCodes;->getStatusCodeString(I)Ljava/lang/String;

    move-result-object v0

    .line 262
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private synthetic lambda$revokeAccess$4(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 274
    invoke-direct {p0, p2, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->handleSignOutOrRevokeAccessTask(Lcom/google/android/gms/tasks/Task;Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method

.method private synthetic lambda$signIn$2(Landroid/app/Activity;)V
    .locals 2

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    .line 187
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->getSignInIntent()Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x2329

    .line 188
    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private synthetic lambda$signInSilently$0(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->silentSignInPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 153
    invoke-direct {p0, p1, v0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->handleSignInTaskResult(Lcom/google/android/gms/tasks/Task;Lcom/reactnativegooglesignin/PromiseWrapper;)V

    return-void
.end method

.method private synthetic lambda$signInSilently$1()V
    .locals 2

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    .line 148
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->silentSignIn()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    .line 149
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->silentSignInPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 151
    invoke-direct {p0, v0, v1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->handleSignInTaskResult(Lcom/google/android/gms/tasks/Task;Lcom/reactnativegooglesignin/PromiseWrapper;)V

    goto :goto_0

    .line 153
    :cond_0
    new-instance v1, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda2;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :goto_0
    return-void
.end method

.method private synthetic lambda$signOut$3(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 253
    invoke-direct {p0, p2, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->handleSignOutOrRevokeAccessTask(Lcom/google/android/gms/tasks/Task;Lcom/facebook/react/bridge/Promise;)V

    return-void
.end method

.method static rejectWithNullActivity(Lcom/facebook/react/bridge/Promise;)V
    .locals 2

    const-string v0, "RNGoogleSignin"

    const-string v1, "activity is null"

    .line 120
    invoke-interface {p0, v0, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private rejectWithNullClientError(Lcom/facebook/react/bridge/Promise;)V
    .locals 2

    const-string v0, "RNGoogleSignin"

    const-string v1, "apiClient is null - call configure() first"

    .line 406
    invoke-interface {p1, v0, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private rerunFailedAuthTokenTask()V
    .locals 4

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->pendingAuthRecovery:Lcom/reactnativegooglesignin/PendingAuthRecovery;

    .line 236
    invoke-virtual {v0}, Lcom/reactnativegooglesignin/PendingAuthRecovery;->getUserProperties()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 238
    new-instance v1, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;

    invoke-direct {v1, p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/facebook/react/bridge/WritableMap;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    const/4 v3, 0x0

    aput-object v3, v2, v0

    invoke-virtual {v1, v2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenRetrievalPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    const-string v1, "rerunFailedAuthTokenTask: recovery failed"

    .line 241
    invoke-virtual {v0, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private startTokenRetrievalTaskWithRecovery(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    .locals 5

    .line 308
    invoke-static {p1}, Lcom/reactnativegooglesignin/Utils;->getUserProperties(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    .line 309
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "SHOULD_RECOVER"

    const/4 v2, 0x1

    .line 310
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    .line 311
    new-instance v1, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;

    invoke-direct {v1, p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/facebook/react/bridge/WritableMap;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    aput-object v0, v3, v2

    invoke-virtual {v1, v3}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$AccessTokenRetrievalTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method public addScopes(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 4
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 194
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 196
    invoke-static {p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullActivity(Lcom/facebook/react/bridge/Promise;)V

    return-void

    .line 199
    :cond_0
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 p1, 0x0

    .line 201
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object v2, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->signInOrAddScopesPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    const-string v3, "addScopes"

    .line 204
    invoke-virtual {v2, p2, v3}, Lcom/reactnativegooglesignin/PromiseWrapper;->setPromiseWithInProgressCheck(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    const-string p2, "scopes"

    .line 206
    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    invoke-static {p1}, Lcom/reactnativegooglesignin/Utils;->createScopesArray(Lcom/facebook/react/bridge/ReadableArray;)[Lcom/google/android/gms/common/api/Scope;

    move-result-object p1

    const p2, 0xd02f

    .line 208
    invoke-static {v0, p2, v1, p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->requestPermissions(Landroid/app/Activity;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;[Lcom/google/android/gms/common/api/Scope;)V

    return-void
.end method

.method public clearCachedAccessToken(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenClearingPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    const-string v1, "clearCachedAccessToken"

    .line 291
    invoke-virtual {v0, p2, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;->setPromiseWithInProgressCheck(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    .line 292
    new-instance p2, Lcom/reactnativegooglesignin/RNGoogleSigninModule$TokenClearingTask;

    invoke-direct {p2, p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$TokenClearingTask;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$TokenClearingTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public configure(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 10
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    const-string v0, "scopes"

    .line 128
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    :goto_0
    const-string v1, "webClientId"

    .line 129
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v5, v1

    goto :goto_1

    :cond_1
    move-object v5, v3

    :goto_1
    const-string v1, "offlineAccess"

    .line 130
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_2

    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v4

    goto :goto_2

    :cond_2
    move v1, v6

    :goto_2
    const-string v2, "forceCodeForRefreshToken"

    .line 131
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    move v7, v4

    goto :goto_3

    :cond_3
    move v7, v6

    :goto_3
    const-string v2, "accountName"

    .line 132
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v8, v2

    goto :goto_4

    :cond_4
    move-object v8, v3

    :goto_4
    const-string v2, "hostedDomain"

    .line 133
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    move-object v9, p1

    goto :goto_5

    :cond_5
    move-object v9, v3

    .line 135
    :goto_5
    invoke-static {v0}, Lcom/reactnativegooglesignin/Utils;->createScopesArray(Lcom/facebook/react/bridge/ReadableArray;)[Lcom/google/android/gms/common/api/Scope;

    move-result-object v4

    move v6, v1

    invoke-static/range {v4 .. v9}, Lcom/reactnativegooglesignin/Utils;->getSignInOptions([Lcom/google/android/gms/common/api/Scope;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object p1

    .line 136
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getClient(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object p1

    iput-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    .line 137
    invoke-interface {p2, v3}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method public getCurrentUser()Lcom/facebook/react/bridge/WritableMap;
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 285
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 286
    :cond_0
    invoke-static {v0}, Lcom/reactnativegooglesignin/Utils;->getUserProperties(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getTokenClearingPromiseWrapper()Lcom/reactnativegooglesignin/PromiseWrapper;
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenClearingPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    return-object v0
.end method

.method public getTokenRetrievalPromiseWrapper()Lcom/reactnativegooglesignin/PromiseWrapper;
    .locals 1

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenRetrievalPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    return-object v0
.end method

.method public getTokens(Lcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 297
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    const-string v1, "getTokens"

    if-nez v0, :cond_0

    const-string v0, "getTokens requires a user to be signed in"

    .line 299
    invoke-interface {p1, v1, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v2, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->tokenRetrievalPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    .line 303
    invoke-virtual {v2, p1, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;->setPromiseWithInProgressCheck(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    .line 304
    invoke-direct {p0, v0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->startTokenRetrievalTaskWithRecovery(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    return-void
.end method

.method protected getTypedExportedConstants()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x2

    .line 81
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BUTTON_SIZE_ICON"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    .line 82
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BUTTON_SIZE_STANDARD"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BUTTON_SIZE_WIDE"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x30d5

    .line 84
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SIGN_IN_CANCELLED"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x4

    .line 85
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SIGN_IN_REQUIRED"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "SCOPES_ALREADY_GRANTED"

    const-string v2, "NEVER_HAPPENS_ON_ANDROID"

    .line 86
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ONE_TAP_START_FAILED"

    .line 87
    invoke-interface {v0, v1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "NO_SAVED_CREDENTIAL_FOUND"

    .line 88
    invoke-interface {v0, v1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "IN_PROGRESS"

    const-string v2, "ASYNC_OP_IN_PROGRESS"

    .line 89
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "PLAY_SERVICES_NOT_AVAILABLE"

    .line 90
    invoke-interface {v0, v1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public hasPreviousSignIn()Z
    .locals 1
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
        isBlockingSynchronousMethod = true
    .end annotation

    .line 279
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public playServicesAvailable(ZLcom/facebook/react/bridge/Promise;)V
    .locals 3
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "RNGoogleSignin"

    const-string v0, "could not determine playServicesAvailable, activity is null"

    .line 100
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    invoke-static {p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullActivity(Lcom/facebook/react/bridge/Promise;)V

    return-void

    .line 105
    :cond_0
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v1

    .line 106
    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    if-eqz v2, :cond_2

    if-eqz p1, :cond_1

    .line 109
    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->isUserResolvableError(I)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x964

    .line 111
    invoke-virtual {v1, v0, v2, p1}, Lcom/google/android/gms/common/GoogleApiAvailability;->getErrorDialog(Landroid/app/Activity;II)Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    :cond_1
    const-string p1, "PLAY_SERVICES_NOT_AVAILABLE"

    const-string v0, "Play services not available"

    .line 113
    invoke-interface {p2, p1, v0}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    .line 115
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public revokeAccess(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    if-nez v0, :cond_0

    .line 269
    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullClientError(Lcom/facebook/react/bridge/Promise;)V

    return-void

    .line 273
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->revokeAccess()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda1;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/Promise;)V

    .line 274
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public signIn(Lcom/facebook/react/bridge/ReadableMap;Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    if-nez p1, :cond_0

    .line 175
    invoke-direct {p0, p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullClientError(Lcom/facebook/react/bridge/Promise;)V

    return-void

    .line 179
    :cond_0
    invoke-virtual {p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p1

    if-nez p1, :cond_1

    .line 182
    invoke-static {p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullActivity(Lcom/facebook/react/bridge/Promise;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->signInOrAddScopesPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    const-string v1, "signIn"

    .line 185
    invoke-virtual {v0, p2, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;->setPromiseWithInProgressCheck(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    .line 186
    new-instance p2, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda0;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Landroid/app/Activity;)V

    invoke-static {p2}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public signInSilently(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    if-nez v0, :cond_0

    .line 143
    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullClientError(Lcom/facebook/react/bridge/Promise;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->silentSignInPromiseWrapper:Lcom/reactnativegooglesignin/PromiseWrapper;

    const-string v1, "signInSilently"

    .line 146
    invoke-virtual {v0, p1, v1}, Lcom/reactnativegooglesignin/PromiseWrapper;->setPromiseWithInProgressCheck(Lcom/facebook/react/bridge/Promise;Ljava/lang/String;)V

    .line 147
    new-instance p1, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda4;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    invoke-static {p1}, Lcom/facebook/react/bridge/UiThreadUtil;->runOnUiThread(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public signOut(Lcom/facebook/react/bridge/Promise;)V
    .locals 2
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->_apiClient:Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    if-nez v0, :cond_0

    .line 248
    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->rejectWithNullClientError(Lcom/facebook/react/bridge/Promise;)V

    return-void

    .line 252
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->signOut()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/Promise;)V

    .line 253
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
