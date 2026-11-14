.class public Lexpo/modules/core/errors/InvalidArgumentException;
.super Lexpo/modules/core/errors/CodedRuntimeException;
.source "InvalidArgumentException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lexpo/modules/core/errors/CodedRuntimeException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lexpo/modules/core/errors/CodedRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lexpo/modules/core/errors/CodedRuntimeException;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    const-string v0, "ERR_INVALID_ARGUMENT"

    return-object v0
.end method
