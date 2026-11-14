.class public Lexpo/modules/kotlin/sharedobjects/SharedRef;
.super Lexpo/modules/kotlin/sharedobjects/SharedObject;
.source "SharedRef.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RefType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/sharedobjects/SharedObject;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0017\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002B\u0019\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0006R\u0013\u0010\u0003\u001a\u00028\u0000\u00a2\u0006\n\n\u0002\u0010\t\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lexpo/modules/kotlin/sharedobjects/SharedRef;",
        "RefType",
        "Lexpo/modules/kotlin/sharedobjects/SharedObject;",
        "ref",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
        "(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)V",
        "getRef",
        "()Ljava/lang/Object;",
        "Ljava/lang/Object;",
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
.field private final ref:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TRefType;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRefType;",
            "Lexpo/modules/kotlin/AppContext;",
            ")V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p2}, Lexpo/modules/kotlin/sharedobjects/SharedObject;-><init>(Lexpo/modules/kotlin/AppContext;)V

    iput-object p1, p0, Lexpo/modules/kotlin/sharedobjects/SharedRef;->ref:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 12
    :cond_0
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/sharedobjects/SharedRef;-><init>(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)V

    return-void
.end method


# virtual methods
.method public final getRef()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TRefType;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/sharedobjects/SharedRef;->ref:Ljava/lang/Object;

    return-object v0
.end method
