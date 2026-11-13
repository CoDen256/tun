.class public final Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller$DefaultImpls;
.super Ljava/lang/Object;
.source "AppContextActivityResultCaller.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$nFgaEK2Ab6PNIwZmpbCl9ayIrdE(Ljava/io/Serializable;Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller$DefaultImpls;->registerForActivityResult$lambda$0(Ljava/io/Serializable;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic registerForActivityResult$default(Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller;Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    if-nez p5, :cond_1

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 25
    new-instance p2, Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller$DefaultImpls$$ExternalSyntheticLambda0;

    invoke-direct {p2}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller$DefaultImpls$$ExternalSyntheticLambda0;-><init>()V

    .line 23
    :cond_0
    invoke-interface {p0, p1, p2, p3}, Lexpo/modules/kotlin/activityresult/AppContextActivityResultCaller;->registerForActivityResult(Lexpo/modules/kotlin/activityresult/AppContextActivityResultContract;Lexpo/modules/kotlin/activityresult/AppContextActivityResultFallbackCallback;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: registerForActivityResult"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static registerForActivityResult$lambda$0(Ljava/io/Serializable;Ljava/lang/Object;)V
    .locals 0

    const-string p1, "<anonymous parameter 0>"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
