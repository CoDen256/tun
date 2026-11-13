.class public final Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;
.super Ljava/lang/Object;
.source "SubscriptionInfoResponse.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$$serializer;,
        Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$Companion;,
        Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008B\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0081\u0008\u0018\u0000 g2\u00020\u0001:\u0003fghB\u00e3\u0001\u0008\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0001\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u0008\u001a\u0004\u0018\u00010\t\u0012\u0008\u0008\u0001\u0010\n\u001a\u00020\u000b\u0012\n\u0008\u0001\u0010\u000c\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u000e\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u0010\u0012\n\u0008\u0001\u0010\u0011\u001a\u0004\u0018\u00010\u0012\u0012\n\u0008\u0001\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\n\u0008\u0001\u0010\u0016\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0001\u0010\u0017\u001a\u0004\u0018\u00010\u0015\u0012\n\u0008\u0001\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u0012\n\u0008\u0001\u0010\u001a\u001a\u0004\u0018\u00010\u0015\u0012\n\u0008\u0001\u0010\u001b\u001a\u0004\u0018\u00010\u0015\u0012\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u00a2\u0006\u0002\u0010\u001eB\u00bf\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\n\u0008\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\n\u0008\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0015\u0012\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u0012\n\u0008\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0015\u0012\n\u0008\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0015\u00a2\u0006\u0002\u0010\u001fJ\t\u0010I\u001a\u00020\u0005H\u00c6\u0003J\t\u0010J\u001a\u00020\u0012H\u00c6\u0003J\u000b\u0010K\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010L\u001a\u0004\u0018\u00010\u0015H\u00c6\u0003J\u000b\u0010M\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010N\u001a\u0004\u0018\u00010\u0015H\u00c6\u0003J\u000b\u0010O\u001a\u0004\u0018\u00010\u0019H\u00c6\u0003J\u000b\u0010P\u001a\u0004\u0018\u00010\u0015H\u00c6\u0003J\u000b\u0010Q\u001a\u0004\u0018\u00010\u0015H\u00c6\u0003J\u000b\u0010R\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010S\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\t\u0010T\u001a\u00020\tH\u00c6\u0003J\t\u0010U\u001a\u00020\u000bH\u00c6\u0003J\u000b\u0010V\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010W\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010X\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\t\u0010Y\u001a\u00020\u0010H\u00c6\u0003J\u00cb\u0001\u0010Z\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u00102\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u00122\n\u0008\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\n\u0008\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00152\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00192\n\u0008\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00152\n\u0008\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0015H\u00c6\u0001J\u0013\u0010[\u001a\u00020\u000b2\u0008\u0010\\\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010]\u001a\u00020\u0003H\u00d6\u0001J\t\u0010^\u001a\u00020\u0015H\u00d6\u0001J!\u0010_\u001a\u00020`2\u0006\u0010a\u001a\u00020\u00002\u0006\u0010b\u001a\u00020c2\u0006\u0010d\u001a\u00020eH\u00c7\u0001R\u001e\u0010\u0016\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008 \u0010!\u001a\u0004\u0008\"\u0010#R\u001e\u0010\r\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008$\u0010!\u001a\u0004\u0008%\u0010#R\u001e\u0010\u0017\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008&\u0010!\u001a\u0004\u0008\'\u0010(R\u001e\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008)\u0010!\u001a\u0004\u0008*\u0010#R\u001e\u0010\u000e\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008+\u0010!\u001a\u0004\u0008,\u0010#R\u001c\u0010\n\u001a\u00020\u000b8\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008-\u0010!\u001a\u0004\u0008\n\u0010.R\u001e\u0010\u001b\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008/\u0010!\u001a\u0004\u00080\u0010(R\u001e\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u00081\u0010!\u001a\u0004\u00082\u0010#R\u001c\u0010\u000f\u001a\u00020\u00108\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u00083\u0010!\u001a\u0004\u00084\u00105R\u001c\u0010\u0011\u001a\u00020\u00128\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u00086\u0010!\u001a\u0004\u00087\u00108R\u001e\u0010\u0018\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u00089\u0010!\u001a\u0004\u0008:\u0010;R\u001e\u0010\u001a\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008<\u0010!\u001a\u0004\u0008=\u0010(R\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008>\u0010!\u001a\u0004\u0008?\u0010#R\u001e\u0010\u0013\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008@\u0010!\u001a\u0004\u0008A\u0010#R\u001c\u0010\u0008\u001a\u00020\t8\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008B\u0010!\u001a\u0004\u0008C\u0010DR\u001e\u0010\u0014\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008E\u0010!\u001a\u0004\u0008F\u0010(R\u001e\u0010\u000c\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008G\u0010!\u001a\u0004\u0008H\u0010#\u00a8\u0006i"
    }
    d2 = {
        "Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;",
        "",
        "seen1",
        "",
        "purchaseDate",
        "Ljava/util/Date;",
        "originalPurchaseDate",
        "expiresDate",
        "store",
        "Lcom/revenuecat/purchases/Store;",
        "isSandbox",
        "",
        "unsubscribeDetectedAt",
        "billingIssuesDetectedAt",
        "gracePeriodExpiresDate",
        "ownershipType",
        "Lcom/revenuecat/purchases/OwnershipType;",
        "periodType",
        "Lcom/revenuecat/purchases/PeriodType;",
        "refundedAt",
        "storeTransactionId",
        "",
        "autoResumeDate",
        "displayName",
        "price",
        "Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;",
        "productPlanIdentifier",
        "managementURL",
        "serializationConstructorMarker",
        "Lkotlinx/serialization/internal/SerializationConstructorMarker;",
        "(ILjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V",
        "(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;)V",
        "getAutoResumeDate$annotations",
        "()V",
        "getAutoResumeDate",
        "()Ljava/util/Date;",
        "getBillingIssuesDetectedAt$annotations",
        "getBillingIssuesDetectedAt",
        "getDisplayName$annotations",
        "getDisplayName",
        "()Ljava/lang/String;",
        "getExpiresDate$annotations",
        "getExpiresDate",
        "getGracePeriodExpiresDate$annotations",
        "getGracePeriodExpiresDate",
        "isSandbox$annotations",
        "()Z",
        "getManagementURL$annotations",
        "getManagementURL",
        "getOriginalPurchaseDate$annotations",
        "getOriginalPurchaseDate",
        "getOwnershipType$annotations",
        "getOwnershipType",
        "()Lcom/revenuecat/purchases/OwnershipType;",
        "getPeriodType$annotations",
        "getPeriodType",
        "()Lcom/revenuecat/purchases/PeriodType;",
        "getPrice$annotations",
        "getPrice",
        "()Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;",
        "getProductPlanIdentifier$annotations",
        "getProductPlanIdentifier",
        "getPurchaseDate$annotations",
        "getPurchaseDate",
        "getRefundedAt$annotations",
        "getRefundedAt",
        "getStore$annotations",
        "getStore",
        "()Lcom/revenuecat/purchases/Store;",
        "getStoreTransactionId$annotations",
        "getStoreTransactionId",
        "getUnsubscribeDetectedAt$annotations",
        "getUnsubscribeDetectedAt",
        "component1",
        "component10",
        "component11",
        "component12",
        "component13",
        "component14",
        "component15",
        "component16",
        "component17",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "component9",
        "copy",
        "equals",
        "other",
        "hashCode",
        "toString",
        "write$Self",
        "",
        "self",
        "output",
        "Lkotlinx/serialization/encoding/CompositeEncoder;",
        "serialDesc",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "$serializer",
        "Companion",
        "PriceResponse",
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

.annotation runtime Lkotlinx/serialization/Serializable;
.end annotation


# static fields
.field private static final $childSerializers:[Lkotlinx/serialization/KSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lkotlinx/serialization/KSerializer<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final Companion:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$Companion;


# instance fields
.field private final autoResumeDate:Ljava/util/Date;

.field private final billingIssuesDetectedAt:Ljava/util/Date;

.field private final displayName:Ljava/lang/String;

.field private final expiresDate:Ljava/util/Date;

.field private final gracePeriodExpiresDate:Ljava/util/Date;

.field private final isSandbox:Z

.field private final managementURL:Ljava/lang/String;

.field private final originalPurchaseDate:Ljava/util/Date;

.field private final ownershipType:Lcom/revenuecat/purchases/OwnershipType;

.field private final periodType:Lcom/revenuecat/purchases/PeriodType;

.field private final price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

.field private final productPlanIdentifier:Ljava/lang/String;

.field private final purchaseDate:Ljava/util/Date;

.field private final refundedAt:Ljava/util/Date;

.field private final store:Lcom/revenuecat/purchases/Store;

.field private final storeTransactionId:Ljava/lang/String;

.field private final unsubscribeDetectedAt:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->Companion:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$Companion;

    const/16 v0, 0x11

    new-array v0, v0, [Lkotlinx/serialization/KSerializer;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 17
    sget-object v2, Lcom/revenuecat/purchases/Store;->Companion:Lcom/revenuecat/purchases/Store$Companion;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/Store$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v0, v3

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v2, Lcom/revenuecat/purchases/OwnershipType;->Companion:Lcom/revenuecat/purchases/OwnershipType$Companion;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/OwnershipType$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0x8

    aput-object v2, v0, v3

    sget-object v2, Lcom/revenuecat/purchases/PeriodType;->Companion:Lcom/revenuecat/purchases/PeriodType$Companion;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/PeriodType$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0x9

    aput-object v2, v0, v3

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const/16 v2, 0xe

    aput-object v1, v0, v2

    const/16 v2, 0xf

    aput-object v1, v0, v2

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sput-object v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V
    .locals 4
    .param p2    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "purchase_date"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "original_purchase_date"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "expires_date"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p5    # Lcom/revenuecat/purchases/Store;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "store"
        .end annotation
    .end param
    .param p6    # Z
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "is_sandbox"
        .end annotation
    .end param
    .param p7    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "unsubscribe_detected_at"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p8    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "billing_issues_detected_at"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p9    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "grace_period_expires_date"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p10    # Lcom/revenuecat/purchases/OwnershipType;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "ownership_type"
        .end annotation
    .end param
    .param p11    # Lcom/revenuecat/purchases/PeriodType;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "period_type"
        .end annotation
    .end param
    .param p12    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "refunded_at"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p13    # Ljava/lang/String;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "store_transaction_id"
        .end annotation
    .end param
    .param p14    # Ljava/util/Date;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "auto_resume_date"
        .end annotation

        .annotation runtime Lkotlinx/serialization/Serializable;
            with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
        .end annotation
    .end param
    .param p15    # Ljava/lang/String;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "display_name"
        .end annotation
    .end param
    .param p16    # Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "price"
        .end annotation
    .end param
    .param p17    # Ljava/lang/String;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "product_plan_identifier"
        .end annotation
    .end param
    .param p18    # Ljava/lang/String;
        .annotation runtime Lkotlinx/serialization/SerialName;
            value = "management_url"
        .end annotation
    .end param
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "This synthesized declaration should not be used directly"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    move-object v0, p0

    move v1, p1

    and-int/lit16 v2, v1, 0x219

    const/16 v3, 0x219

    if-eq v3, v2, :cond_0

    .line 17
    sget-object v2, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$$serializer;

    invoke-virtual {v2}, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$$serializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v2

    invoke-static {p1, v3, v2}, Lkotlinx/serialization/internal/PluginExceptionsKt;->throwMissingFieldException(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v2, p2

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    and-int/lit8 v2, v1, 0x2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    goto :goto_0

    :cond_1
    move-object v2, p3

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    :goto_0
    and-int/lit8 v2, v1, 0x4

    if-nez v2, :cond_2

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    goto :goto_1

    :cond_2
    move-object v2, p4

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    :goto_1
    move-object v2, p5

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    move v2, p6

    iput-boolean v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    and-int/lit8 v2, v1, 0x20

    if-nez v2, :cond_3

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    goto :goto_2

    :cond_3
    move-object v2, p7

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    :goto_2
    and-int/lit8 v2, v1, 0x40

    if-nez v2, :cond_4

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    goto :goto_3

    :cond_4
    move-object v2, p8

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    :goto_3
    and-int/lit16 v2, v1, 0x80

    if-nez v2, :cond_5

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    goto :goto_4

    :cond_5
    move-object v2, p9

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    :goto_4
    and-int/lit16 v2, v1, 0x100

    if-nez v2, :cond_6

    .line 37
    sget-object v2, Lcom/revenuecat/purchases/OwnershipType;->UNKNOWN:Lcom/revenuecat/purchases/OwnershipType;

    goto :goto_5

    :cond_6
    move-object v2, p10

    :goto_5
    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    move-object v2, p11

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    and-int/lit16 v2, v1, 0x400

    if-nez v2, :cond_7

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    goto :goto_6

    :cond_7
    move-object/from16 v2, p12

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    :goto_6
    and-int/lit16 v2, v1, 0x800

    if-nez v2, :cond_8

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    goto :goto_7

    :cond_8
    move-object/from16 v2, p13

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    :goto_7
    and-int/lit16 v2, v1, 0x1000

    if-nez v2, :cond_9

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    goto :goto_8

    :cond_9
    move-object/from16 v2, p14

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    :goto_8
    and-int/lit16 v2, v1, 0x2000

    if-nez v2, :cond_a

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    goto :goto_9

    :cond_a
    move-object/from16 v2, p15

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    :goto_9
    and-int/lit16 v2, v1, 0x4000

    if-nez v2, :cond_b

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    goto :goto_a

    :cond_b
    move-object/from16 v2, p16

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    :goto_a
    const v2, 0x8000

    and-int/2addr v2, v1

    if-nez v2, :cond_c

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    goto :goto_b

    :cond_c
    move-object/from16 v2, p17

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    :goto_b
    const/high16 v2, 0x10000

    and-int/2addr v1, v2

    if-nez v1, :cond_d

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    goto :goto_c

    :cond_d
    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    :goto_c
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p4

    move-object v3, p9

    move-object/from16 v4, p10

    const-string v5, "purchaseDate"

    invoke-static {p1, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "store"

    invoke-static {p4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "ownershipType"

    invoke-static {p9, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "periodType"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    move-object v1, p2

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    move-object v1, p3

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    iput-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    move v1, p5

    iput-boolean v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    move-object v1, p6

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    move-object v1, p7

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    move-object v1, p8

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    iput-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    iput-object v4, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    move-object/from16 v1, p11

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    move-object/from16 v1, p12

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 21

    move/from16 v0, p18

    and-int/lit8 v1, v0, 0x2

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v5, v2

    goto :goto_0

    :cond_0
    move-object/from16 v5, p2

    :goto_0
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_1

    move-object v6, v2

    goto :goto_1

    :cond_1
    move-object/from16 v6, p3

    :goto_1
    and-int/lit8 v1, v0, 0x20

    if-eqz v1, :cond_2

    move-object v9, v2

    goto :goto_2

    :cond_2
    move-object/from16 v9, p6

    :goto_2
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_3

    move-object v10, v2

    goto :goto_3

    :cond_3
    move-object/from16 v10, p7

    :goto_3
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_4

    move-object v11, v2

    goto :goto_4

    :cond_4
    move-object/from16 v11, p8

    :goto_4
    and-int/lit16 v1, v0, 0x100

    if-eqz v1, :cond_5

    .line 37
    sget-object v1, Lcom/revenuecat/purchases/OwnershipType;->UNKNOWN:Lcom/revenuecat/purchases/OwnershipType;

    move-object v12, v1

    goto :goto_5

    :cond_5
    move-object/from16 v12, p9

    :goto_5
    and-int/lit16 v1, v0, 0x400

    if-eqz v1, :cond_6

    move-object v14, v2

    goto :goto_6

    :cond_6
    move-object/from16 v14, p11

    :goto_6
    and-int/lit16 v1, v0, 0x800

    if-eqz v1, :cond_7

    move-object v15, v2

    goto :goto_7

    :cond_7
    move-object/from16 v15, p12

    :goto_7
    and-int/lit16 v1, v0, 0x1000

    if-eqz v1, :cond_8

    move-object/from16 v16, v2

    goto :goto_8

    :cond_8
    move-object/from16 v16, p13

    :goto_8
    and-int/lit16 v1, v0, 0x2000

    if-eqz v1, :cond_9

    move-object/from16 v17, v2

    goto :goto_9

    :cond_9
    move-object/from16 v17, p14

    :goto_9
    and-int/lit16 v1, v0, 0x4000

    if-eqz v1, :cond_a

    move-object/from16 v18, v2

    goto :goto_a

    :cond_a
    move-object/from16 v18, p15

    :goto_a
    const v1, 0x8000

    and-int/2addr v1, v0

    if-eqz v1, :cond_b

    move-object/from16 v19, v2

    goto :goto_b

    :cond_b
    move-object/from16 v19, p16

    :goto_b
    const/high16 v1, 0x10000

    and-int/2addr v0, v1

    if-eqz v0, :cond_c

    move-object/from16 v20, v2

    goto :goto_c

    :cond_c
    move-object/from16 v20, p17

    :goto_c
    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v7, p4

    move/from16 v8, p5

    move-object/from16 v13, p10

    .line 19
    invoke-direct/range {v3 .. v20}, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;-><init>(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$get$childSerializers$cp()[Lkotlinx/serialization/KSerializer;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    return-object v0
.end method

.method public static synthetic copy$default(Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p18

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    goto :goto_0

    :cond_0
    move-object/from16 v2, p1

    :goto_0
    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_1

    iget-object v3, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    goto :goto_1

    :cond_1
    move-object/from16 v3, p2

    :goto_1
    and-int/lit8 v4, v1, 0x4

    if-eqz v4, :cond_2

    iget-object v4, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    goto :goto_2

    :cond_2
    move-object/from16 v4, p3

    :goto_2
    and-int/lit8 v5, v1, 0x8

    if-eqz v5, :cond_3

    iget-object v5, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    goto :goto_3

    :cond_3
    move-object/from16 v5, p4

    :goto_3
    and-int/lit8 v6, v1, 0x10

    if-eqz v6, :cond_4

    iget-boolean v6, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    goto :goto_4

    :cond_4
    move/from16 v6, p5

    :goto_4
    and-int/lit8 v7, v1, 0x20

    if-eqz v7, :cond_5

    iget-object v7, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    goto :goto_5

    :cond_5
    move-object/from16 v7, p6

    :goto_5
    and-int/lit8 v8, v1, 0x40

    if-eqz v8, :cond_6

    iget-object v8, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    goto :goto_6

    :cond_6
    move-object/from16 v8, p7

    :goto_6
    and-int/lit16 v9, v1, 0x80

    if-eqz v9, :cond_7

    iget-object v9, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    goto :goto_7

    :cond_7
    move-object/from16 v9, p8

    :goto_7
    and-int/lit16 v10, v1, 0x100

    if-eqz v10, :cond_8

    iget-object v10, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    goto :goto_8

    :cond_8
    move-object/from16 v10, p9

    :goto_8
    and-int/lit16 v11, v1, 0x200

    if-eqz v11, :cond_9

    iget-object v11, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    goto :goto_9

    :cond_9
    move-object/from16 v11, p10

    :goto_9
    and-int/lit16 v12, v1, 0x400

    if-eqz v12, :cond_a

    iget-object v12, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    goto :goto_a

    :cond_a
    move-object/from16 v12, p11

    :goto_a
    and-int/lit16 v13, v1, 0x800

    if-eqz v13, :cond_b

    iget-object v13, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    goto :goto_b

    :cond_b
    move-object/from16 v13, p12

    :goto_b
    and-int/lit16 v14, v1, 0x1000

    if-eqz v14, :cond_c

    iget-object v14, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    goto :goto_c

    :cond_c
    move-object/from16 v14, p13

    :goto_c
    and-int/lit16 v15, v1, 0x2000

    if-eqz v15, :cond_d

    iget-object v15, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    goto :goto_d

    :cond_d
    move-object/from16 v15, p14

    :goto_d
    move-object/from16 p14, v15

    and-int/lit16 v15, v1, 0x4000

    if-eqz v15, :cond_e

    iget-object v15, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    goto :goto_e

    :cond_e
    move-object/from16 v15, p15

    :goto_e
    const v16, 0x8000

    and-int v16, v1, v16

    move-object/from16 p15, v15

    if-eqz v16, :cond_f

    iget-object v15, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    goto :goto_f

    :cond_f
    move-object/from16 v15, p16

    :goto_f
    const/high16 v16, 0x10000

    and-int v1, v1, v16

    if-eqz v1, :cond_10

    iget-object v1, v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    goto :goto_10

    :cond_10
    move-object/from16 v1, p17

    :goto_10
    move-object/from16 p1, v2

    move-object/from16 p2, v3

    move-object/from16 p3, v4

    move-object/from16 p4, v5

    move/from16 p5, v6

    move-object/from16 p6, v7

    move-object/from16 p7, v8

    move-object/from16 p8, v9

    move-object/from16 p9, v10

    move-object/from16 p10, v11

    move-object/from16 p11, v12

    move-object/from16 p12, v13

    move-object/from16 p13, v14

    move-object/from16 p16, v15

    move-object/from16 p17, v1

    invoke-virtual/range {p0 .. p17}, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->copy(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic getAutoResumeDate$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "auto_resume_date"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getBillingIssuesDetectedAt$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "billing_issues_detected_at"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getDisplayName$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "display_name"
    .end annotation

    return-void
.end method

.method public static synthetic getExpiresDate$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "expires_date"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getGracePeriodExpiresDate$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "grace_period_expires_date"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getManagementURL$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "management_url"
    .end annotation

    return-void
.end method

.method public static synthetic getOriginalPurchaseDate$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "original_purchase_date"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getOwnershipType$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "ownership_type"
    .end annotation

    return-void
.end method

.method public static synthetic getPeriodType$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "period_type"
    .end annotation

    return-void
.end method

.method public static synthetic getPrice$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "price"
    .end annotation

    return-void
.end method

.method public static synthetic getProductPlanIdentifier$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "product_plan_identifier"
    .end annotation

    return-void
.end method

.method public static synthetic getPurchaseDate$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "purchase_date"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getRefundedAt$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "refunded_at"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic getStore$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "store"
    .end annotation

    return-void
.end method

.method public static synthetic getStoreTransactionId$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "store_transaction_id"
    .end annotation

    return-void
.end method

.method public static synthetic getUnsubscribeDetectedAt$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "unsubscribe_detected_at"
    .end annotation

    .annotation runtime Lkotlinx/serialization/Serializable;
        with = Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;
    .end annotation

    return-void
.end method

.method public static synthetic isSandbox$annotations()V
    .locals 0
    .annotation runtime Lkotlinx/serialization/SerialName;
        value = "is_sandbox"
    .end annotation

    return-void
.end method

.method public static final synthetic write$Self(Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V
    .locals 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->$childSerializers:[Lkotlinx/serialization/KSerializer;

    .line 17
    sget-object v1, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    const/4 v3, 0x0

    invoke-interface {p1, p2, v3, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    if-eqz v2, :cond_1

    :goto_0
    sget-object v2, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_1
    const/4 v1, 0x2

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    if-eqz v2, :cond_3

    :goto_1
    sget-object v2, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_3
    const/4 v1, 0x3

    aget-object v2, v0, v1

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    const/4 v1, 0x4

    iget-boolean v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    invoke-interface {p1, p2, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeBooleanElement(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    const/4 v1, 0x5

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_2

    :cond_4
    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    if-eqz v2, :cond_5

    :goto_2
    sget-object v2, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_5
    const/4 v1, 0x6

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_3

    :cond_6
    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    if-eqz v2, :cond_7

    :goto_3
    sget-object v2, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_7
    const/4 v1, 0x7

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_4

    :cond_8
    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    if-eqz v2, :cond_9

    :goto_4
    sget-object v2, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_9
    const/16 v1, 0x8

    invoke-interface {p1, p2, v1}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v2

    if-eqz v2, :cond_a

    goto :goto_5

    :cond_a
    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    .line 37
    sget-object v3, Lcom/revenuecat/purchases/OwnershipType;->UNKNOWN:Lcom/revenuecat/purchases/OwnershipType;

    if-eq v2, v3, :cond_b

    .line 17
    :goto_5
    aget-object v2, v0, v1

    check-cast v2, Lkotlinx/serialization/SerializationStrategy;

    iget-object v3, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    invoke-interface {p1, p2, v1, v2, v3}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_b
    const/16 v1, 0x9

    aget-object v0, v0, v1

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    invoke-interface {p1, p2, v1, v0, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    const/16 v0, 0xa

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_c

    goto :goto_6

    :cond_c
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    if-eqz v1, :cond_d

    :goto_6
    sget-object v1, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_d
    const/16 v0, 0xb

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_e

    goto :goto_7

    :cond_e
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    if-eqz v1, :cond_f

    :goto_7
    sget-object v1, Lkotlinx/serialization/internal/StringSerializer;->INSTANCE:Lkotlinx/serialization/internal/StringSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_f
    const/16 v0, 0xc

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_10

    goto :goto_8

    :cond_10
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    if-eqz v1, :cond_11

    :goto_8
    sget-object v1, Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;->INSTANCE:Lcom/revenuecat/purchases/utils/serializers/ISO8601DateSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_11
    const/16 v0, 0xd

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_9

    :cond_12
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    if-eqz v1, :cond_13

    :goto_9
    sget-object v1, Lkotlinx/serialization/internal/StringSerializer;->INSTANCE:Lkotlinx/serialization/internal/StringSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_13
    const/16 v0, 0xe

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_a

    :cond_14
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    if-eqz v1, :cond_15

    :goto_a
    sget-object v1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse$$serializer;->INSTANCE:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse$$serializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_15
    const/16 v0, 0xf

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_16

    goto :goto_b

    :cond_16
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    if-eqz v1, :cond_17

    :goto_b
    sget-object v1, Lkotlinx/serialization/internal/StringSerializer;->INSTANCE:Lkotlinx/serialization/internal/StringSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object v2, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    invoke-interface {p1, p2, v0, v1, v2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_17
    const/16 v0, 0x10

    invoke-interface {p1, p2, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->shouldEncodeElementDefault(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v1

    if-eqz v1, :cond_18

    goto :goto_c

    :cond_18
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    if-eqz v1, :cond_19

    :goto_c
    sget-object v1, Lkotlinx/serialization/internal/StringSerializer;->INSTANCE:Lkotlinx/serialization/internal/StringSerializer;

    check-cast v1, Lkotlinx/serialization/SerializationStrategy;

    iget-object p0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    invoke-interface {p1, p2, v0, v1, p0}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeNullableSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    :cond_19
    return-void
.end method


# virtual methods
.method public final component1()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    return-object v0
.end method

.method public final component10()Lcom/revenuecat/purchases/PeriodType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    return-object v0
.end method

.method public final component11()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    return-object v0
.end method

.method public final component12()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method public final component13()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    return-object v0
.end method

.method public final component14()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public final component15()Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    return-object v0
.end method

.method public final component16()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public final component17()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    return-object v0
.end method

.method public final component3()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    return-object v0
.end method

.method public final component4()Lcom/revenuecat/purchases/Store;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    return-object v0
.end method

.method public final component5()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    return v0
.end method

.method public final component6()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    return-object v0
.end method

.method public final component7()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    return-object v0
.end method

.method public final component8()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    return-object v0
.end method

.method public final component9()Lcom/revenuecat/purchases/OwnershipType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    return-object v0
.end method

.method public final copy(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;
    .locals 20

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    move-object/from16 v15, p15

    move-object/from16 v16, p16

    move-object/from16 v17, p17

    const-string v0, "purchaseDate"

    move-object/from16 v18, v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "store"

    move-object/from16 v1, p4

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "ownershipType"

    move-object/from16 v1, p9

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "periodType"

    move-object/from16 v1, p10

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v19, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-direct/range {v0 .. v17}, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;-><init>(Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;ZLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;Ljava/lang/String;Ljava/lang/String;)V

    return-object v19
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    iget-boolean v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    if-eq v1, v3, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    if-eq v1, v3, :cond_a

    return v2

    :cond_a
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    if-eq v1, v3, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v2

    :cond_c
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    return v2

    :cond_e
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    return v2

    :cond_f
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    return v2

    :cond_10
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    iget-object v3, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    return v2

    :cond_11
    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    iget-object p1, p1, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_12

    return v2

    :cond_12
    return v0
.end method

.method public final getAutoResumeDate()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    return-object v0
.end method

.method public final getBillingIssuesDetectedAt()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    return-object v0
.end method

.method public final getDisplayName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public final getExpiresDate()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    return-object v0
.end method

.method public final getGracePeriodExpiresDate()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    return-object v0
.end method

.method public final getManagementURL()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    return-object v0
.end method

.method public final getOriginalPurchaseDate()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    return-object v0
.end method

.method public final getOwnershipType()Lcom/revenuecat/purchases/OwnershipType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    return-object v0
.end method

.method public final getPeriodType()Lcom/revenuecat/purchases/PeriodType;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    return-object v0
.end method

.method public final getPrice()Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    return-object v0
.end method

.method public final getProductPlanIdentifier()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public final getPurchaseDate()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    return-object v0
.end method

.method public final getRefundedAt()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    return-object v0
.end method

.method public final getStore()Lcom/revenuecat/purchases/Store;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    return-object v0
.end method

.method public final getStoreTransactionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method public final getUnsubscribeDetectedAt()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    if-nez v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/Store;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    :cond_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    if-nez v1, :cond_3

    move v1, v2

    goto :goto_2

    :cond_3
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    if-nez v1, :cond_4

    move v1, v2

    goto :goto_3

    :cond_4
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    if-nez v1, :cond_5

    move v1, v2

    goto :goto_4

    :cond_5
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/OwnershipType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    invoke-virtual {v1}, Lcom/revenuecat/purchases/PeriodType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    if-nez v1, :cond_6

    move v1, v2

    goto :goto_5

    :cond_6
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    if-nez v1, :cond_7

    move v1, v2

    goto :goto_6

    :cond_7
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    if-nez v1, :cond_8

    move v1, v2

    goto :goto_7

    :cond_8
    invoke-virtual {v1}, Ljava/util/Date;->hashCode()I

    move-result v1

    :goto_7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    if-nez v1, :cond_9

    move v1, v2

    goto :goto_8

    :cond_9
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    if-nez v1, :cond_a

    move v1, v2

    goto :goto_9

    :cond_a
    invoke-virtual {v1}, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;->hashCode()I

    move-result v1

    :goto_9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    if-nez v1, :cond_b

    move v1, v2

    goto :goto_a

    :cond_b
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    if-nez v1, :cond_c

    goto :goto_b

    :cond_c
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_b
    add-int/2addr v0, v2

    return v0
.end method

.method public final isSandbox()Z
    .locals 1

    iget-boolean v0, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SubscriptionInfoResponse(purchaseDate="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->purchaseDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", originalPurchaseDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->originalPurchaseDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", expiresDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->expiresDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", store="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->store:Lcom/revenuecat/purchases/Store;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isSandbox="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->isSandbox:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", unsubscribeDetectedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->unsubscribeDetectedAt:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", billingIssuesDetectedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->billingIssuesDetectedAt:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", gracePeriodExpiresDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->gracePeriodExpiresDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", ownershipType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->ownershipType:Lcom/revenuecat/purchases/OwnershipType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", periodType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->periodType:Lcom/revenuecat/purchases/PeriodType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", refundedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->refundedAt:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", storeTransactionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->storeTransactionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", autoResumeDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->autoResumeDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", displayName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", price="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->price:Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse$PriceResponse;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", productPlanIdentifier="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->productPlanIdentifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", managementURL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/revenuecat/purchases/common/responses/SubscriptionInfoResponse;->managementURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
