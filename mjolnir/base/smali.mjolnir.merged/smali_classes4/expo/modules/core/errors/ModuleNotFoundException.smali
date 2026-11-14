.class public Lexpo/modules/core/errors/ModuleNotFoundException;
.super Lexpo/modules/core/errors/CodedException;
.source "ModuleNotFoundException.java"

# interfaces
.implements Lexpo/modules/core/interfaces/CodedThrowable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Module \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' not found. Are you sure all modules are linked correctly?"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lexpo/modules/core/errors/CodedException;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    const-string v0, "E_MODULE_NOT_FOUND"

    return-object v0
.end method
