.class public final synthetic Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/SuccessContinuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/functions/FirebaseContextProvider;

.field public final synthetic f$1:Lcom/google/android/gms/tasks/Task;

.field public final synthetic f$2:Lcom/google/android/gms/tasks/Task;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/functions/FirebaseContextProvider;Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;->f$0:Lcom/google/firebase/functions/FirebaseContextProvider;

    iput-object p2, p0, Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;->f$1:Lcom/google/android/gms/tasks/Task;

    iput-object p3, p0, Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;->f$2:Lcom/google/android/gms/tasks/Task;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;->f$0:Lcom/google/firebase/functions/FirebaseContextProvider;

    iget-object v1, p0, Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;->f$1:Lcom/google/android/gms/tasks/Task;

    iget-object v2, p0, Lcom/google/firebase/functions/FirebaseContextProvider$$ExternalSyntheticLambda1;->f$2:Lcom/google/android/gms/tasks/Task;

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/firebase/functions/FirebaseContextProvider;->lambda$getContext$2$com-google-firebase-functions-FirebaseContextProvider(Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/tasks/Task;Ljava/lang/Void;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
