.class public final Lcom/facebook/react/fabric/ReactNativeConfig$Companion;
.super Ljava/lang/Object;
.source "ReactNativeConfig.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/fabric/ReactNativeConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u0013\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0001\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/facebook/react/fabric/ReactNativeConfig$Companion;",
        "",
        "()V",
        "DEFAULT_CONFIG",
        "Lcom/facebook/react/fabric/ReactNativeConfig;",
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
.field static final synthetic $$INSTANCE:Lcom/facebook/react/fabric/ReactNativeConfig$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/react/fabric/ReactNativeConfig$Companion;

    invoke-direct {v0}, Lcom/facebook/react/fabric/ReactNativeConfig$Companion;-><init>()V

    sput-object v0, Lcom/facebook/react/fabric/ReactNativeConfig$Companion;->$$INSTANCE:Lcom/facebook/react/fabric/ReactNativeConfig$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
