.class public final Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;
.super Lexpo/modules/kotlin/modules/Module;
.source "ErrorManagerModule.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nErrorManagerModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ErrorManagerModule.kt\nexpo/modules/kotlin/defaultmodules/ErrorManagerModule\n+ 2 Module.kt\nexpo/modules/kotlin/modules/ModuleKt\n+ 3 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 4 Trace.kt\nandroidx/tracing/TraceKt\n*L\n1#1,35:1\n70#2:36\n14#3:37\n25#3:38\n27#4,5:39\n*S KotlinDebug\n*F\n+ 1 ErrorManagerModule.kt\nexpo/modules/kotlin/defaultmodules/ErrorManagerModule\n*L\n12#1:36\n12#1:37\n12#1:38\n12#1:39,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;",
        "Lexpo/modules/kotlin/modules/Module;",
        "()V",
        "definition",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
        "reportExceptionToLogBox",
        "",
        "codedException",
        "Lexpo/modules/kotlin/exception/CodedException;",
        "reportWarningToLogBox",
        "warning",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lexpo/modules/kotlin/modules/Module;-><init>()V

    return-void
.end method


# virtual methods
.method public definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 4

    .line 12
    move-object v0, p0

    check-cast v0, Lexpo/modules/kotlin/modules/Module;

    .line 36
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".ModuleDefinition"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ExpoModulesCore] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 39
    invoke-static {v1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 36
    :try_start_0
    new-instance v1, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;

    invoke-direct {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    const-string v0, "ExpoModulesCoreErrorManager"

    .line 13
    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Name(Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v2, "ExpoModulesCoreErrorManager.onNewException"

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const-string v2, "ExpoModulesCoreErrorManager.onNewWarning"

    const/4 v3, 0x1

    aput-object v2, v0, v3

    .line 14
    invoke-virtual {v1, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Events([Ljava/lang/String;)V

    .line 36
    invoke-virtual {v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->buildModule()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method

.method public final reportExceptionToLogBox(Lexpo/modules/kotlin/exception/CodedException;)V
    .locals 2

    const-string v0, "codedException"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 21
    invoke-virtual {p1}, Lexpo/modules/kotlin/exception/CodedException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lexpo/modules/kotlin/exception/CodedException;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    const-string p1, "message"

    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    const-string p1, "ExpoModulesCoreErrorManager.onNewException"

    .line 18
    invoke-virtual {p0, p1, v0}, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;->sendEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public final reportWarningToLogBox(Ljava/lang/String;)V
    .locals 2

    const-string v0, "warning"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "message"

    .line 30
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    const-string p1, "ExpoModulesCoreErrorManager.onNewWarning"

    .line 27
    invoke-virtual {p0, p1, v0}, Lexpo/modules/kotlin/defaultmodules/ErrorManagerModule;->sendEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method
