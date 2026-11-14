.class public final Lcom/facebook/binaryresource/FileBinaryResource;
.super Ljava/lang/Object;
.source "FileBinaryResource.kt"

# interfaces
.implements Lcom/facebook/binaryresource/BinaryResource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/binaryresource/FileBinaryResource$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0013\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0096\u0002J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/facebook/binaryresource/FileBinaryResource;",
        "Lcom/facebook/binaryresource/BinaryResource;",
        "file",
        "Ljava/io/File;",
        "(Ljava/io/File;)V",
        "getFile",
        "()Ljava/io/File;",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "openStream",
        "Ljava/io/InputStream;",
        "read",
        "",
        "size",
        "",
        "Companion",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/binaryresource/FileBinaryResource$Companion;


# instance fields
.field private final file:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/binaryresource/FileBinaryResource$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/binaryresource/FileBinaryResource$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/binaryresource/FileBinaryResource;->Companion:Lcom/facebook/binaryresource/FileBinaryResource$Companion;

    return-void
.end method

.method private constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/File;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/binaryresource/FileBinaryResource;-><init>(Ljava/io/File;)V

    return-void
.end method

.method public static final create(Ljava/io/File;)Lcom/facebook/binaryresource/FileBinaryResource;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/binaryresource/FileBinaryResource;->Companion:Lcom/facebook/binaryresource/FileBinaryResource$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/binaryresource/FileBinaryResource$Companion;->create(Ljava/io/File;)Lcom/facebook/binaryresource/FileBinaryResource;

    move-result-object p0

    return-object p0
.end method

.method public static final createOrNull(Ljava/io/File;)Lcom/facebook/binaryresource/FileBinaryResource;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/binaryresource/FileBinaryResource;->Companion:Lcom/facebook/binaryresource/FileBinaryResource$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/binaryresource/FileBinaryResource$Companion;->createOrNull(Ljava/io/File;)Lcom/facebook/binaryresource/FileBinaryResource;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eqz p1, :cond_1

    .line 29
    instance-of v0, p1, Lcom/facebook/binaryresource/FileBinaryResource;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    .line 32
    check-cast p1, Lcom/facebook/binaryresource/FileBinaryResource;

    iget-object p1, p1, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getFile()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    .line 35
    invoke-virtual {v0}, Ljava/io/File;->hashCode()I

    move-result v0

    return v0
.end method

.method public openStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    check-cast v0, Ljava/io/InputStream;

    return-object v0
.end method

.method public read()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    .line 26
    invoke-static {v0}, Lcom/facebook/common/internal/Files;->toByteArray(Ljava/io/File;)[B

    move-result-object v0

    const-string/jumbo v1, "toByteArray(file)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public size()J
    .locals 2

    iget-object v0, p0, Lcom/facebook/binaryresource/FileBinaryResource;->file:Ljava/io/File;

    .line 24
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method
