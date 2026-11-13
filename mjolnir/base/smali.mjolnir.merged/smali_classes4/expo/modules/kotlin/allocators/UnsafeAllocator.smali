.class public interface abstract Lexpo/modules/kotlin/allocators/UnsafeAllocator;
.super Ljava/lang/Object;
.source "UnsafeAllocator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0004\u0008\u00e6\u0080\u0001\u0018\u0000 \u0005*\u0004\u0008\u0000\u0010\u00012\u00020\u0002:\u0001\u0005J\r\u0010\u0003\u001a\u00028\u0000H&\u00a2\u0006\u0002\u0010\u0004\u00a8\u0006\u0006"
    }
    d2 = {
        "Lexpo/modules/kotlin/allocators/UnsafeAllocator;",
        "T",
        "",
        "newInstance",
        "()Ljava/lang/Object;",
        "Companion",
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


# static fields
.field public static final Companion:Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;->$$INSTANCE:Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;

    sput-object v0, Lexpo/modules/kotlin/allocators/UnsafeAllocator;->Companion:Lexpo/modules/kotlin/allocators/UnsafeAllocator$Companion;

    return-void
.end method


# virtual methods
.method public abstract newInstance()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
