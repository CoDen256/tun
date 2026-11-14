.class public final Lcom/revenuecat/purchases/utils/UrlConnectionFactory$DefaultImpls;
.super Ljava/lang/Object;
.source "UrlConnectionFactory.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/utils/UrlConnectionFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic createConnection$default(Lcom/revenuecat/purchases/utils/UrlConnectionFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/revenuecat/purchases/utils/UrlConnection;
    .locals 0

    .line 8
    invoke-static {p0, p1, p2, p3, p4}, Lcom/revenuecat/purchases/utils/UrlConnectionFactory$-CC;->createConnection$default(Lcom/revenuecat/purchases/utils/UrlConnectionFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/revenuecat/purchases/utils/UrlConnection;

    move-result-object p0

    return-object p0
.end method
