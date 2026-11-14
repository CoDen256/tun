.class Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;
.super Lcom/facebook/react/bridge/BaseActivityEventListener;
.source "RNGoogleSigninModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/reactnativegooglesignin/RNGoogleSigninModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RNGoogleSigninActivityEventListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;


# direct methods
.method private constructor <init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V
    .locals 0

    iput-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;->this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    .line 212
    invoke-direct {p0}, Lcom/facebook/react/bridge/BaseActivityEventListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;-><init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    return-void
.end method


# virtual methods
.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 0

    const/16 p1, 0x2329

    if-ne p2, p1, :cond_0

    .line 217
    invoke-static {p4}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getSignedInAccountFromIntent(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iget-object p2, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;->this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    .line 218
    invoke-static {p2}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$fgetsignInOrAddScopesPromiseWrapper(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p3

    invoke-static {p2, p1, p3}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$mhandleSignInTaskResult(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/google/android/gms/tasks/Task;Lcom/reactnativegooglesignin/PromiseWrapper;)V

    goto :goto_0

    :cond_0
    const p1, 0xd02e

    const/4 p4, -0x1

    if-ne p2, p1, :cond_2

    if-ne p3, p4, :cond_1

    iget-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;->this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    .line 221
    invoke-static {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$mrerunFailedAuthTokenTask(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;->this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    .line 223
    invoke-static {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$fgettokenRetrievalPromiseWrapper(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p1

    const-string p2, "Failed authentication recovery attempt, probably user-rejected."

    invoke-virtual {p1, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const p1, 0xd02f

    if-ne p2, p1, :cond_4

    if-ne p3, p4, :cond_3

    iget-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;->this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    .line 227
    invoke-static {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$fgetsignInOrAddScopesPromiseWrapper(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->resolve(Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$RNGoogleSigninActivityEventListener;->this$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    .line 229
    invoke-static {p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->-$$Nest$fgetsignInOrAddScopesPromiseWrapper(Lcom/reactnativegooglesignin/RNGoogleSigninModule;)Lcom/reactnativegooglesignin/PromiseWrapper;

    move-result-object p1

    const-string p2, "Failed to add scopes."

    invoke-virtual {p1, p2}, Lcom/reactnativegooglesignin/PromiseWrapper;->reject(Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method
