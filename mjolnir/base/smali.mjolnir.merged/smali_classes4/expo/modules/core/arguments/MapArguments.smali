.class public Lexpo/modules/core/arguments/MapArguments;
.super Ljava/lang/Object;
.source "MapArguments.java"

# interfaces
.implements Lexpo/modules/core/arguments/ReadableArguments;


# instance fields
.field private mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 26
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 31
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public synthetic getArguments(Ljava/lang/String;)Lexpo/modules/core/arguments/ReadableArguments;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getArguments(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Lexpo/modules/core/arguments/ReadableArguments;

    move-result-object p1

    return-object p1
.end method

.method public synthetic getBoolean(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getBoolean(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 36
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 37
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 38
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    :cond_0
    return p2
.end method

.method public synthetic getDouble(Ljava/lang/String;)D
    .locals 2

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getDouble(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public getDouble(Ljava/lang/String;D)D
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 45
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 46
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 47
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p1

    return-wide p1

    :cond_0
    return-wide p2
.end method

.method public synthetic getInt(Ljava/lang/String;)I
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getInt(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 54
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 55
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 56
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    return p1

    :cond_0
    return p2
.end method

.method public synthetic getList(Ljava/lang/String;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getList(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 72
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 73
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 74
    check-cast p1, Ljava/util/List;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public synthetic getMap(Ljava/lang/String;)Ljava/util/Map;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getMap(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public getMap(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 81
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 82
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 83
    check-cast p1, Ljava/util/Map;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public synthetic getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$getString(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 63
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 64
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 65
    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 90
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keys()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 21
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/arguments/MapArguments;->mMap:Ljava/util/Map;

    .line 95
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public synthetic toBundle()Landroid/os/Bundle;
    .locals 1

    invoke-static {p0}, Lexpo/modules/core/arguments/ReadableArguments$-CC;->$default$toBundle(Lexpo/modules/core/arguments/ReadableArguments;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method
