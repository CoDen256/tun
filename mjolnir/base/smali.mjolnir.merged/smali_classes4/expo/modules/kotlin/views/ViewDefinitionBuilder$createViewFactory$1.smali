.class final Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;
.super Lkotlin/jvm/internal/Lambda;
.source "ViewDefinitionBuilder.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/views/ViewDefinitionBuilder;->createViewFactory()Lkotlin/jvm/functions/Function2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Landroid/content/Context;",
        "Lexpo/modules/kotlin/AppContext;",
        "Landroid/view/View;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\n\u00a2\u0006\u0002\u0008\u0007"
    }
    d2 = {
        "<anonymous>",
        "Landroid/view/View;",
        "T",
        "context",
        "Landroid/content/Context;",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
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
.field final synthetic this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lexpo/modules/kotlin/views/ViewDefinitionBuilder<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lexpo/modules/kotlin/views/ViewDefinitionBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lexpo/modules/kotlin/views/ViewDefinitionBuilder<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Landroid/content/Context;Lexpo/modules/kotlin/AppContext;)Landroid/view/View;
    .locals 7

    const-string v0, "context"

    .line 410
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appContext"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;

    .line 390
    invoke-virtual {v4}, Lexpo/modules/kotlin/views/ViewDefinitionBuilder;->getViewClass()Lkotlin/reflect/KClass;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Class;

    const-class v6, Landroid/content/Context;

    aput-object v6, v5, v3

    const-class v6, Lexpo/modules/kotlin/AppContext;

    aput-object v6, v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v4, v1

    :goto_0
    if-eqz v4, :cond_0

    iget-object v1, p0, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;

    :try_start_1
    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    aput-object p2, v0, v2

    .line 397
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 396
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Landroid/view/View;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 399
    invoke-static {v1, p1, p2, v0}, Lexpo/modules/kotlin/views/ViewDefinitionBuilder;->access$handleFailureDuringViewCreation(Lexpo/modules/kotlin/views/ViewDefinitionBuilder;Landroid/content/Context;Lexpo/modules/kotlin/AppContext;Ljava/lang/Throwable;)Landroid/view/View;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_0
    :try_start_2
    iget-object v0, p0, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;

    .line 405
    invoke-virtual {v0}, Lexpo/modules/kotlin/views/ViewDefinitionBuilder;->getViewClass()Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaClass(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v0

    new-array v4, v2, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v3

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    if-eqz v1, :cond_1

    iget-object v0, p0, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;

    :try_start_3
    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    .line 412
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 411
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v1, Landroid/view/View;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    .line 414
    invoke-static {v0, p1, p2, v1}, Lexpo/modules/kotlin/views/ViewDefinitionBuilder;->access$handleFailureDuringViewCreation(Lexpo/modules/kotlin/views/ViewDefinitionBuilder;Landroid/content/Context;Lexpo/modules/kotlin/AppContext;Ljava/lang/Throwable;)Landroid/view/View;

    move-result-object v1

    :goto_2
    return-object v1

    .line 418
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    iget-object p2, p0, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->this$0:Lexpo/modules/kotlin/views/ViewDefinitionBuilder;

    invoke-virtual {p2}, Lexpo/modules/kotlin/views/ViewDefinitionBuilder;->getViewClass()Lkotlin/reflect/KClass;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Didn\'t find a correct constructor for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 387
    check-cast p1, Landroid/content/Context;

    check-cast p2, Lexpo/modules/kotlin/AppContext;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/views/ViewDefinitionBuilder$createViewFactory$1;->invoke(Landroid/content/Context;Lexpo/modules/kotlin/AppContext;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
