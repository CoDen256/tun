.class public final synthetic Lapp/notifee/core/c$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic f$0:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field public final synthetic f$1:Landroidx/work/Data;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/work/Data;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda15;->f$0:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object p2, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda15;->f$1:Landroidx/work/Data;

    iput-object p3, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda15;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    iget-object v0, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda15;->f$0:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iget-object v1, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda15;->f$1:Landroidx/work/Data;

    iget-object v2, p0, Lapp/notifee/core/c$$ExternalSyntheticLambda15;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lapp/notifee/core/c;->a(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/work/Data;Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
