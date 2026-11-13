.class public final Lio/perfmark/PerfMark;
.super Ljava/lang/Object;
.source "PerfMark.java"


# static fields
.field private static final impl:Lio/perfmark/Impl;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "io.perfmark.impl.SecretPerfMarkImpl$PerfMarkImpl"

    .line 559
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v2, v0

    goto :goto_0

    :catchall_0
    move-exception v1

    move-object v2, v1

    move-object v1, v0

    :goto_0
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_0

    .line 565
    :try_start_1
    const-class v5, Lio/perfmark/Impl;

    invoke-virtual {v1, v5}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Lio/perfmark/Tag;

    aput-object v6, v5, v3

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/Object;

    sget-object v6, Lio/perfmark/Impl;->NO_TAG:Lio/perfmark/Tag;

    aput-object v6, v5, v3

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/perfmark/Impl;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    move-object v2, v1

    :cond_0
    move-object v1, v0

    :goto_1
    if-eqz v1, :cond_1

    sput-object v1, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    goto :goto_2

    .line 573
    :cond_1
    new-instance v1, Lio/perfmark/Impl;

    sget-object v5, Lio/perfmark/Impl;->NO_TAG:Lio/perfmark/Tag;

    invoke-direct {v1, v5}, Lio/perfmark/Impl;-><init>(Lio/perfmark/Tag;)V

    sput-object v1, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    :goto_2
    if-eqz v2, :cond_2

    :try_start_2
    const-string v1, "io.perfmark.PerfMark.debug"

    .line 577
    invoke-static {v1}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "java.util.logging.Logger"

    .line 581
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v5, "getLogger"

    new-array v6, v4, [Ljava/lang/Class;

    .line 582
    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v3

    invoke-virtual {v1, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/Object;

    const-class v7, Lio/perfmark/PerfMark;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "java.util.logging.Level"

    .line 583
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "FINE"

    .line 584
    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v7, "log"

    const/4 v8, 0x3

    new-array v9, v8, [Ljava/lang/Class;

    aput-object v6, v9, v3

    .line 585
    const-class v6, Ljava/lang/String;

    aput-object v6, v9, v4

    const-class v6, Ljava/lang/Throwable;

    const/4 v10, 0x2

    aput-object v6, v9, v10

    invoke-virtual {v1, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v0, v6, v3

    const-string v0, "Error during PerfMark.<clinit>"

    aput-object v0, v6, v4

    aput-object v2, v6, v10

    .line 586
    invoke-virtual {v1, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :catchall_2
    :cond_2
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 594
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attachTag(Lio/perfmark/Tag;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 432
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->attachTag(Lio/perfmark/Tag;)V

    return-void
.end method

.method public static attachTag(Ljava/lang/String;J)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 462
    invoke-virtual {v0, p0, p1, p2}, Lio/perfmark/Impl;->attachTag(Ljava/lang/String;J)V

    return-void
.end method

.method public static attachTag(Ljava/lang/String;JJ)V
    .locals 6

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    .line 494
    invoke-virtual/range {v0 .. v5}, Lio/perfmark/Impl;->attachTag(Ljava/lang/String;JJ)V

    return-void
.end method

.method public static attachTag(Ljava/lang/String;Ljava/lang/Object;Lio/perfmark/StringFunction;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Lio/perfmark/StringFunction<",
            "-TT;>;)V"
        }
    .end annotation

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 549
    invoke-virtual {v0, p0, p1, p2}, Lio/perfmark/Impl;->attachTag(Ljava/lang/String;Ljava/lang/Object;Lio/perfmark/StringFunction;)V

    return-void
.end method

.method public static attachTag(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 447
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->attachTag(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static createTag()Lio/perfmark/Tag;
    .locals 1

    .line 321
    sget-object v0, Lio/perfmark/Impl;->NO_TAG:Lio/perfmark/Tag;

    return-object v0
.end method

.method public static createTag(J)Lio/perfmark/Tag;
    .locals 2

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    const-string v1, ""

    .line 333
    invoke-virtual {v0, v1, p0, p1}, Lio/perfmark/Impl;->createTag(Ljava/lang/String;J)Lio/perfmark/Tag;

    move-result-object p0

    return-object p0
.end method

.method public static createTag(Ljava/lang/String;)Lio/perfmark/Tag;
    .locals 3

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    const-wide/high16 v1, -0x8000000000000000L

    .line 345
    invoke-virtual {v0, p0, v1, v2}, Lio/perfmark/Impl;->createTag(Ljava/lang/String;J)Lio/perfmark/Tag;

    move-result-object p0

    return-object p0
.end method

.method public static createTag(Ljava/lang/String;J)Lio/perfmark/Tag;
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 358
    invoke-virtual {v0, p0, p1, p2}, Lio/perfmark/Impl;->createTag(Ljava/lang/String;J)Lio/perfmark/Tag;

    move-result-object p0

    return-object p0
.end method

.method public static event(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 228
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->event(Ljava/lang/String;)V

    return-void
.end method

.method public static event(Ljava/lang/String;Lio/perfmark/Tag;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 217
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->event(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void
.end method

.method public static event(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 241
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->event(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static link()Lio/perfmark/Link;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 369
    sget-object v0, Lio/perfmark/Impl;->NO_LINK:Lio/perfmark/Link;

    return-object v0
.end method

.method public static linkIn(Lio/perfmark/Link;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 393
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->linkIn(Lio/perfmark/Link;)V

    return-void
.end method

.method public static linkOut()Lio/perfmark/Link;
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 382
    invoke-virtual {v0}, Lio/perfmark/Impl;->linkOut()Lio/perfmark/Link;

    move-result-object v0

    return-object v0
.end method

.method public static setEnabled(Z)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 100
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->setEnabled(Z)V

    return-void
.end method

.method public static startTask(Ljava/lang/Object;Lio/perfmark/StringFunction;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/perfmark/StringFunction<",
            "-TT;>;)V"
        }
    .end annotation

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 145
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->startTask(Ljava/lang/Object;Lio/perfmark/StringFunction;)V

    return-void
.end method

.method public static startTask(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 127
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->startTask(Ljava/lang/String;)V

    return-void
.end method

.method public static startTask(Ljava/lang/String;Lio/perfmark/Tag;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 116
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->startTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void
.end method

.method public static startTask(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 159
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->startTask(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static stopTask()V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 253
    invoke-virtual {v0}, Lio/perfmark/Impl;->stopTask()V

    return-void
.end method

.method public static stopTask(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 288
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->stopTask(Ljava/lang/String;)V

    return-void
.end method

.method public static stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 271
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->stopTask(Ljava/lang/String;Lio/perfmark/Tag;)V

    return-void
.end method

.method public static stopTask(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 307
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->stopTask(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static traceTask(Ljava/lang/Object;Lio/perfmark/StringFunction;)Lio/perfmark/TaskCloseable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lio/perfmark/StringFunction<",
            "-TT;>;)",
            "Lio/perfmark/TaskCloseable;"
        }
    .end annotation

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 200
    invoke-virtual {v0, p0, p1}, Lio/perfmark/Impl;->startTask(Ljava/lang/Object;Lio/perfmark/StringFunction;)V

    .line 201
    sget-object p0, Lio/perfmark/TaskCloseable;->INSTANCE:Lio/perfmark/TaskCloseable;

    return-object p0
.end method

.method public static traceTask(Ljava/lang/String;)Lio/perfmark/TaskCloseable;
    .locals 1

    sget-object v0, Lio/perfmark/PerfMark;->impl:Lio/perfmark/Impl;

    .line 177
    invoke-virtual {v0, p0}, Lio/perfmark/Impl;->startTask(Ljava/lang/String;)V

    .line 178
    sget-object p0, Lio/perfmark/TaskCloseable;->INSTANCE:Lio/perfmark/TaskCloseable;

    return-object p0
.end method
