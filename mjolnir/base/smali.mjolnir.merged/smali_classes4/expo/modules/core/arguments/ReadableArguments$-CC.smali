.class public final synthetic Lexpo/modules/core/arguments/ReadableArguments$-CC;
.super Ljava/lang/Object;
.source "ReadableArguments.java"


# direct methods
.method public static $default$getArguments(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Lexpo/modules/core/arguments/ReadableArguments;
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 55
    invoke-interface {p0, p1}, Lexpo/modules/core/arguments/ReadableArguments;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 56
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 57
    new-instance v0, Lexpo/modules/core/arguments/MapArguments;

    check-cast p1, Ljava/util/Map;

    invoke-direct {v0, p1}, Lexpo/modules/core/arguments/MapArguments;-><init>(Ljava/util/Map;)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public static $default$getBoolean(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Z
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 0
    const/4 v0, 0x0

    .line 18
    invoke-interface {p0, p1, v0}, Lexpo/modules/core/arguments/ReadableArguments;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public static $default$getDouble(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)D
    .locals 2
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 0
    const-wide/16 v0, 0x0

    .line 24
    invoke-interface {p0, p1, v0, v1}, Lexpo/modules/core/arguments/ReadableArguments;->getDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static $default$getInt(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)I
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 0
    const/4 v0, 0x0

    .line 30
    invoke-interface {p0, p1, v0}, Lexpo/modules/core/arguments/ReadableArguments;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public static $default$getList(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 0
    const/4 v0, 0x0

    .line 42
    invoke-interface {p0, p1, v0}, Lexpo/modules/core/arguments/ReadableArguments;->getList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public static $default$getMap(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Ljava/util/Map;
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 0
    const/4 v0, 0x0

    .line 48
    invoke-interface {p0, p1, v0}, Lexpo/modules/core/arguments/ReadableArguments;->getMap(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public static $default$getString(Lexpo/modules/core/arguments/ReadableArguments;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 0
    const/4 v0, 0x0

    .line 36
    invoke-interface {p0, p1, v0}, Lexpo/modules/core/arguments/ReadableArguments;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static $default$toBundle(Lexpo/modules/core/arguments/ReadableArguments;)Landroid/os/Bundle;
    .locals 5
    .param p0, "_this"    # Lexpo/modules/core/arguments/ReadableArguments;

    .line 67
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 68
    invoke-interface {p0}, Lexpo/modules/core/arguments/ReadableArguments;->keys()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 69
    invoke-interface {p0, v2}, Lexpo/modules/core/arguments/ReadableArguments;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    const/4 v3, 0x0

    .line 71
    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :cond_0
    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 73
    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :cond_1
    instance-of v4, v3, Ljava/lang/Integer;

    if-eqz v4, :cond_2

    .line 75
    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    .line 76
    :cond_2
    instance-of v4, v3, Ljava/lang/Double;

    if-eqz v4, :cond_3

    .line 77
    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 78
    :cond_3
    instance-of v4, v3, Ljava/lang/Long;

    if-eqz v4, :cond_4

    .line 79
    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_0

    .line 80
    :cond_4
    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_5

    .line 81
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 82
    :cond_5
    instance-of v4, v3, Ljava/util/ArrayList;

    if-eqz v4, :cond_6

    .line 83
    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 84
    :cond_6
    instance-of v4, v3, Ljava/util/Map;

    if-eqz v4, :cond_7

    .line 85
    new-instance v4, Lexpo/modules/core/arguments/MapArguments;

    check-cast v3, Ljava/util/Map;

    invoke-direct {v4, v3}, Lexpo/modules/core/arguments/MapArguments;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lexpo/modules/core/arguments/MapArguments;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    .line 86
    :cond_7
    instance-of v4, v3, Landroid/os/Bundle;

    if-eqz v4, :cond_8

    .line 87
    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    .line 89
    :cond_8
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not put a value of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " to bundle."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    return-object v0
.end method
