.class public interface abstract Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;
.super Ljava/lang/Object;
.source "AppContextActivityResultContract.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I::",
        "Ljava/io/Serializable;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008f\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0004\u0008\u0001\u0010\u00032\u00020\u0004J\u001d\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00028\u0000H&\u00a2\u0006\u0002\u0010\nJ\'\u0010\u000b\u001a\u00028\u00012\u0006\u0010\t\u001a\u00028\u00002\u0006\u0010\u000c\u001a\u00020\r2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0006H&\u00a2\u0006\u0002\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;",
        "I",
        "Ljava/io/Serializable;",
        "O",
        "",
        "createIntent",
        "Landroid/content/Intent;",
        "context",
        "Landroid/content/Context;",
        "input",
        "(Landroid/content/Context;Ljava/io/Serializable;)Landroid/content/Intent;",
        "parseResult",
        "resultCode",
        "",
        "intent",
        "(Ljava/io/Serializable;ILandroid/content/Intent;)Ljava/lang/Object;",
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


# virtual methods
.method public abstract createIntent(Landroid/content/Context;Ljava/io/Serializable;)Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TI;)",
            "Landroid/content/Intent;"
        }
    .end annotation
.end method

.method public abstract parseResult(Ljava/io/Serializable;ILandroid/content/Intent;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;I",
            "Landroid/content/Intent;",
            ")TO;"
        }
    .end annotation
.end method
