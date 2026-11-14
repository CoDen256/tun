.class public final Lexpo/modules/kotlin/ModuleRegistry;
.super Ljava/lang/Object;
.source "ModuleRegistry.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lexpo/modules/kotlin/ModuleHolder<",
        "*>;>;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nModuleRegistry.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ModuleRegistry.kt\nexpo/modules/kotlin/ModuleRegistry\n+ 2 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 3 Trace.kt\nandroidx/tracing/TraceKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 5 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 6 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,185:1\n14#2:186\n25#2:187\n27#3,3:188\n31#3:192\n1#4:191\n13309#5,2:193\n1855#6,2:195\n1855#6,2:197\n1855#6,2:199\n1855#6,2:201\n1855#6,2:203\n1855#6,2:205\n1855#6:207\n1855#6,2:208\n1856#6:210\n*S KotlinDebug\n*F\n+ 1 ModuleRegistry.kt\nexpo/modules/kotlin/ModuleRegistry\n*L\n23#1:186\n23#1:187\n23#1:188,3\n23#1:192\n40#1:193,2\n44#1:195,2\n78#1:197,2\n91#1:199,2\n101#1:201,2\n111#1:203,2\n124#1:205,2\n137#1:207\n138#1:208,2\n137#1:210\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000x\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010(\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0005\u0018\u00002\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001:\u0001:B\u0013\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u00a2\u0006\u0002\u0010\u0006J(\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u00152\n\u0008\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00172\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0002J\u0006\u0010\u0019\u001a\u00020\u001aJ\u0008\u0010\u001b\u001a\u00020\u001aH\u0002J\u0018\u0010\u001c\u001a\u0004\u0018\u0001H\u001d\"\u0006\u0008\u0000\u0010\u001d\u0018\u0001H\u0086\u0008\u00a2\u0006\u0002\u0010\u001eJ\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u001f2\u0006\u0010 \u001a\u00020\u000eJ%\u0010!\u001a\n\u0012\u0004\u0012\u0002H\u001d\u0018\u00010\u0002\"\u0008\u0008\u0000\u0010\u001d*\u00020\u001f2\u0006\u0010\"\u001a\u0002H\u001d\u00a2\u0006\u0002\u0010#J$\u0010!\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0002\"\u0008\u0008\u0000\u0010\u001d*\u00020$2\u000c\u0010%\u001a\u0008\u0012\u0004\u0012\u0002H\u001d0&J\u0014\u0010!\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00022\u0006\u0010 \u001a\u00020\u000eJ\u000e\u0010\'\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\u000eJ\u0013\u0010(\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020)H\u0096\u0002J\u000e\u0010*\u001a\u00020\u001a2\u0006\u0010\u0014\u001a\u00020\u0015J!\u0010*\u001a\u00020\u001a\"\u0004\u0008\u0000\u0010+2\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u0002H+\u00a2\u0006\u0002\u0010,J/\u0010*\u001a\u00020\u001a\"\u0004\u0008\u0000\u0010+\"\u0004\u0008\u0001\u0010-2\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u0002H+2\u0006\u0010\u0018\u001a\u0002H-\u00a2\u0006\u0002\u0010.J\u0006\u0010/\u001a\u00020\u001aJ\u0008\u00100\u001a\u00020\u001aH\u0002J\u001d\u00101\u001a\u00020\u001a\"\u0008\u0008\u0000\u0010\u001d*\u00020\u001f2\u0006\u0010\"\u001a\u0002H\u001d\u00a2\u0006\u0002\u00102J\u000e\u00101\u001a\u00020\u00002\u0006\u00103\u001a\u000204J\u001f\u00101\u001a\u00020\u001a2\u0012\u00105\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u001f06\"\u00020\u001f\u00a2\u0006\u0002\u00107J\r\u00108\u001a\u00020\u001aH\u0000\u00a2\u0006\u0002\u00089R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R,\u0010\u000c\u001a\u0012\u0012\u0004\u0012\u00020\u000e\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\r8\u0000X\u0081\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012\u00a8\u0006;"
    }
    d2 = {
        "Lexpo/modules/kotlin/ModuleRegistry;",
        "",
        "Lexpo/modules/kotlin/ModuleHolder;",
        "appContext",
        "Ljava/lang/ref/WeakReference;",
        "Lexpo/modules/kotlin/AppContext;",
        "(Ljava/lang/ref/WeakReference;)V",
        "eventQueue",
        "",
        "Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;",
        "isReadyForPostingEvents",
        "",
        "registry",
        "",
        "",
        "getRegistry$annotations",
        "()V",
        "getRegistry",
        "()Ljava/util/Map;",
        "addToQueueIfNeeded",
        "eventName",
        "Lexpo/modules/kotlin/events/EventName;",
        "sender",
        "",
        "payload",
        "cleanUp",
        "",
        "flushTheEventQueue",
        "getModule",
        "T",
        "()Ljava/lang/Object;",
        "Lexpo/modules/kotlin/modules/Module;",
        "name",
        "getModuleHolder",
        "module",
        "(Lexpo/modules/kotlin/modules/Module;)Lexpo/modules/kotlin/ModuleHolder;",
        "Landroid/view/View;",
        "viewClass",
        "Ljava/lang/Class;",
        "hasModule",
        "iterator",
        "",
        "post",
        "Sender",
        "(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;)V",
        "Payload",
        "(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V",
        "postOnCreate",
        "readyForPostingEvents",
        "register",
        "(Lexpo/modules/kotlin/modules/Module;)V",
        "provider",
        "Lexpo/modules/kotlin/ModulesProvider;",
        "modules",
        "",
        "([Lexpo/modules/kotlin/modules/Module;)V",
        "registerActivityContracts",
        "registerActivityContracts$expo_modules_core_release",
        "PostponedEvent",
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
.field private final appContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;"
        }
    .end annotation
