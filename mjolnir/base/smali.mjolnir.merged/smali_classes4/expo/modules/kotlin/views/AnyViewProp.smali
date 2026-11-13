.class public abstract Lexpo/modules/kotlin/views/AnyViewProp;
.super Ljava/lang/Object;
.source "AnyViewProp.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008&\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J$\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0015H&R\u0012\u0010\u0007\u001a\u00020\u0008X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u0016"
    }
    d2 = {
        "Lexpo/modules/kotlin/views/AnyViewProp;",
        "",
        "name",
        "",
        "type",
        "Lexpo/modules/kotlin/types/AnyType;",
        "(Ljava/lang/String;Lexpo/modules/kotlin/types/AnyType;)V",
        "isNullable",
        "",
        "()Z",
        "getName",
        "()Ljava/lang/String;",
        "getType$expo_modules_core_release",
        "()Lexpo/modules/kotlin/types/AnyType;",
        "set",
        "",
        "prop",
        "Lcom/facebook/react/bridge/Dynamic;",
        "onView",
        "Landroid/view/View;",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
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
.field private final name:Ljava/lang/String;

.field private final type:Lexpo/modules/kotlin/types/AnyType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lexpo/modules/kotlin/types/AnyType;)V
    .locals 1

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/views/AnyViewProp;->name:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/kotlin/views/AnyViewProp;->type:Lexpo/modules/kotlin/types/AnyType;

    return-void
.end method

.method public static synthetic set$default(Lexpo/modules/kotlin/views/AnyViewProp;Lcom/facebook/react/bridge/Dynamic;Landroid/view/View;Lexpo/modules/kotlin/AppContext;ILjava/lang/Object;)V
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lexpo/modules/kotlin/views/AnyViewProp;->set(Lcom/facebook/react/bridge/Dynamic;Landroid/view/View;Lexpo/modules/kotlin/AppContext;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: set"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/views/AnyViewProp;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getType$expo_modules_core_release()Lexpo/modules/kotlin/types/AnyType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/views/AnyViewProp;->type:Lexpo/modules/kotlin/types/AnyType;

    return-object v0
.end method

.method public abstract isNullable()Z
.end method

.method public abstract set(Lcom/facebook/react/bridge/Dynamic;Landroid/view/View;Lexpo/modules/kotlin/AppContext;)V
.end method
