.class public final synthetic Lapp/notifee/core/c$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lapp/notifee/core/model/NotificationAndroidModel;


# direct methods
.method public synthetic constructor <init>(Lapp/notifee/core/model/NotificationAndroidModel;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda7;->f$0:Lapp/notifee/core/model/NotificationAndroidModel;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda7;->f$0:Lapp/notifee/core/model/NotificationAndroidModel;

    invoke-static {v0, p1}, Lapp/notifee/core/c;->b(Lapp/notifee/core/model/NotificationAndroidModel;Lcom/google/android/gms/tasks/Task;)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object p1

    return-object p1
.end method
