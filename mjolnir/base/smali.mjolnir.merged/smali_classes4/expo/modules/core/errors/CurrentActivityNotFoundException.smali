.class public Lexpo/modules/core/errors/CurrentActivityNotFoundException;
.super Lexpo/modules/core/errors/CodedException;
.source "CurrentActivityNotFoundException.java"

# interfaces
.implements Lexpo/modules/core/interfaces/CodedThrowable;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "Current activity not found. Make sure to call this method while your application is in foreground."

    .line 7
    invoke-direct {p0, v0}, Lexpo/modules/core/errors/CodedException;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    const-string v0, "E_CURRENT_ACTIVITY_NOT_FOUND"

    return-object v0
.end method
