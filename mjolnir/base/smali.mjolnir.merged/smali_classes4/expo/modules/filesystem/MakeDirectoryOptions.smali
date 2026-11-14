.class public final Lexpo/modules/filesystem/MakeDirectoryOptions;
.super Ljava/lang/Object;
.source "FileSystemRecords.kt"

# interfaces
.implements Lexpo/modules/kotlin/records/Record;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u000f\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\t\u0010\t\u001a\u00020\u0003H\u00c6\u0003J\u0013\u0010\n\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u000b\u001a\u00020\u00032\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u00d6\u0003J\t\u0010\u000e\u001a\u00020\u000fH\u00d6\u0001J\t\u0010\u0010\u001a\u00020\u0011H\u00d6\u0001R\u001c\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0012"
    }
    d2 = {
        "Lexpo/modules/filesystem/MakeDirectoryOptions;",
        "Lexpo/modules/kotlin/records/Record;",
        "intermediates",
        "",
        "(Z)V",
        "getIntermediates$annotations",
        "()V",
        "getIntermediates",
        "()Z",
        "component1",
        "copy",
        "equals",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "",
        "expo-file-system_release"
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
.field private final intermediates:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lexpo/modules/filesystem/MakeDirectoryOptions;-><init>(ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    return-void
.end method

.method public synthetic constructor <init>(ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 43
    :cond_0
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/MakeDirectoryOptions;-><init>(Z)V

    return-void
.end method

.method public static synthetic copy$default(Lexpo/modules/filesystem/MakeDirectoryOptions;ZILjava/lang/Object;)Lexpo/modules/filesystem/MakeDirectoryOptions;
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    iget-boolean p1, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    :cond_0
    invoke-virtual {p0, p1}, Lexpo/modules/filesystem/MakeDirectoryOptions;->copy(Z)Lexpo/modules/filesystem/MakeDirectoryOptions;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic getIntermediates$annotations()V
    .locals 0
    .annotation runtime Lexpo/modules/kotlin/records/Field;
    .end annotation

    return-void
.end method


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    return v0
.end method

.method public final copy(Z)Lexpo/modules/filesystem/MakeDirectoryOptions;
    .locals 1

    new-instance v0, Lexpo/modules/filesystem/MakeDirectoryOptions;

    invoke-direct {v0, p1}, Lexpo/modules/filesystem/MakeDirectoryOptions;-><init>(Z)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lexpo/modules/filesystem/MakeDirectoryOptions;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lexpo/modules/filesystem/MakeDirectoryOptions;

    iget-boolean v1, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    iget-boolean p1, p1, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    if-eq v1, p1, :cond_2

    return v2

    :cond_2
    return v0
.end method

.method public final getIntermediates()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    invoke-static {v0}, Lexpo/modules/filesystem/DeletingOptions$$ExternalSyntheticBackport0;->m(Z)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    iget-boolean v0, p0, Lexpo/modules/filesystem/MakeDirectoryOptions;->intermediates:Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MakeDirectoryOptions(intermediates="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
