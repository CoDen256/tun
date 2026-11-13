.class public final synthetic Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

.field public final synthetic f$1:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public synthetic constructor <init>(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;->f$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    iput-object p2, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;->f$1:Lcom/facebook/react/bridge/Promise;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    iget-object v0, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;->f$0:Lcom/reactnativegooglesignin/RNGoogleSigninModule;

    iget-object v1, p0, Lcom/reactnativegooglesignin/RNGoogleSigninModule$$ExternalSyntheticLambda3;->f$1:Lcom/facebook/react/bridge/Promise;

    invoke-static {v0, v1, p1}, Lcom/reactnativegooglesignin/RNGoogleSigninModule;->$r8$lambda$_Z20YeGFbobW5KwJdY8YOppI7oM(Lcom/reactnativegooglesignin/RNGoogleSigninModule;Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
