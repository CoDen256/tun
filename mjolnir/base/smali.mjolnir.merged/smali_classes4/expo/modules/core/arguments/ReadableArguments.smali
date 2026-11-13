.class public interface abstract Lexpo/modules/core/arguments/ReadableArguments;
.super Ljava/lang/Object;
.source "ReadableArguments.java"


# virtual methods
.method public abstract containsKey(Ljava/lang/String;)Z
.end method

.method public abstract get(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getArguments(Ljava/lang/String;)Lexpo/modules/core/arguments/ReadableArguments;
.end method

.method public abstract getBoolean(Ljava/lang/String;)Z
.end method

.method public abstract getBoolean(Ljava/lang/String;Z)Z
.end method

.method public abstract getDouble(Ljava/lang/String;)D
.end method

.method public abstract getDouble(Ljava/lang/String;D)D
.end method

.method public abstract getInt(Ljava/lang/String;)I
.end method

.method public abstract getInt(Ljava/lang/String;I)I
.end method

.method public abstract getList(Ljava/lang/String;)Ljava/util/List;
.end method

.method public abstract getList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
.end method

.method public abstract getMap(Ljava/lang/String;)Ljava/util/Map;
.end method

.method public abstract getMap(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
.end method

.method public abstract getString(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract keys()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract size()I
.end method

.method public abstract toBundle()Landroid/os/Bundle;
.end method
