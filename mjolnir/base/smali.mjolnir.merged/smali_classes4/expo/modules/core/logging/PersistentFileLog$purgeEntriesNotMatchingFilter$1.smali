.class final Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;
.super Lkotlin/jvm/internal/Lambda;
.source "PersistentFileLog.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/core/logging/PersistentFileLog;->purgeEntriesNotMatchingFilter(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPersistentFileLog.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PersistentFileLog.kt\nexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,146:1\n766#2:147\n857#2,2:148\n*S KotlinDebug\n*F\n+ 1 PersistentFileLog.kt\nexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1\n*L\n72#1:147\n72#1:148,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $completionHandler:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Error;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $filter:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lexpo/modules/core/logging/PersistentFileLog;


# direct methods
.method constructor <init>(Lexpo/modules/core/logging/PersistentFileLog;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/core/logging/PersistentFileLog;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Error;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->this$0:Lexpo/modules/core/logging/PersistentFileLog;

    iput-object p2, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->$filter:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->$completionHandler:Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 68
    invoke-virtual {p0}, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->this$0:Lexpo/modules/core/logging/PersistentFileLog;

    .line 70
    invoke-static {v0}, Lexpo/modules/core/logging/PersistentFileLog;->access$ensureFileExists(Lexpo/modules/core/logging/PersistentFileLog;)V

    iget-object v0, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->this$0:Lexpo/modules/core/logging/PersistentFileLog;

    .line 71
    invoke-static {v0}, Lexpo/modules/core/logging/PersistentFileLog;->access$readFileLinesSync(Lexpo/modules/core/logging/PersistentFileLog;)Ljava/util/List;

    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/Iterable;

    iget-object v1, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->$filter:Lkotlin/jvm/functions/Function1;

    .line 147
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/Collection;

    .line 148
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 149
    :cond_1
    check-cast v2, Ljava/util/List;

    iget-object v0, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->this$0:Lexpo/modules/core/logging/PersistentFileLog;

    .line 73
    invoke-static {v0, v2}, Lexpo/modules/core/logging/PersistentFileLog;->access$writeFileLinesSync(Lexpo/modules/core/logging/PersistentFileLog;Ljava/util/List;)V

    iget-object v0, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->$completionHandler:Lkotlin/jvm/functions/Function1;

    const/4 v1, 0x0

    .line 74
    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lexpo/modules/core/logging/PersistentFileLog$purgeEntriesNotMatchingFilter$1;->$completionHandler:Lkotlin/jvm/functions/Function1;

    .line 76
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-void
.end method
