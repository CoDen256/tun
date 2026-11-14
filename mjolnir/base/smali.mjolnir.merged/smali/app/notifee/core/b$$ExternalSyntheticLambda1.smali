.class public final synthetic Lapp/notifee/core/b$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Landroid/os/Bundle;

.field public final synthetic f$1:Lapp/notifee/core/model/NotificationModel;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/os/Bundle;Lapp/notifee/core/model/NotificationModel;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/b$$ExternalSyntheticLambda1;->f$0:Landroid/os/Bundle;

    iput-object p2, p0, Lapp/notifee/core/b$$ExternalSyntheticLambda1;->f$1:Lapp/notifee/core/model/NotificationModel;

    iput-object p3, p0, Lapp/notifee/core/b$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    iget-object v0, p0, Lapp/notifee/core/b$$ExternalSyntheticLambda1;->f$0:Landroid/os/Bundle;

    iget-object v1, p0, Lapp/notifee/core/b$$ExternalSyntheticLambda1;->f$1:Lapp/notifee/core/model/NotificationModel;

    iget-object v2, p0, Lapp/notifee/core/b$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lapp/notifee/core/b;->a(Landroid/os/Bundle;Lapp/notifee/core/model/NotificationModel;Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
