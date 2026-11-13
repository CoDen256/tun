.class public final synthetic Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic f$0:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/bridge/Promise;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule$$ExternalSyntheticLambda1;->f$0:Lcom/facebook/react/bridge/Promise;

    invoke-static {v0, p1}, Lio/invertase/firebase/functions/ReactNativeFirebaseFunctionsModule;->lambda$httpsCallableFromUrl$3(Lcom/facebook/react/bridge/Promise;Ljava/lang/Exception;)V

    return-void
.end method
