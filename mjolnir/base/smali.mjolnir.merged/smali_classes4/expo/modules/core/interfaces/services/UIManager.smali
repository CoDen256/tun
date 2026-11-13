.class public interface abstract Lexpo/modules/core/interfaces/services/UIManager;
.super Ljava/lang/Object;
.source "UIManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/core/interfaces/services/UIManager$GroupUIBlock;,
        Lexpo/modules/core/interfaces/services/UIManager$ViewHolder;,
        Lexpo/modules/core/interfaces/services/UIManager$UIBlock;
    }
.end annotation


# virtual methods
.method public abstract addUIBlock(ILexpo/modules/core/interfaces/services/UIManager$UIBlock;Ljava/lang/Class;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lexpo/modules/core/interfaces/services/UIManager$UIBlock<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract addUIBlock(Lexpo/modules/core/interfaces/services/UIManager$GroupUIBlock;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract registerActivityEventListener(Lexpo/modules/core/interfaces/ActivityEventListener;)V
.end method

.method public abstract registerLifecycleEventListener(Lexpo/modules/core/interfaces/LifecycleEventListener;)V
.end method

.method public abstract resolveView(I)Landroid/view/View;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract runOnClientCodeQueueThread(Ljava/lang/Runnable;)V
.end method

.method public abstract runOnNativeModulesQueueThread(Ljava/lang/Runnable;)V
.end method

.method public abstract runOnUiQueueThread(Ljava/lang/Runnable;)V
.end method

.method public abstract unregisterActivityEventListener(Lexpo/modules/core/interfaces/ActivityEventListener;)V
.end method

.method public abstract unregisterLifecycleEventListener(Lexpo/modules/core/interfaces/LifecycleEventListener;)V
.end method
