.class public Lexpo/modules/ExpoModulesPackageList;
.super Ljava/lang/Object;
.source "ExpoModulesPackageList.java"

# interfaces
.implements Lexpo/modules/kotlin/ModulesProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/ExpoModulesPackageList$LazyHolder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPackageList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lexpo/modules/core/interfaces/Package;",
            ">;"
        }
    .end annotation

    .line 30
    sget-object v0, Lexpo/modules/ExpoModulesPackageList$LazyHolder;->packagesList:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getModulesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "+",
            "Lexpo/modules/kotlin/modules/Module;",
            ">;>;"
        }
    .end annotation

    .line 35
    sget-object v0, Lexpo/modules/ExpoModulesPackageList$LazyHolder;->modulesList:Ljava/util/List;

    return-object v0
.end method
