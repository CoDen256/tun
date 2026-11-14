.class public Lexpo/modules/core/MapHelper;
.super Ljava/lang/Object;
.source "MapHelper.java"

# interfaces
.implements Lexpo/modules/core/interfaces/Arguments;


# instance fields
.field private mMap:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 18
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 23
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getArguments(Ljava/lang/String;)Lexpo/modules/core/interfaces/Arguments;
    .locals 1

    .line 136
    invoke-virtual {p0, p1}, Lexpo/modules/core/MapHelper;->getMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 138
    new-instance v0, Lexpo/modules/core/MapHelper;

    invoke-direct {v0, p1}, Lexpo/modules/core/MapHelper;-><init>(Ljava/util/Map;)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getBoolean(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, p1, v0}, Lexpo/modules/core/MapHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 33
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 34
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 35
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    :cond_0
    return p2
.end method

.method public getDouble(Ljava/lang/String;)D
    .locals 2

    const-wide/16 v0, 0x0

    .line 42
    invoke-virtual {p0, p1, v0, v1}, Lexpo/modules/core/MapHelper;->getDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getDouble(Ljava/lang/String;D)D
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 47
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 48
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 49
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p1

    return-wide p1

    :cond_0
    return-wide p2
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, p1, v0}, Lexpo/modules/core/MapHelper;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 61
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 62
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 63
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    return p1

    :cond_0
    return p2
.end method

.method public getList(Ljava/lang/String;)Ljava/util/List;
    .locals 1

    const/4 v0, 0x0

    .line 98
    invoke-virtual {p0, p1, v0}, Lexpo/modules/core/MapHelper;->getList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 103
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 104
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 105
    check-cast p1, Ljava/util/List;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public getLong(Ljava/lang/String;)J
    .locals 2

    const-wide/16 v0, 0x0

    .line 70
    invoke-virtual {p0, p1, v0, v1}, Lexpo/modules/core/MapHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLong(Ljava/lang/String;J)J
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 75
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 76
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 77
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    return-wide p1

    :cond_0
    return-wide p2
.end method

.method public getMap(Ljava/lang/String;)Ljava/util/Map;
    .locals 1

    const/4 v0, 0x0

    .line 112
    invoke-virtual {p0, p1, v0}, Lexpo/modules/core/MapHelper;->getMap(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public getMap(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 117
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 118
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 119
    check-cast p1, Ljava/util/Map;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 84
    invoke-virtual {p0, p1, v0}, Lexpo/modules/core/MapHelper;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 89
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 90
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 91
    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 126
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lexpo/modules/core/MapHelper;->mMap:Ljava/util/Map;

    .line 131
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
