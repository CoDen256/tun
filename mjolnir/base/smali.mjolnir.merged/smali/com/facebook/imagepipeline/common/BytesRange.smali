.class public final Lcom/facebook/imagepipeline/common/BytesRange;
.super Ljava/lang/Object;
.source "BytesRange.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/common/BytesRange$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0087\u0008\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0005J\t\u0010\u0006\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0007\u001a\u00020\u0003H\u00c6\u0003J\u0013\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u0000H\u0086\u0002J\u001d\u0010\u000b\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u000c\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u000e\u001a\u00020\u0003H\u0016J\u0006\u0010\u000f\u001a\u00020\u0010J\u0008\u0010\u0011\u001a\u00020\u0010H\u0016R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/common/BytesRange;",
        "",
        "from",
        "",
        "to",
        "(II)V",
        "component1",
        "component2",
        "contains",
        "",
        "compare",
        "copy",
        "equals",
        "other",
        "hashCode",
        "toHttpRangeHeaderValue",
        "",
        "toString",
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
.field public static final Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

.field public static final TO_END_OF_CONTENT:I = 0x7fffffff

.field private static final headerParsingRegEx$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final from:I

.field public final to:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/common/BytesRange;->Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    .line 86
    sget-object v0, Lcom/facebook/imagepipeline/common/BytesRange$Companion$headerParsingRegEx$2;->INSTANCE:Lcom/facebook/imagepipeline/common/BytesRange$Companion$headerParsingRegEx$2;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/facebook/imagepipeline/common/BytesRange;->headerParsingRegEx$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    iput p2, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    return-void
.end method

.method public static final synthetic access$getHeaderParsingRegEx$delegate$cp()Lkotlin/Lazy;
    .locals 1

    sget-object v0, Lcom/facebook/imagepipeline/common/BytesRange;->headerParsingRegEx$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static synthetic copy$default(Lcom/facebook/imagepipeline/common/BytesRange;IIILjava/lang/Object;)Lcom/facebook/imagepipeline/common/BytesRange;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget p1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget p2, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/common/BytesRange;->copy(II)Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object p0

    return-object p0
.end method

.method public static final from(I)Lcom/facebook/imagepipeline/common/BytesRange;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/BytesRange;->Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->from(I)Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object p0

    return-object p0
.end method

.method public static final fromContentRangeHeader(Ljava/lang/String;)Lcom/facebook/imagepipeline/common/BytesRange;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/BytesRange;->Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->fromContentRangeHeader(Ljava/lang/String;)Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object p0

    return-object p0
.end method

.method public static final toMax(I)Lcom/facebook/imagepipeline/common/BytesRange;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/BytesRange;->Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->toMax(I)Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    return v0
.end method

.method public final component2()I
    .locals 1

    iget v0, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    return v0
.end method

.method public final contains(Lcom/facebook/imagepipeline/common/BytesRange;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    .line 58
    iget v2, p1, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    if-gt v1, v2, :cond_1

    iget p1, p1, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    iget v1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    if-gt p1, v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0
.end method

.method public final copy(II)Lcom/facebook/imagepipeline/common/BytesRange;
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/common/BytesRange;

    invoke-direct {v0, p1, p2}, Lcom/facebook/imagepipeline/common/BytesRange;-><init>(II)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 69
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    return v2

    :cond_2
    const-string v1, "null cannot be cast to non-null type com.facebook.imagepipeline.common.BytesRange"

    .line 73
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/common/BytesRange;

    iget v1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    .line 75
    iget v3, p1, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    if-ne v1, v3, :cond_3

    iget v1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    iget p1, p1, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    if-ne v1, p1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v2

    :goto_1
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    add-int/2addr v0, v1

    return v0
.end method

.method public final toHttpRangeHeaderValue()Ljava/lang/String;
    .locals 5

    .line 49
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    sget-object v2, Lcom/facebook/imagepipeline/common/BytesRange;->Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    iget v3, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->access$valueOrEmpty(Lcom/facebook/imagepipeline/common/BytesRange$Companion;I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    iget v3, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->access$valueOrEmpty(Lcom/facebook/imagepipeline/common/BytesRange$Companion;I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "bytes=%s-%s"

    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "format(locale, format, *args)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 62
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    sget-object v2, Lcom/facebook/imagepipeline/common/BytesRange;->Companion:Lcom/facebook/imagepipeline/common/BytesRange$Companion;

    iget v3, p0, Lcom/facebook/imagepipeline/common/BytesRange;->from:I

    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->access$valueOrEmpty(Lcom/facebook/imagepipeline/common/BytesRange$Companion;I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    iget v3, p0, Lcom/facebook/imagepipeline/common/BytesRange;->to:I

    invoke-static {v2, v3}, Lcom/facebook/imagepipeline/common/BytesRange$Companion;->access$valueOrEmpty(Lcom/facebook/imagepipeline/common/BytesRange$Companion;I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "%s-%s"

    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "format(locale, format, *args)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
