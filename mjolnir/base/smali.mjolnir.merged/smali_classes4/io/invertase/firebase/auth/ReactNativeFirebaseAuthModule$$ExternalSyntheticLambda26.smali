.class public final synthetic Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic f$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

.field public final synthetic f$1:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public synthetic constructor <init>(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$$ExternalSyntheticLambda26;->f$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iput-object p2, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$$ExternalSyntheticLambda26;->f$1:Lcom/facebook/react/bridge/Promise;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 2

    iget-object v0, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$$ExternalSyntheticLambda26;->f$0:Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;

    iget-object v1, p0, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule$$ExternalSyntheticLambda26;->f$1:Lcom/facebook/react/bridge/Promise;

    invoke-static {v0, v1, p1}, Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;->$r8$lambda$HxAiEhwsuoUF5-_PiWvV1nIbBh8(Lio/invertase/firebase/auth/ReactNativeFirebaseAuthModule;Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method
