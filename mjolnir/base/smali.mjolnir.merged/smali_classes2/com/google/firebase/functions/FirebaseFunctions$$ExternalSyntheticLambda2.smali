.class public final synthetic Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/functions/FirebaseFunctions;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/Object;

.field public final synthetic f$3:Lcom/google/firebase/functions/HttpsCallOptions;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$0:Lcom/google/firebase/functions/FirebaseFunctions;

    iput-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$2:Ljava/lang/Object;

    iput-object p4, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$3:Lcom/google/firebase/functions/HttpsCallOptions;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$0:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v1, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$2:Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;->f$3:Lcom/google/firebase/functions/HttpsCallOptions;

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->lambda$call$2$com-google-firebase-functions-FirebaseFunctions(Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
