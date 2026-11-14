.class public final Lexpo/modules/kotlin/objects/ObjectDefinitionData;
.super Ljava/lang/Object;
.source "ObjectDefinitionData.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001Bg\u0012\u001a\u0010\u0002\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00040\u0003\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00070\u0004\u0012\u0012\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\t0\u0004\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0012\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\r0\u0004\u00a2\u0006\u0002\u0010\u000eR\u001d\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\t0\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R%\u0010\u0002\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00040\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u00168F\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0019R\u001d\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\r0\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0010R\u001d\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00070\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u0010\u00a8\u0006\u001c"
    }
    d2 = {
        "Lexpo/modules/kotlin/objects/ObjectDefinitionData;",
        "",
        "constantsProvider",
        "Lkotlin/Function0;",
        "",
        "",
        "syncFunctions",
        "Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
        "asyncFunctions",
        "Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;",
        "eventsDefinition",
        "Lexpo/modules/kotlin/events/EventsDefinition;",
        "properties",
        "Lexpo/modules/kotlin/objects/PropertyComponent;",
        "(Lkotlin/jvm/functions/Function0;Ljava/util/Map;Ljava/util/Map;Lexpo/modules/kotlin/events/EventsDefinition;Ljava/util/Map;)V",
        "getAsyncFunctions",
        "()Ljava/util/Map;",
        "getConstantsProvider",
        "()Lkotlin/jvm/functions/Function0;",
        "getEventsDefinition",
        "()Lexpo/modules/kotlin/events/EventsDefinition;",
        "functions",
        "Lexpo/modules/kotlin/ConcatIterator;",
        "Lexpo/modules/kotlin/functions/AnyFunction;",
        "getFunctions",
        "()Lexpo/modules/kotlin/ConcatIterator;",
        "getProperties",
        "getSyncFunctions",
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
.field private final asyncFunctions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;",
            ">;"
        }
    .end annotation
.end field

.field private final constantsProvider:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private final eventsDefinition:Lexpo/modules/kotlin/events/EventsDefinition;

.field private final properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/objects/PropertyComponent;",
            ">;"
        }
    .end annotation
.end field

.field private final syncFunctions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function0;Ljava/util/Map;Ljava/util/Map;Lexpo/modules/kotlin/events/EventsDefinition;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;",
            ">;",
            "Lexpo/modules/kotlin/events/EventsDefinition;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/objects/PropertyComponent;",
            ">;)V"
        }
    .end annotation

    const-string v0, "constantsProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "syncFunctions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "asyncFunctions"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "properties"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->constantsProvider:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->syncFunctions:Ljava/util/Map;

    iput-object p3, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->asyncFunctions:Ljava/util/Map;

    iput-object p4, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->eventsDefinition:Lexpo/modules/kotlin/events/EventsDefinition;

    iput-object p5, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->properties:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final getAsyncFunctions()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/functions/BaseAsyncFunctionComponent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->asyncFunctions:Ljava/util/Map;

    return-object v0
.end method

.method public final getConstantsProvider()Lkotlin/jvm/functions/Function0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->constantsProvider:Lkotlin/jvm/functions/Function0;

    return-object v0
.end method

.method public final getEventsDefinition()Lexpo/modules/kotlin/events/EventsDefinition;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->eventsDefinition:Lexpo/modules/kotlin/events/EventsDefinition;

    return-object v0
.end method

.method public final getFunctions()Lexpo/modules/kotlin/ConcatIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lexpo/modules/kotlin/ConcatIterator<",
            "Lexpo/modules/kotlin/functions/AnyFunction;",
            ">;"
        }
    .end annotation

    .line 16
    new-instance v0, Lexpo/modules/kotlin/ConcatIterator;

    iget-object v1, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->syncFunctions:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iget-object v2, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->asyncFunctions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lexpo/modules/kotlin/ConcatIterator;-><init>(Ljava/util/Iterator;Ljava/util/Iterator;)V

    return-object v0
.end method

.method public final getProperties()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/objects/PropertyComponent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->properties:Ljava/util/Map;

    return-object v0
.end method

.method public final getSyncFunctions()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/functions/SyncFunctionComponent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/objects/ObjectDefinitionData;->syncFunctions:Ljava/util/Map;

    return-object v0
.end method
