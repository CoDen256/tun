.class public interface abstract Lexpo/modules/apploader/AppLoaderPackagesProviderInterface;
.super Ljava/lang/Object;
.source "AppLoaderPackagesProviderInterface.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ReactPackageType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getExpoPackages()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getPackages()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TReactPackageType;>;"
        }
    .end annotation
.end method
