.class Lcom/amazon/a/b/f$a$1;
.super Ljava/util/HashMap;
.source "LicenseFailurePromptContentMapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/a/b/f$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Lcom/amazon/a/a/i/c;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/amazon/a/b/f$a;


# direct methods
.method constructor <init>(Lcom/amazon/a/b/f$a;)V
    .locals 1

    iput-object p1, p0, Lcom/amazon/a/b/f$a$1;->a:Lcom/amazon/a/b/f$a;

    .line 43
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string p1, "NO_INTERNET"

    .line 45
    sget-object v0, Lcom/amazon/a/b/e;->d:Lcom/amazon/a/a/i/c;

    invoke-virtual {p0, p1, v0}, Lcom/amazon/a/b/f$a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "INVALID_CONTENT_ID"

    .line 47
    sget-object v0, Lcom/amazon/a/b/e;->e:Lcom/amazon/a/a/i/c;

    invoke-virtual {p0, p1, v0}, Lcom/amazon/a/b/f$a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "INTERNAL_SERVICE_ERROR"

    .line 49
    sget-object v0, Lcom/amazon/a/b/e;->f:Lcom/amazon/a/a/i/c;

    invoke-virtual {p0, p1, v0}, Lcom/amazon/a/b/f$a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
