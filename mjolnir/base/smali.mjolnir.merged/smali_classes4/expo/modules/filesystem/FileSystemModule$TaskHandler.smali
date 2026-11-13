.class Lexpo/modules/filesystem/FileSystemModule$TaskHandler;
.super Ljava/lang/Object;
.source "FileSystemModule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/filesystem/FileSystemModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TaskHandler"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0012\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lexpo/modules/filesystem/FileSystemModule$TaskHandler;",
        "",
        "call",
        "Lokhttp3/Call;",
        "(Lokhttp3/Call;)V",
        "getCall",
        "()Lokhttp3/Call;",
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
.field private final call:Lokhttp3/Call;


# direct methods
.method public constructor <init>(Lokhttp3/Call;)V
    .locals 1

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 951
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule$TaskHandler;->call:Lokhttp3/Call;

    return-void
.end method


# virtual methods
.method public final getCall()Lokhttp3/Call;
    .locals 1

    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule$TaskHandler;->call:Lokhttp3/Call;

    return-object v0
.end method
