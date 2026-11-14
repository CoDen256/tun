.class public Lcom/swmansion/reanimated/ReanimatedUIManagerFactory;
.super Ljava/lang/Object;
.source "ReanimatedUIManagerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static create(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;I)Lcom/facebook/react/uimanager/UIManagerModule;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;I)",
            "Lcom/facebook/react/uimanager/UIManagerModule;"
        }
    .end annotation

    .line 22
    new-instance v0, Lcom/facebook/react/uimanager/ViewManagerRegistry;

    invoke-direct {v0, p1}, Lcom/facebook/react/uimanager/ViewManagerRegistry;-><init>(Ljava/util/List;)V

    .line 24
    new-instance v1, Lcom/facebook/react/uimanager/ReanimatedUIManager;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/react/uimanager/ReanimatedUIManager;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/util/List;I)V

    .line 28
    new-instance p1, Lcom/facebook/react/uimanager/ReanimatedUIImplementation;

    .line 32
    invoke-virtual {v1}, Lcom/facebook/react/uimanager/UIManagerModule;->getEventDispatcher()Lcom/facebook/react/uimanager/events/EventDispatcher;

    move-result-object v2

    invoke-direct {p1, p0, v0, v2, p2}, Lcom/facebook/react/uimanager/ReanimatedUIImplementation;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;Lcom/facebook/react/uimanager/ViewManagerRegistry;Lcom/facebook/react/uimanager/events/EventDispatcher;I)V

    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, "reanimated"

    const-string/jumbo p1, "unable to resolve super class of ReanimatedUIManager"

    .line 37
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    :try_start_0
    const-string p2, "mUIImplementation"

    .line 42
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 p2, 0x1

    .line 43
    invoke-virtual {p0, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 48
    :try_start_1
    const-class v0, Ljava/lang/reflect/Field;

    const-string v2, "accessFlags"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 49
    invoke-virtual {v0, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 51
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result p2

    and-int/lit8 p2, p2, -0x11

    .line 50
    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p2

    goto :goto_0

    :catch_1
    move-exception p2

    .line 53
    :goto_0
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    .line 56
    :goto_1
    invoke-virtual {p0, v1, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_2
    move-exception p0

    goto :goto_2

    :catch_3
    move-exception p0

    .line 58
    :goto_2
    invoke-virtual {p0}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    :goto_3
    return-object v1
.end method
