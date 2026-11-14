.class public final Lexpo/modules/kotlin/jni/JNIDeallocator;
.super Ljava/lang/Object;
.source "JNIDeallocator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJNIDeallocator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JNIDeallocator.kt\nexpo/modules/kotlin/jni/JNIDeallocator\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,83:1\n1855#2,2:84\n1603#2,9:86\n1855#2:95\n1856#2:97\n1612#2:98\n1#3:96\n*S KotlinDebug\n*F\n+ 1 JNIDeallocator.kt\nexpo/modules/kotlin/jni/JNIDeallocator\n*L\n68#1:84,2\n80#1:86,9\n80#1:95\n80#1:97\n80#1:98\n80#1:96\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000?\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0000*\u0001\u000b\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0010\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0008H\u0007J\u0011\u0010\u0012\u001a\u0004\u0018\u00010\u0010H\u0000\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0016R&\u0010\u0005\u001a\u001a\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\t0\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000cR\u0014\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/JNIDeallocator;",
        "",
        "shouldCreateDestructorThread",
        "",
        "(Z)V",
        "destructorMap",
        "",
        "Ljava/lang/ref/PhantomReference;",
        "Lexpo/modules/kotlin/jni/Destructible;",
        "Ljava/lang/ref/WeakReference;",
        "destructorThread",
        "expo/modules/kotlin/jni/JNIDeallocator$destructorThread$1",
        "Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;",
        "referenceQueue",
        "Ljava/lang/ref/ReferenceQueue;",
        "addReference",
        "",
        "destructible",
        "deallocate",
        "deallocate$expo_modules_core_release",
        "()Lkotlin/Unit;",
        "inspectMemory",
        "",
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
.field private final destructorMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/ref/PhantomReference<",
            "Lexpo/modules/kotlin/jni/Destructible;",
            ">;",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/kotlin/jni/Destructible;",
            ">;>;"
        }
    .end annotation
.end field

.field private final destructorThread:Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;

.field private final referenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Lexpo/modules/kotlin/jni/Destructible;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lexpo/modules/kotlin/jni/JNIDeallocator;-><init>(ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorMap:Ljava/util/Map;

    if-eqz p1, :cond_0

    .line 30
    new-instance p1, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;

    invoke-direct {p1, p0}, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;-><init>(Lexpo/modules/kotlin/jni/JNIDeallocator;)V

    .line 46
    invoke-virtual {p1}, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;->start()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorThread:Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;

    return-void
.end method

.method public synthetic constructor <init>(ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/jni/JNIDeallocator;-><init>(Z)V

    return-void
.end method

.method public static final synthetic access$getDestructorMap$p(Lexpo/modules/kotlin/jni/JNIDeallocator;)Ljava/util/Map;
    .locals 0

    .line 13
    iget-object p0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorMap:Ljava/util/Map;

    return-object p0
.end method

.method public static final synthetic access$getReferenceQueue$p(Lexpo/modules/kotlin/jni/JNIDeallocator;)Ljava/lang/ref/ReferenceQueue;
    .locals 0

    .line 13
    iget-object p0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    return-object p0
.end method


# virtual methods
.method public final addReference(Lexpo/modules/kotlin/jni/Destructible;)V
    .locals 3

    const-string v0, "destructible"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    monitor-enter p0

    .line 59
    :try_start_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 60
    new-instance v1, Ljava/lang/ref/PhantomReference;

    iget-object v2, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1, p1, v2}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    iget-object p1, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorMap:Ljava/util/Map;

    .line 61
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final deallocate$expo_modules_core_release()Lkotlin/Unit;
    .locals 2

    .line 67
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorMap:Ljava/util/Map;

    .line 68
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 84
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 69
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/kotlin/jni/Destructible;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lexpo/modules/kotlin/jni/Destructible;->deallocate()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorMap:Ljava/util/Map;

    .line 71
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorThread:Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;

    if-eqz v0, :cond_2

    .line 72
    invoke-virtual {v0}, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;->interrupt()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    .line 67
    :goto_1
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final inspectMemory()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lexpo/modules/kotlin/jni/Destructible;",
            ">;"
        }
    .end annotation

    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator;->destructorMap:Ljava/util/Map;

    .line 80
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 86
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    check-cast v1, Ljava/util/Collection;

    .line 95
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 94
    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 80
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/kotlin/jni/Destructible;

    if-eqz v2, :cond_0

    .line 94
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 98
    :cond_1
    check-cast v1, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
