.class public final Lokio/internal/HashFunctionKt$newHashFunction$1;
.super Ljava/lang/Object;
.source "HashFunction.kt"

# interfaces
.implements Lokio/internal/HashFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lokio/internal/HashFunctionKt;->newHashFunction(Ljava/lang/String;)Lokio/internal/HashFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00050\u0005H\u0016J \u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\nH\u0016R\u0016\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "okio/internal/HashFunctionKt$newHashFunction$1",
        "Lokio/internal/HashFunction;",
        "digest",
        "Ljava/security/MessageDigest;",
        "kotlin.jvm.PlatformType",
        "",
        "update",
        "",
        "input",
        "offset",
        "",
        "byteCount",
        "okio"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $algorithm:Ljava/lang/String;

.field private final digest:Ljava/security/MessageDigest;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lokio/internal/HashFunctionKt$newHashFunction$1;->$algorithm:Ljava/lang/String;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    iput-object p1, p0, Lokio/internal/HashFunctionKt$newHashFunction$1;->digest:Ljava/security/MessageDigest;

    return-void
.end method


# virtual methods
.method public digest()[B
    .locals 1

    iget-object v0, p0, Lokio/internal/HashFunctionKt$newHashFunction$1;->digest:Ljava/security/MessageDigest;

    .line 32
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    return-object v0
.end method

.method public update([BII)V
    .locals 1

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lokio/internal/HashFunctionKt$newHashFunction$1;->digest:Ljava/security/MessageDigest;

    .line 26
    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    return-void
.end method
