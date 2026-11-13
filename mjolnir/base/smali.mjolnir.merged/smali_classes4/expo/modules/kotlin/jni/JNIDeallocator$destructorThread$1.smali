.class public final Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;
.super Ljava/lang/Thread;
.source "JNIDeallocator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/jni/JNIDeallocator;-><init>(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "expo/modules/kotlin/jni/JNIDeallocator$destructorThread$1",
        "Ljava/lang/Thread;",
        "run",
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
.field final synthetic this$0:Lexpo/modules/kotlin/jni/JNIDeallocator;


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/jni/JNIDeallocator;)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;->this$0:Lexpo/modules/kotlin/jni/JNIDeallocator;

    const-string p1, "Expo JNI deallocator"

    .line 30
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 32
    :goto_0
    invoke-virtual {p0}, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;->this$0:Lexpo/modules/kotlin/jni/JNIDeallocator;

    .line 36
    invoke-static {v0}, Lexpo/modules/kotlin/jni/JNIDeallocator;->access$getReferenceQueue$p(Lexpo/modules/kotlin/jni/JNIDeallocator;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->remove()Ljava/lang/ref/Reference;

    move-result-object v0

    iget-object v1, p0, Lexpo/modules/kotlin/jni/JNIDeallocator$destructorThread$1;->this$0:Lexpo/modules/kotlin/jni/JNIDeallocator;

    .line 37
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :try_start_1
    invoke-static {v1}, Lexpo/modules/kotlin/jni/JNIDeallocator;->access$getDestructorMap$p(Lexpo/modules/kotlin/jni/JNIDeallocator;)Ljava/util/Map;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/TypeIntrinsics;->asMutableMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    :try_start_2
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    :cond_0
    return-void
.end method
