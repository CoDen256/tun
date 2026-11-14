.class public interface abstract Lexpo/modules/interfaces/constants/ConstantsInterface;
.super Ljava/lang/Object;
.source "ConstantsInterface.java"


# virtual methods
.method public abstract getAppScopeKey()Ljava/lang/String;
.end method

.method public abstract getConstants()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDeviceName()Ljava/lang/String;
.end method

.method public abstract getStatusBarHeight()I
.end method

.method public abstract getSystemFonts()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSystemVersion()Ljava/lang/String;
.end method
