.class public final Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;
.super Ljava/lang/Object;
.source "ForwardingRequestListener2.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/listener/RequestListener2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nForwardingRequestListener2.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ForwardingRequestListener2.kt\ncom/facebook/imagepipeline/listener/ForwardingRequestListener2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,122:1\n34#1:125\n35#1,7:127\n42#1:135\n34#1:136\n35#1,7:138\n42#1:146\n34#1:147\n35#1,7:149\n42#1:157\n34#1:158\n35#1,7:160\n42#1:168\n34#1:169\n35#1,7:171\n42#1:179\n34#1:180\n35#1,7:182\n42#1:190\n34#1:191\n35#1,7:193\n42#1:201\n34#1:202\n35#1,7:204\n42#1:212\n34#1:213\n35#1,7:215\n42#1:223\n34#1:224\n35#1,7:226\n42#1:234\n1855#2,2:123\n1855#2:126\n1856#2:134\n1855#2:137\n1856#2:145\n1855#2:148\n1856#2:156\n1855#2:159\n1856#2:167\n1855#2:170\n1856#2:178\n1855#2:181\n1856#2:189\n1855#2:192\n1856#2:200\n1855#2:203\n1856#2:211\n1855#2:214\n1856#2:222\n1855#2:225\n1856#2:233\n1747#2,3:235\n*S KotlinDebug\n*F\n+ 1 ForwardingRequestListener2.kt\ncom/facebook/imagepipeline/listener/ForwardingRequestListener2\n*L\n45#1:125\n45#1:127,7\n45#1:135\n49#1:136\n49#1:138,7\n49#1:146\n57#1:147\n57#1:149,7\n57#1:157\n68#1:158\n68#1:160,7\n68#1:168\n78#1:169\n78#1:171,7\n78#1:179\n88#1:180\n88#1:182,7\n88#1:190\n98#1:191\n98#1:193,7\n98#1:201\n104#1:202\n104#1:204,7\n104#1:212\n108#1:213\n108#1:215,7\n108#1:223\n112#1:224\n112#1:226,7\n112#1:234\n34#1:123,2\n45#1:126\n45#1:134\n49#1:137\n49#1:145\n57#1:148\n57#1:156\n68#1:159\n68#1:167\n78#1:170\n78#1:178\n88#1:181\n88#1:189\n98#1:192\n98#1:200\n104#1:203\n104#1:211\n108#1:214\n108#1:222\n112#1:225\n112#1:233\n116#1:235,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010%\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0018\u0000 \'2\u00020\u0001:\u0001\'B\u0017\u0008\u0016\u0012\u000e\u0010\u0002\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0003\u00a2\u0006\u0002\u0010\u0004B\u001f\u0008\u0016\u0012\u0016\u0010\u0002\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00010\u0005\"\u0004\u0018\u00010\u0001\u00a2\u0006\u0002\u0010\u0006J\u000e\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0001J%\u0010\u000c\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000e2\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\n0\u0010H\u0082\u0008J \u0010\u0011\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u000eH\u0016J2\u0010\u0016\u001a\u00020\n2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u000e2\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000e\u0018\u00010\u0018H\u0016J<\u0010\u0019\u001a\u00020\n2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000e\u0018\u00010\u0018H\u0016J2\u0010\u001c\u001a\u00020\n2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u000e2\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000e\u0018\u00010\u0018H\u0016J\u0018\u0010\u001d\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u000eH\u0016J\u0010\u0010\u001e\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0018\u0010\u001f\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010 \u001a\u00020\u001bH\u0016J\u0010\u0010!\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0010\u0010\"\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J \u0010#\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020%H\u0016J\u0018\u0010&\u001a\u00020%2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u000eH\u0016R\u0014\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006("
    }
    d2 = {
        "Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;",
        "Lcom/facebook/imagepipeline/listener/RequestListener2;",
        "listenersToAdd",
        "Ljava/util/Set;",
        "(Ljava/util/Set;)V",
        "",
        "([Lcom/facebook/imagepipeline/listener/RequestListener2;)V",
        "requestListeners",
        "",
        "addRequestListener",
        "",
        "requestListener",
        "forEachListener",
        "methodName",
        "",
        "block",
        "Lkotlin/Function1;",
        "onProducerEvent",
        "producerContext",
        "Lcom/facebook/imagepipeline/producers/ProducerContext;",
        "producerName",
        "producerEventName",
        "onProducerFinishWithCancellation",
        "extraMap",
        "",
        "onProducerFinishWithFailure",
        "t",
        "",
        "onProducerFinishWithSuccess",
        "onProducerStart",
        "onRequestCancellation",
        "onRequestFailure",
        "throwable",
        "onRequestStart",
        "onRequestSuccess",
        "onUltimateProducerReached",
        "successful",
        "",
        "requiresExtraMap",
        "Companion",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2$Companion;

.field private static final TAG:Ljava/lang/String; = "ForwardingRequestListener2"


# instance fields
.field private requestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/imagepipeline/listener/RequestListener2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->Companion:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/listener/RequestListener2;",
            ">;)V"
        }
    .end annotation

    const-string v0, "listenersToAdd"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 21
    check-cast p1, Ljava/lang/Iterable;

    check-cast v0, Ljava/util/Collection;

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->filterNotNullTo(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/Collection;

    return-void
.end method

.method public varargs constructor <init>([Lcom/facebook/imagepipeline/listener/RequestListener2;)V
    .locals 2

    const-string v0, "listenersToAdd"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 26
    check-cast v0, Ljava/util/Collection;

    invoke-static {p1, v0}, Lkotlin/collections/ArraysKt;->filterNotNullTo([Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    return-void
.end method

.method private final forEachListener(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/facebook/imagepipeline/listener/RequestListener2;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 34
    check-cast v0, Ljava/lang/Iterable;

    .line 123
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 36
    :try_start_0
    invoke-interface {p2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "InternalListener exception in "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public final addRequestListener(Lcom/facebook/imagepipeline/listener/RequestListener2;)V
    .locals 1

    const-string v0, "requestListener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public onProducerEvent(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerEventName"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 180
    check-cast v0, Ljava/lang/Iterable;

    .line 181
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 89
    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onProducerEvent(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onIntermediateChunkStart"

    .line 186
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onProducerFinishWithCancellation(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 169
    check-cast v0, Ljava/lang/Iterable;

    .line 170
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 79
    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onProducerFinishWithCancellation(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onProducerFinishWithCancellation"

    .line 175
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onProducerFinishWithFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 158
    check-cast v0, Ljava/lang/Iterable;

    .line 159
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 69
    :try_start_0
    invoke-interface {v1, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onProducerFinishWithFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onProducerFinishWithFailure"

    .line 164
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 147
    check-cast v0, Ljava/lang/Iterable;

    .line 148
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 58
    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onProducerFinishWithSuccess"

    .line 153
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 136
    check-cast v0, Ljava/lang/Iterable;

    .line 137
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 49
    :try_start_0
    invoke-interface {v1, p1, p2}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onProducerStart"

    .line 142
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onRequestCancellation(Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 224
    check-cast v0, Ljava/lang/Iterable;

    .line 225
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 112
    :try_start_0
    invoke-interface {v1, p1}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onRequestCancellation(Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onRequestCancellation"

    .line 230
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onRequestFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/Throwable;)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "throwable"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 213
    check-cast v0, Ljava/lang/Iterable;

    .line 214
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 108
    :try_start_0
    invoke-interface {v1, p1, p2}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onRequestFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onRequestFailure"

    .line 219
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onRequestStart(Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 125
    check-cast v0, Ljava/lang/Iterable;

    .line 126
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 45
    :try_start_0
    invoke-interface {v1, p1}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onRequestStart(Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onRequestStart"

    .line 131
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onRequestSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 202
    check-cast v0, Ljava/lang/Iterable;

    .line 203
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 104
    :try_start_0
    invoke-interface {v1, p1}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onRequestSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onRequestSuccess"

    .line 208
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onUltimateProducerReached(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Z)V
    .locals 4

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 191
    check-cast v0, Ljava/lang/Iterable;

    .line 192
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 99
    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestListener2;->onUltimateProducerReached(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "InternalListener exception in onProducerFinishWithSuccess"

    .line 197
    check-cast v1, Ljava/lang/Throwable;

    const-string v3, "ForwardingRequestListener2"

    invoke-static {v3, v2, v1}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public requiresExtraMap(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)Z
    .locals 3

    const-string v0, "producerContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener2;->requestListeners:Ljava/util/List;

    .line 116
    check-cast v0, Ljava/lang/Iterable;

    .line 235
    instance-of v1, v0, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 236
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imagepipeline/listener/RequestListener2;

    .line 116
    invoke-interface {v1, p1, p2}, Lcom/facebook/imagepipeline/listener/RequestListener2;->requiresExtraMap(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v2, 0x1

    :cond_2
    :goto_0
    return v2
.end method
