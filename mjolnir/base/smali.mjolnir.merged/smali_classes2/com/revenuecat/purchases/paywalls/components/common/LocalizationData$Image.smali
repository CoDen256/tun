.class public final Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;
.super Ljava/lang/Object;
.source "Localization.kt"

# interfaces
.implements Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Image"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image$$serializer;,
        Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0008\u0087@\u0018\u0000 \u00172\u00020\u0001:\u0002\u0016\u0017B\u0012\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001a\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bH\u00d6\u0003\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u000fH\u00d6\u0001\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0013H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0014\u0010\u0015R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u0088\u0001\u0002\u00f8\u0001\u0000\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;",
        "Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData;",
        "value",
        "Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;",
        "constructor-impl",
        "(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;",
        "getValue",
        "()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;",
        "equals",
        "",
        "other",
        "",
        "equals-impl",
        "(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;Ljava/lang/Object;)Z",
        "hashCode",
        "",
        "hashCode-impl",
        "(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)I",
        "toString",
        "",
        "toString-impl",
        "(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Ljava/lang/String;",
        "$serializer",
        "Companion",
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

.annotation runtime Lkotlin/jvm/JvmInline;
.end annotation

.annotation runtime Lkotlinx/serialization/Serializable;
.end annotation


# static fields
.field public static final Companion:Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image$Companion;


# instance fields
.field private final value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->Companion:Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image$Companion;

    return-void
.end method

.method private synthetic constructor <init>(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    return-void
.end method

.method public static final synthetic box-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;

    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;-><init>(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)V

    return-object v0
.end method

.method public static constructor-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;
    .locals 1

    const-string v0, "value"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static equals-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;

    invoke-virtual {p1}, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->unbox-impl()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static final equals-impl0(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Z
    .locals 0

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static hashCode-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)I
    .locals 0

    invoke-virtual {p0}, Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;->hashCode()I

    move-result p0

    return p0
.end method

.method public static toString-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Image(value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    invoke-static {v0, p1}, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->equals-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final synthetic getValue()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    invoke-static {v0}, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->hashCode-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    invoke-static {v0}, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->toString-impl(Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic unbox-impl()Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/paywalls/components/common/LocalizationData$Image;->value:Lcom/revenuecat/purchases/paywalls/components/properties/ThemeImageUrls;

    return-object v0
.end method