.end field

.field private final eventQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;",
            ">;"
        }
    .end annotation
.end field

.field private isReadyForPostingEvents:Z

.field private final registry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/AppContext;",
            ">;)V"
        }
    .end annotation

    const-string v0, "appContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleRegistry;->appContext:Ljava/lang/ref/WeakReference;

    .line 17
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 19
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lexpo/modules/kotlin/ModuleRegistry;->eventQueue:Ljava/util/List;

    return-void
.end method

.method public static final synthetic access$getAppContext$p(Lexpo/modules/kotlin/ModuleRegistry;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 13
    iget-object p0, p0, Lexpo/modules/kotlin/ModuleRegistry;->appContext:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method private final addToQueueIfNeeded(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2

    .line 156
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->isReadyForPostingEvents:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 158
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->eventQueue:Ljava/util/List;

    .line 161
    new-instance v1, Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;

    invoke-direct {v1, p1, p2, p3}, Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;-><init>(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    monitor-exit p0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method static synthetic addToQueueIfNeeded$default(Lexpo/modules/kotlin/ModuleRegistry;Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)Z
    .locals 1

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move-object p3, v0

    .line 152
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/ModuleRegistry;->addToQueueIfNeeded(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private final flushTheEventQueue()V
    .locals 4

    .line 136
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->eventQueue:Ljava/util/List;

    .line 137
    check-cast v0, Ljava/lang/Iterable;

    .line 207
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;

    .line 138
    move-object v2, p0

    check-cast v2, Ljava/lang/Iterable;

    .line 208
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/kotlin/ModuleHolder;

    .line 139
    invoke-virtual {v1, v3}, Lexpo/modules/kotlin/ModuleRegistry$PostponedEvent;->post(Lexpo/modules/kotlin/ModuleHolder;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->eventQueue:Ljava/util/List;

    .line 142
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 143
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static synthetic getRegistry$annotations()V
    .locals 0

    return-void
.end method

.method private final readyForPostingEvents()V
    .locals 1

    .line 132
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->isReadyForPostingEvents:Z

    .line 134
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public final cleanUp()V
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 119
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 120
    invoke-static {}, Lexpo/modules/kotlin/CoreLoggerKt;->getLogger()Lexpo/modules/core/logging/Logger;

    move-result-object v0

    const-string v1, "\u2705 ModuleRegistry was destroyed"

    invoke-virtual {v0, v1}, Lexpo/modules/core/logging/Logger;->info(Ljava/lang/String;)V

    return-void
.end method

.method public final getModule(Ljava/lang/String;)Lexpo/modules/kotlin/modules/Module;
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 52
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/ModuleHolder;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public final synthetic getModule()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .line 55
    invoke-virtual {p0}, Lexpo/modules/kotlin/ModuleRegistry;->getRegistry()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "T"

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lexpo/modules/kotlin/ModuleHolder;

    invoke-virtual {v4}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v4

    const/4 v5, 0x3

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    instance-of v4, v4, Ljava/lang/Object;

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v3

    :goto_0
    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v3

    :cond_2
    const/4 v0, 0x2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    check-cast v3, Ljava/lang/Object;

    return-object v3
.end method

.method public final getModuleHolder(Lexpo/modules/kotlin/modules/Module;)Lexpo/modules/kotlin/ModuleHolder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lexpo/modules/kotlin/modules/Module;",
            ">(TT;)",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "module"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 62
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lexpo/modules/kotlin/ModuleHolder;

    invoke-virtual {v3}, Lexpo/modules/kotlin/ModuleHolder;->getModule()Lexpo/modules/kotlin/modules/Module;

    move-result-object v3

    if-ne v3, p1, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    instance-of p1, v1, Lexpo/modules/kotlin/ModuleHolder;

    if-eqz p1, :cond_2

    move-object v2, v1

    check-cast v2, Lexpo/modules/kotlin/ModuleHolder;

    :cond_2
    return-object v2
.end method

.method public final getModuleHolder(Ljava/lang/Class;)Lexpo/modules/kotlin/ModuleHolder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;"
        }
    .end annotation

    const-string v0, "viewClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 65
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 66
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->getDefinition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v3

    invoke-virtual {v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionData;->getViewManagerDefinition()Lexpo/modules/kotlin/views/ViewManagerDefinition;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lexpo/modules/kotlin/views/ViewManagerDefinition;->getViewType$expo_modules_core_release()Ljava/lang/Class;

    move-result-object v3

    goto :goto_0

    :cond_1
    move-object v3, v2

    :goto_0
    invoke-static {v3, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v2, v1

    :cond_2
    if-eqz v2, :cond_0

    :cond_3
    return-object v2
.end method

.method public final getModuleHolder(Ljava/lang/String;)Lexpo/modules/kotlin/ModuleHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 58
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/kotlin/ModuleHolder;

    return-object p1
.end method

.method public final getRegistry()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    return-object v0
.end method

.method public final hasModule(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 50
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lexpo/modules/kotlin/ModuleHolder<",
            "*>;>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/ModuleRegistry;->registry:Ljava/util/Map;

    .line 116
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public final post(Lexpo/modules/kotlin/events/EventName;)V
    .locals 7

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x6

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    .line 87
    invoke-static/range {v1 .. v6}, Lexpo/modules/kotlin/ModuleRegistry;->addToQueueIfNeeded$default(Lexpo/modules/kotlin/ModuleRegistry;Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 91
    :cond_0
    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .line 199
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 92
    invoke-virtual {v1, p1}, Lexpo/modules/kotlin/ModuleHolder;->post(Lexpo/modules/kotlin/events/EventName;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Sender:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/events/EventName;",
            "TSender;)V"
        }
    .end annotation

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .line 97
    invoke-static/range {v1 .. v6}, Lexpo/modules/kotlin/ModuleRegistry;->addToQueueIfNeeded$default(Lexpo/modules/kotlin/ModuleRegistry;Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 101
    :cond_0
    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .line 201
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 102
    invoke-virtual {v1, p1, p2}, Lexpo/modules/kotlin/ModuleHolder;->post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Sender:",
            "Ljava/lang/Object;",
            "Payload:",
            "Ljava/lang/Object;",
            ">(",
            "Lexpo/modules/kotlin/events/EventName;",
            "TSender;TPayload;)V"
        }
    .end annotation

    const-string v0, "eventName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/ModuleRegistry;->addToQueueIfNeeded(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 111
    :cond_0
    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .line 203
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 112
    invoke-virtual {v1, p1, p2, p3}, Lexpo/modules/kotlin/ModuleHolder;->post(Lexpo/modules/kotlin/events/EventName;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final postOnCreate()V
    .locals 3

    .line 78
    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .line 197
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 79
    sget-object v2, Lexpo/modules/kotlin/events/EventName;->MODULE_CREATE:Lexpo/modules/kotlin/events/EventName;

    invoke-virtual {v1, v2}, Lexpo/modules/kotlin/ModuleHolder;->post(Lexpo/modules/kotlin/events/EventName;)V

    goto :goto_0

    .line 81
    :cond_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/ModuleRegistry;->registerActivityContracts$expo_modules_core_release()V

    .line 82
    invoke-direct {p0}, Lexpo/modules/kotlin/ModuleRegistry;->readyForPostingEvents()V

    .line 83
    invoke-direct {p0}, Lexpo/modules/kotlin/ModuleRegistry;->flushTheEventQueue()V

    return-void
.end method

.method public final register(Lexpo/modules/kotlin/ModulesProvider;)Lexpo/modules/kotlin/ModuleRegistry;
    .locals 3

    const-string v0, "provider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/ModuleRegistry;

    .line 44
    invoke-interface {p1}, Lexpo/modules/kotlin/ModulesProvider;->getModulesList()Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 195
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/kotlin/modules/Module;

    .line 46
    invoke-virtual {p0, v0}, Lexpo/modules/kotlin/ModuleRegistry;->register(Lexpo/modules/kotlin/modules/Module;)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public final register(Lexpo/modules/kotlin/modules/Module;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lexpo/modules/kotlin/modules/Module;",
            ">(TT;)V"
        }
    .end annotation

    const-string v0, "module"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ModuleRegistry.register("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "[ExpoModulesCore] "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 188
    invoke-static {v0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 24
    :try_start_0
    invoke-static {p0}, Lexpo/modules/kotlin/ModuleRegistry;->access$getAppContext$p(Lexpo/modules/kotlin/ModuleRegistry;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lexpo/modules/kotlin/AppContext;

    invoke-virtual {p1, v0}, Lexpo/modules/kotlin/modules/Module;->set_appContext$expo_modules_core_release(Lexpo/modules/kotlin/AppContext;)V

    .line 26
    new-instance v0, Lexpo/modules/kotlin/ModuleHolder;

    invoke-direct {v0, p1}, Lexpo/modules/kotlin/ModuleHolder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    .line 28
    new-instance v1, Lexpo/modules/kotlin/ModuleRegistry$register$1$2;

    invoke-direct {v1, v0}, Lexpo/modules/kotlin/ModuleRegistry$register$1$2;-><init>(Lexpo/modules/kotlin/ModuleHolder;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v1

    invoke-virtual {p1, v1}, Lexpo/modules/kotlin/modules/Module;->setCoroutineScopeDelegate(Lkotlin/Lazy;)V

    .line 36
    invoke-virtual {p0}, Lexpo/modules/kotlin/ModuleRegistry;->getRegistry()Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v0}, Lexpo/modules/kotlin/ModuleHolder;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-void

    :cond_0
    :try_start_1
    const-string p1, "Cannot create a module for invalid app context."

    .line 24
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 192
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw p1
.end method

.method public final varargs register([Lexpo/modules/kotlin/modules/Module;)V
    .locals 3

    const-string v0, "modules"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 193
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 40
    invoke-virtual {p0, v2}, Lexpo/modules/kotlin/ModuleRegistry;->register(Lexpo/modules/kotlin/modules/Module;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final registerActivityContracts$expo_modules_core_release()V
    .locals 2

    .line 124
    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    .line 205
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/ModuleHolder;

    .line 125
    invoke-virtual {v1}, Lexpo/modules/kotlin/ModuleHolder;->registerContracts()V

    goto :goto_0

    :cond_0
    return-void
.end method
