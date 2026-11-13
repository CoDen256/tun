.class public final Lcom/revenuecat/purchases/NoCoreLibraryDesugaringException;
.super Ljava/lang/RuntimeException;
.source "NoCoreLibraryDesugaringException.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0002\u0018\u00002\u00060\u0001j\u0002`\u0002B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/revenuecat/purchases/NoCoreLibraryDesugaringException;",
        "Ljava/lang/RuntimeException;",
        "Lkotlin/RuntimeException;",
        "cause",
        "",
        "(Ljava/lang/Throwable;)V",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1

    const-string v0, "cause"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "Error building BillingFlowParams which is required to perform purchases in the Play store. This is due to an issue in Google\'s Billing Client library. Please check https://errors.rev.cat/no-core-library-desugaring for more info and to fix this issue."

    .line 8
    invoke-direct {p0, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
