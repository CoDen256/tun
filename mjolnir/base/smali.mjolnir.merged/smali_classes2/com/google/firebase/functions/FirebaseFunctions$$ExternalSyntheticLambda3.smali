.class public final synthetic Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/functions/FirebaseFunctions;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda3;->f$0:Lcom/google/firebase/functions/FirebaseFunctions;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda3;->f$0:Lcom/google/firebase/functions/FirebaseFunctions;

    invoke-virtual {v0, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->lambda$call$3$com-google-firebase-functions-FirebaseFunctions(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
