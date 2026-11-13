.class public abstract Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;
.super Ljava/lang/Object;
.source "CxxReactPackage.kt"


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/UnstableReactNativeAPI;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\'\u0018\u0000 \u00082\u00020\u0001:\u0001\u0008B\u0011\u0008\u0014\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004R\u001a\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;",
        "",
        "hybridData",
        "Lcom/facebook/jni/HybridData;",
        "(Lcom/facebook/jni/HybridData;)V",
        "mHybridData",
        "getMHybridData$annotations",
        "()V",
        "Companion",
        "ReactAndroid_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final Companion:Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage$Companion;


# instance fields
.field private mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;->Companion:Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage$Companion;

    const-string v0, "react_cxxreactpackage"

    .line 28
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method protected constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method

.method private static synthetic getMHybridData$annotations()V
    .locals 0

    return-void
.end method
