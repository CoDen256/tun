.class public interface abstract Lexpo/modules/interfaces/taskManager/TaskServiceInterface;
.super Ljava/lang/Object;
.source "TaskServiceInterface.java"

# interfaces
.implements Lexpo/modules/core/interfaces/SingletonModule;


# virtual methods
.method public abstract cancelJob(Landroid/app/job/JobService;Landroid/app/job/JobParameters;)Z
.end method

.method public abstract executeTask(Lexpo/modules/interfaces/taskManager/TaskInterface;Landroid/os/Bundle;Ljava/lang/Error;Lexpo/modules/interfaces/taskManager/TaskExecutionCallback;)V
.end method

.method public abstract getTaskConsumers(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lexpo/modules/interfaces/taskManager/TaskConsumerInterface;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTaskOptions(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
.end method

.method public abstract getTasksForAppScopeKey(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end method

.method public abstract handleIntent(Landroid/content/Intent;)V
.end method

.method public abstract handleJob(Landroid/app/job/JobService;Landroid/app/job/JobParameters;)Z
.end method

.method public abstract hasRegisteredTask(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract isStartedByHeadlessLoader(Ljava/lang/String;)Z
.end method

.method public abstract notifyTaskFinished(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract registerTask(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract setTaskManager(Lexpo/modules/interfaces/taskManager/TaskManagerInterface;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract taskHasConsumerOfClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Z
.end method

.method public abstract unregisterAllTasksForAppScopeKey(Ljava/lang/String;)V
.end method

.method public abstract unregisterTask(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
