.class public final synthetic Lapp/notifee/core/c$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lapp/notifee/core/model/NotificationModel;

.field public final synthetic f$1:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda11;->f$0:Lapp/notifee/core/model/NotificationModel;

    iput-object p2, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda11;->f$1:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda11;->f$0:Lapp/notifee/core/model/NotificationModel;

    iget-object v1, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda11;->f$1:Landroid/os/Bundle;

    invoke-static {v0, v1, p1}, Lapp/notifee/core/c;->a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;Lcom/google/android/gms/tasks/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method
