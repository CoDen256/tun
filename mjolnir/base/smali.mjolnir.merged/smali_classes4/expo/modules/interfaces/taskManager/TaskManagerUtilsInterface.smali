.class public interface abstract Lexpo/modules/interfaces/taskManager/TaskManagerUtilsInterface;
.super Ljava/lang/Object;
.source "TaskManagerUtilsInterface.java"


# virtual methods
.method public abstract cancelScheduledJob(Landroid/content/Context;I)V
.end method

.method public abstract cancelTaskIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract createTaskIntent(Landroid/content/Context;Lexpo/modules/interfaces/taskManager/TaskInterface;)Landroid/app/PendingIntent;
.end method

.method public abstract extractDataFromJobParams(Landroid/app/job/JobParameters;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/job/JobParameters;",
            ")",
            "Ljava/util/List<",
            "Landroid/os/PersistableBundle;",
            ">;"
        }
    .end annotation
.end method

.method public abstract scheduleJob(Landroid/content/Context;Lexpo/modules/interfaces/taskManager/TaskInterface;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lexpo/modules/interfaces/taskManager/TaskInterface;",
            "Ljava/util/List<",
            "Landroid/os/PersistableBundle;",
            ">;)V"
        }
    .end annotation
.end method
