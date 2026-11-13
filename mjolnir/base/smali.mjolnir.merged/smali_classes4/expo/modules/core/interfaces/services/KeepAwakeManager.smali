.class public interface abstract Lexpo/modules/core/interfaces/services/KeepAwakeManager;
.super Ljava/lang/Object;
.source "KeepAwakeManager.java"


# virtual methods
.method public abstract activate(Ljava/lang/String;Ljava/lang/Runnable;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lexpo/modules/core/errors/CurrentActivityNotFoundException;
        }
    .end annotation
.end method

.method public abstract deactivate(Ljava/lang/String;Ljava/lang/Runnable;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lexpo/modules/core/errors/CurrentActivityNotFoundException;
        }
    .end annotation
.end method

.method public abstract isActivated()Z
.end method
