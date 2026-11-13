.class public Lexpo/modules/kotlin/viewevent/ViewEvent;
.super Ljava/lang/Object;
.source "ViewEvent.kt"

# interfaces
.implements Lexpo/modules/kotlin/viewevent/ViewEventCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lexpo/modules/kotlin/viewevent/ViewEventCallback<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nViewEvent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ViewEvent.kt\nexpo/modules/kotlin/viewevent/ViewEvent\n+ 2 KotlinUtilities.kt\nexpo/modules/core/utilities/KotlinUtilitiesKt\n+ 3 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,66:1\n12#2:67\n12#2:68\n12474#3,2:69\n*S KotlinDebug\n*F\n+ 1 ViewEvent.kt\nexpo/modules/kotlin/viewevent/ViewEvent\n*L\n29#1:67\n33#1:68\n38#1:69,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\n\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0016\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002BF\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012/\u0010\u0007\u001a+\u0012\u0013\u0012\u00118\u0000\u00a2\u0006\u000c\u0008\t\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0008j\n\u0012\u0004\u0012\u00028\u0000\u0018\u0001`\u000c\u00a2\u0006\u0002\u0010\rJ\u0017\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0012\u001a\u00028\u0000H\u0002\u00a2\u0006\u0002\u0010\u0013J\u0016\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0012\u001a\u00028\u0000H\u0096\u0002\u00a2\u0006\u0002\u0010\u0016R7\u0010\u0007\u001a+\u0012\u0013\u0012\u00118\u0000\u00a2\u0006\u000c\u0008\t\u0012\u0008\u0008\u0003\u0012\u0004\u0008\u0008(\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0008j\n\u0012\u0004\u0012\u00028\u0000\u0018\u0001`\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lexpo/modules/kotlin/viewevent/ViewEvent;",
        "T",
        "Lexpo/modules/kotlin/viewevent/ViewEventCallback;",
        "name",
        "",
        "view",
        "Landroid/view/View;",
        "coalescingKey",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "event",
        "",
        "Lexpo/modules/kotlin/viewevent/CoalescingKey;",
        "(Ljava/lang/String;Landroid/view/View;Lkotlin/jvm/functions/Function1;)V",
        "isValidated",
        "",
        "convertEventBody",
        "Lcom/facebook/react/bridge/WritableMap;",
        "arg",
        "(Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableMap;",
        "invoke",
        "",
        "(Ljava/lang/Object;)V",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final coalescingKey:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "TT;",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field

.field private isValidated:Z

.field private final name:Ljava/lang/String;

.field private final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/view/View;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Ljava/lang/Short;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "view"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->name:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->view:Landroid/view/View;

    iput-object p3, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->coalescingKey:Lkotlin/jvm/functions/Function1;

    return-void
.end method

.method private final convertEventBody(Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/facebook/react/bridge/WritableMap;"
        }
    .end annotation

    .line 57
    sget-object v0, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {v0, p1, v2, v1, v2}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue$default(Lexpo/modules/kotlin/types/JSTypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 58
    instance-of v0, p1, Lkotlin/Unit;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    goto :goto_0

    .line 59
    :cond_1
    instance-of v0, p1, Lcom/facebook/react/bridge/WritableMap;

    if-eqz v0, :cond_2

    move-object v2, p1

    check-cast v2, Lcom/facebook/react/bridge/WritableMap;

    goto :goto_0

    .line 60
    :cond_2
    sget-object v0, Lexpo/modules/kotlin/types/JSTypeConverter$DefaultContainerProvider;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter$DefaultContainerProvider;

    invoke-virtual {v0}, Lexpo/modules/kotlin/types/JSTypeConverter$DefaultContainerProvider;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    const-string v0, "payload"

    .line 61
    invoke-static {v2, v0, p1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-object v2
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->view:Landroid/view/View;

    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type com.facebook.react.bridge.ReactContext"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/react/bridge/ReactContext;

    .line 25
    invoke-static {v0}, Lexpo/modules/kotlin/ReactExtensionsKt;->getUnimoduleProxy(Lcom/facebook/react/bridge/ReactContext;)Lexpo/modules/adapters/react/NativeModulesProxy;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 26
    :cond_0
    invoke-virtual {v0}, Lexpo/modules/adapters/react/NativeModulesProxy;->getKotlinInteropModuleRegistry()Lexpo/modules/kotlin/KotlinInteropModuleRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/KotlinInteropModuleRegistry;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    iget-boolean v1, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->isValidated:Z

    const/4 v2, 0x0

    if-nez v1, :cond_6

    .line 29
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getRegistry()Lexpo/modules/kotlin/ModuleRegistry;

    move-result-object v1

    iget-object v3, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->view:Landroid/view/View;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v3}, Lexpo/modules/kotlin/ModuleRegistry;->getModuleHolder(Ljava/lang/Class;)Lexpo/modules/kotlin/ModuleHolder;

    move-result-object v1

    const/4 v3, 0x2

    if-nez v1, :cond_1

    .line 30
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->view:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "\u26a0\ufe0f Cannot get module holder for "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2, v3, v2}, Lexpo/modules/core/logging/Logger;->warn$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void

    .line 33
    :cond_1
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v4

    invoke-virtual {v4}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lexpo/modules/kotlin/views/ViewManagerDefinition;->getCallbacksDefinition()Lexpo/modules/kotlin/views/CallbacksDefinition;

    move-result-object v4

    goto :goto_0

    :cond_2
    move-object v4, v2

    :goto_0
    if-nez v4, :cond_3

    .line 34
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object p1

    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "\u26a0\ufe0f Cannot get callbacks for "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2, v3, v2}, Lexpo/modules/core/logging/Logger;->warn$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void

    .line 38
    :cond_3
    invoke-virtual {v4}, Lexpo/modules/kotlin/views/CallbacksDefinition;->getNames()[Ljava/lang/String;

    move-result-object v4

    .line 69
    array-length v5, v4

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_5

    aget-object v7, v4, v6

    iget-object v8, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->name:Ljava/lang/String;

    .line 38
    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/4 v1, 0x1

    iput-boolean v1, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->isValidated:Z

    goto :goto_2

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 39
    :cond_5
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object p1

    iget-object v0, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->name:Ljava/lang/String;

    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u26a0\ufe0f Event "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " wasn\'t exported from "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2, v3, v2}, Lexpo/modules/core/logging/Logger;->warn$default(Lexpo/modules/core/logging/Logger;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    return-void

    .line 47
    :cond_6
    :goto_2
    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getCallbackInvoker$expo_modules_core_release()Lexpo/modules/kotlin/events/EventEmitter;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v1, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->view:Landroid/view/View;

    .line 49
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v3, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->name:Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/viewevent/ViewEvent;->convertEventBody(Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    iget-object v5, p0, Lexpo/modules/kotlin/viewevent/ViewEvent;->coalescingKey:Lkotlin/jvm/functions/Function1;

    if-eqz v5, :cond_7

    .line 52
    invoke-interface {v5, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Ljava/lang/Short;

    .line 48
    :cond_7
    invoke-interface {v0, v1, v3, v4, v2}, Lexpo/modules/kotlin/events/EventEmitter;->emit(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/Short;)V

    :cond_8
    return-void
.end method
