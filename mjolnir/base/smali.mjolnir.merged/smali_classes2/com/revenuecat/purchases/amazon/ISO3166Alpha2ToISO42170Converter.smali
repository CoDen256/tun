.class public final Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;
.super Ljava/lang/Object;
.source "ISO3166Alpha2ToISO42170Converter.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u0005R\u001a\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;",
        "",
        "()V",
        "conversions",
        "",
        "",
        "convertOrEmpty",
        "iso3166Alpha2Code",
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


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;

.field private static final conversions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;

    invoke-direct {v0}, Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;->INSTANCE:Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;

    const/16 v0, 0xf5

    new-array v0, v0, [Lkotlin/Pair;

    const-string v1, "AF"

    const-string v2, "AFN"

    .line 8
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "AL"

    const-string v2, "ALL"

    .line 9
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "DZ"

    const-string v2, "DZD"

    .line 10
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "AS"

    const-string v2, "USD"

    .line 11
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v3, 0x3

    aput-object v1, v0, v3

    const-string v1, "AD"

    const-string v3, "EUR"

    .line 12
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v4, 0x4

    aput-object v1, v0, v4

    const-string v1, "AO"

    const-string v4, "AOA"

    .line 13
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v4, 0x5

    aput-object v1, v0, v4

    const-string v1, "AI"

    const-string v4, "XCD"

    .line 14
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v5, 0x6

    aput-object v1, v0, v5

    const-string v1, "AG"

    .line 15
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v5, 0x7

    aput-object v1, v0, v5

    const-string v1, "AR"

    const-string v5, "ARS"

    .line 16
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v5, 0x8

    aput-object v1, v0, v5

    const-string v1, "AM"

    const-string v5, "AMD"

    .line 17
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v5, 0x9

    aput-object v1, v0, v5

    const-string v1, "AW"

    const-string v5, "AWG"

    .line 18
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v5, 0xa

    aput-object v1, v0, v5

    const-string v1, "AU"

    const-string v5, "AUD"

    .line 19
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0xb

    aput-object v1, v0, v6

    const-string v1, "AT"

    .line 20
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0xc

    aput-object v1, v0, v6

    const-string v1, "AZ"

    const-string v6, "AZN"

    .line 21
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0xd

    aput-object v1, v0, v6

    const-string v1, "BS"

    const-string v6, "BSD"

    .line 22
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0xe

    aput-object v1, v0, v6

    const-string v1, "BH"

    const-string v6, "BHD"

    .line 23
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0xf

    aput-object v1, v0, v6

    const-string v1, "BD"

    const-string v6, "BDT"

    .line 24
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0x10

    aput-object v1, v0, v6

    const-string v1, "BB"

    const-string v6, "BBD"

    .line 25
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0x11

    aput-object v1, v0, v6

    const-string v1, "BY"

    const-string v6, "BYR"

    .line 26
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0x12

    aput-object v1, v0, v6

    const-string v1, "BE"

    .line 27
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0x13

    aput-object v1, v0, v6

    const-string v1, "BZ"

    const-string v6, "BZD"

    .line 28
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v6, 0x14

    aput-object v1, v0, v6

    const-string v1, "BJ"

    const-string v6, "XOF"

    .line 29
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x15

    aput-object v1, v0, v7

    const-string v1, "BM"

    const-string v7, "BMD"

    .line 30
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x16

    aput-object v1, v0, v7

    const-string v1, "BT"

    const-string v7, "INR"

    .line 31
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v8, 0x17

    aput-object v1, v0, v8

    const-string v1, "BO"

    const-string v8, "BOB"

    .line 32
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v8, 0x18

    aput-object v1, v0, v8

    const-string v1, "BQ"

    .line 33
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v8, 0x19

    aput-object v1, v0, v8

    const-string v1, "BA"

    const-string v8, "BAM"

    .line 34
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v8, 0x1a

    aput-object v1, v0, v8

    const-string v1, "BW"

    const-string v8, "BWP"

    .line 35
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v8, 0x1b

    aput-object v1, v0, v8

    const-string v1, "BV"

    const-string v8, "NOK"

    .line 36
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x1c

    aput-object v1, v0, v9

    const-string v1, "BR"

    const-string v9, "BRL"

    .line 37
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x1d

    aput-object v1, v0, v9

    const-string v1, "IO"

    .line 38
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x1e

    aput-object v1, v0, v9

    const-string v1, "BN"

    const-string v9, "BND"

    .line 39
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x1f

    aput-object v1, v0, v9

    const-string v1, "BG"

    const-string v9, "BGN"

    .line 40
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x20

    aput-object v1, v0, v9

    const-string v1, "BF"

    .line 41
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x21

    aput-object v1, v0, v9

    const-string v1, "BI"

    const-string v9, "BIF"

    .line 42
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x22

    aput-object v1, v0, v9

    const-string v1, "KH"

    const-string v9, "KHR"

    .line 43
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x23

    aput-object v1, v0, v9

    const-string v1, "CM"

    const-string v9, "XAF"

    .line 44
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x24

    aput-object v1, v0, v10

    const-string v1, "CA"

    const-string v10, "CAD"

    .line 45
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x25

    aput-object v1, v0, v10

    const-string v1, "CV"

    const-string v10, "CVE"

    .line 46
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x26

    aput-object v1, v0, v10

    const-string v1, "KY"

    const-string v10, "KYD"

    .line 47
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x27

    aput-object v1, v0, v10

    const-string v1, "CF"

    .line 48
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x28

    aput-object v1, v0, v10

    const-string v1, "TD"

    .line 49
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x29

    aput-object v1, v0, v10

    const-string v1, "CL"

    const-string v10, "CLP"

    .line 50
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x2a

    aput-object v1, v0, v10

    const-string v1, "CN"

    const-string v10, "CNY"

    .line 51
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x2b

    aput-object v1, v0, v10

    const-string v1, "CX"

    .line 52
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x2c

    aput-object v1, v0, v10

    const-string v1, "CC"

    .line 53
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x2d

    aput-object v1, v0, v10

    const-string v1, "CO"

    const-string v10, "COP"

    .line 54
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x2e

    aput-object v1, v0, v10

    const-string v1, "KM"

    const-string v10, "KMF"

    .line 55
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x2f

    aput-object v1, v0, v10

    const-string v1, "CG"

    .line 56
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v10, 0x30

    aput-object v1, v0, v10

    const-string v1, "CK"

    const-string v10, "NZD"

    .line 57
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v11, 0x31

    aput-object v1, v0, v11

    const-string v1, "CR"

    const-string v11, "CRC"

    .line 58
    invoke-static {v1, v11}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v11, 0x32

    aput-object v1, v0, v11

    const-string v1, "HR"

    const-string v11, "HRK"

    .line 59
    invoke-static {v1, v11}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v11, 0x33

    aput-object v1, v0, v11

    const-string v1, "CU"

    const-string v11, "CUP"

    .line 60
    invoke-static {v1, v11}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v11, 0x34

    aput-object v1, v0, v11

    const-string v1, "CW"

    const-string v11, "ANG"

    .line 61
    invoke-static {v1, v11}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x35

    aput-object v1, v0, v12

    const-string v1, "CY"

    .line 62
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x36

    aput-object v1, v0, v12

    const-string v1, "CZ"

    const-string v12, "CZK"

    .line 63
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x37

    aput-object v1, v0, v12

    const-string v1, "CI"

    .line 64
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x38

    aput-object v1, v0, v12

    const-string v1, "DK"

    const-string v12, "DKK"

    .line 65
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x39

    aput-object v1, v0, v13

    const-string v1, "DJ"

    const-string v13, "DJF"

    .line 66
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x3a

    aput-object v1, v0, v13

    const-string v1, "DM"

    .line 67
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x3b

    aput-object v1, v0, v13

    const-string v1, "DO"

    const-string v13, "DOP"

    .line 68
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x3c

    aput-object v1, v0, v13

    const-string v1, "EC"

    .line 69
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x3d

    aput-object v1, v0, v13

    const-string v1, "EG"

    const-string v13, "EGP"

    .line 70
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x3e

    aput-object v1, v0, v13

    const-string v1, "SV"

    .line 71
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x3f

    aput-object v1, v0, v13

    const-string v1, "GQ"

    .line 72
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x40

    aput-object v1, v0, v13

    const-string v1, "ER"

    const-string v13, "ERN"

    .line 73
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x41

    aput-object v1, v0, v13

    const-string v1, "EE"

    .line 74
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x42

    aput-object v1, v0, v13

    const-string v1, "ET"

    const-string v13, "ETB"

    .line 75
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x43

    aput-object v1, v0, v13

    const-string v1, "FK"

    const-string v13, "FKP"

    .line 76
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x44

    aput-object v1, v0, v13

    const-string v1, "FO"

    .line 77
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x45

    aput-object v1, v0, v13

    const-string v1, "FJ"

    const-string v13, "FJD"

    .line 78
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x46

    aput-object v1, v0, v13

    const-string v1, "FI"

    .line 79
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x47

    aput-object v1, v0, v13

    const-string v1, "FR"

    .line 80
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x48

    aput-object v1, v0, v13

    const-string v1, "GF"

    .line 81
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v13, 0x49

    aput-object v1, v0, v13

    const-string v1, "PF"

    const-string v13, "XPF"

    .line 82
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x4a

    aput-object v1, v0, v14

    const-string v1, "TF"

    .line 83
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x4b

    aput-object v1, v0, v14

    const-string v1, "GA"

    .line 84
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x4c

    aput-object v1, v0, v9

    const-string v1, "GM"

    const-string v9, "GMD"

    .line 85
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x4d

    aput-object v1, v0, v9

    const-string v1, "GE"

    const-string v9, "GEL"

    .line 86
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x4e

    aput-object v1, v0, v9

    const-string v1, "DE"

    .line 87
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x4f

    aput-object v1, v0, v9

    const-string v1, "GH"

    const-string v9, "GHS"

    .line 88
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x50

    aput-object v1, v0, v9

    const-string v1, "GI"

    const-string v9, "GIP"

    .line 89
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x51

    aput-object v1, v0, v9

    const-string v1, "GR"

    .line 90
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x52

    aput-object v1, v0, v9

    const-string v1, "GL"

    .line 91
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x53

    aput-object v1, v0, v9

    const-string v1, "GD"

    .line 92
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x54

    aput-object v1, v0, v9

    const-string v1, "GP"

    .line 93
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x55

    aput-object v1, v0, v9

    const-string v1, "GU"

    .line 94
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x56

    aput-object v1, v0, v9

    const-string v1, "GT"

    const-string v9, "GTQ"

    .line 95
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v9, 0x57

    aput-object v1, v0, v9

    const-string v1, "GG"

    const-string v9, "GBP"

    .line 96
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x58

    aput-object v1, v0, v12

    const-string v1, "GN"

    const-string v12, "GNF"

    .line 97
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x59

    aput-object v1, v0, v12

    const-string v1, "GW"

    .line 98
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x5a

    aput-object v1, v0, v12

    const-string v1, "GY"

    const-string v12, "GYD"

    .line 99
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x5b

    aput-object v1, v0, v12

    const-string v1, "HT"

    .line 100
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x5c

    aput-object v1, v0, v12

    const-string v1, "HM"

    .line 101
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x5d

    aput-object v1, v0, v12

    const-string v1, "VA"

    .line 102
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x5e

    aput-object v1, v0, v12

    const-string v1, "HN"

    const-string v12, "HNL"

    .line 103
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x5f

    aput-object v1, v0, v12

    const-string v1, "HK"

    const-string v12, "HKD"

    .line 104
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x60

    aput-object v1, v0, v12

    const-string v1, "HU"

    const-string v12, "HUF"

    .line 105
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x61

    aput-object v1, v0, v12

    const-string v1, "IS"

    const-string v12, "ISK"

    .line 106
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x62

    aput-object v1, v0, v12

    const-string v1, "IN"

    .line 107
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x63

    aput-object v1, v0, v7

    const-string v1, "ID"

    const-string v7, "IDR"

    .line 108
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x64

    aput-object v1, v0, v7

    const-string v1, "IR"

    const-string v7, "IRR"

    .line 109
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x65

    aput-object v1, v0, v7

    const-string v1, "IQ"

    const-string v7, "IQD"

    .line 110
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x66

    aput-object v1, v0, v7

    const-string v1, "IE"

    .line 111
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x67

    aput-object v1, v0, v7

    const-string v1, "IM"

    .line 112
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x68

    aput-object v1, v0, v7

    const-string v1, "IL"

    const-string v7, "ILS"

    .line 113
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x69

    aput-object v1, v0, v7

    const-string v1, "IT"

    .line 114
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x6a

    aput-object v1, v0, v7

    const-string v1, "JM"

    const-string v7, "JMD"

    .line 115
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x6b

    aput-object v1, v0, v7

    const-string v1, "JP"

    const-string v7, "JPY"

    .line 116
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x6c

    aput-object v1, v0, v7

    const-string v1, "JE"

    .line 117
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x6d

    aput-object v1, v0, v7

    const-string v1, "JO"

    const-string v7, "JOD"

    .line 118
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x6e

    aput-object v1, v0, v7

    const-string v1, "KZ"

    const-string v7, "KZT"

    .line 119
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x6f

    aput-object v1, v0, v7

    const-string v1, "KE"

    const-string v7, "KES"

    .line 120
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x70

    aput-object v1, v0, v7

    const-string v1, "KI"

    .line 121
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x71

    aput-object v1, v0, v7

    const-string v1, "KP"

    const-string v7, "KPW"

    .line 122
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x72

    aput-object v1, v0, v7

    const-string v1, "KR"

    const-string v7, "KRW"

    .line 123
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x73

    aput-object v1, v0, v7

    const-string v1, "KW"

    const-string v7, "KWD"

    .line 124
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x74

    aput-object v1, v0, v7

    const-string v1, "KG"

    const-string v7, "KGS"

    .line 125
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x75

    aput-object v1, v0, v7

    const-string v1, "LA"

    const-string v7, "LAK"

    .line 126
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x76

    aput-object v1, v0, v7

    const-string v1, "LV"

    .line 127
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x77

    aput-object v1, v0, v7

    const-string v1, "LB"

    const-string v7, "LBP"

    .line 128
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v7, 0x78

    aput-object v1, v0, v7

    const-string v1, "LS"

    const-string v7, "ZAR"

    .line 129
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x79

    aput-object v1, v0, v12

    const-string v1, "LR"

    const-string v12, "LRD"

    .line 130
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x7a

    aput-object v1, v0, v12

    const-string v1, "LY"

    const-string v12, "LYD"

    .line 131
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v12, 0x7b

    aput-object v1, v0, v12

    const-string v1, "LI"

    const-string v12, "CHF"

    .line 132
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x7c

    aput-object v1, v0, v14

    const-string v1, "LT"

    .line 133
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x7d

    aput-object v1, v0, v14

    const-string v1, "LU"

    .line 134
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x7e

    aput-object v1, v0, v14

    const-string v1, "MO"

    const-string v14, "MOP"

    .line 135
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x7f

    aput-object v1, v0, v14

    const-string v1, "MK"

    const-string v14, "MKD"

    .line 136
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x80

    aput-object v1, v0, v14

    const-string v1, "MG"

    const-string v14, "MGA"

    .line 137
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x81

    aput-object v1, v0, v14

    const-string v1, "MW"

    const-string v14, "MWK"

    .line 138
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x82

    aput-object v1, v0, v14

    const-string v1, "MY"

    const-string v14, "MYR"

    .line 139
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x83

    aput-object v1, v0, v14

    const-string v1, "MV"

    const-string v14, "MVR"

    .line 140
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x84

    aput-object v1, v0, v14

    const-string v1, "ML"

    .line 141
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x85

    aput-object v1, v0, v14

    const-string v1, "MT"

    .line 142
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x86

    aput-object v1, v0, v14

    const-string v1, "MH"

    .line 143
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x87

    aput-object v1, v0, v14

    const-string v1, "MQ"

    .line 144
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x88

    aput-object v1, v0, v14

    const-string v1, "MR"

    const-string v14, "MRO"

    .line 145
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x89

    aput-object v1, v0, v14

    const-string v1, "MU"

    const-string v14, "MUR"

    .line 146
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x8a

    aput-object v1, v0, v14

    const-string v1, "YT"

    .line 147
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x8b

    aput-object v1, v0, v14

    const-string v1, "MX"

    const-string v14, "MXN"

    .line 148
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x8c

    aput-object v1, v0, v14

    const-string v1, "FM"

    .line 149
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x8d

    aput-object v1, v0, v14

    const-string v1, "MD"

    const-string v14, "MDL"

    .line 150
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x8e

    aput-object v1, v0, v14

    const-string v1, "MC"

    .line 151
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x8f

    aput-object v1, v0, v14

    const-string v1, "MN"

    const-string v14, "MNT"

    .line 152
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x90

    aput-object v1, v0, v14

    const-string v1, "ME"

    .line 153
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x91

    aput-object v1, v0, v14

    const-string v1, "MS"

    .line 154
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v14, 0x92

    aput-object v1, v0, v14

    const-string v1, "MA"

    const-string v14, "MAD"

    .line 155
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x93

    aput-object v1, v0, v15

    const-string v1, "MZ"

    const-string v15, "MZN"

    .line 156
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x94

    aput-object v1, v0, v15

    const-string v1, "MM"

    const-string v15, "MMK"

    .line 157
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x95

    aput-object v1, v0, v15

    const-string v1, "NA"

    .line 158
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x96

    aput-object v1, v0, v15

    const-string v1, "NR"

    .line 159
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x97

    aput-object v1, v0, v15

    const-string v1, "NP"

    const-string v15, "NPR"

    .line 160
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x98

    aput-object v1, v0, v15

    const-string v1, "NL"

    .line 161
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x99

    aput-object v1, v0, v15

    const-string v1, "NC"

    .line 162
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x9a

    aput-object v1, v0, v15

    const-string v1, "NZ"

    .line 163
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x9b

    aput-object v1, v0, v15

    const-string v1, "NI"

    const-string v15, "NIO"

    .line 164
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x9c

    aput-object v1, v0, v15

    const-string v1, "NE"

    .line 165
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x9d

    aput-object v1, v0, v15

    const-string v1, "NG"

    const-string v15, "NGN"

    .line 166
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x9e

    aput-object v1, v0, v15

    const-string v1, "NU"

    .line 167
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0x9f

    aput-object v1, v0, v15

    const-string v1, "NF"

    .line 168
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa0

    aput-object v1, v0, v15

    const-string v1, "MP"

    .line 169
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa1

    aput-object v1, v0, v15

    const-string v1, "NO"

    .line 170
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa2

    aput-object v1, v0, v15

    const-string v1, "OM"

    const-string v15, "OMR"

    .line 171
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa3

    aput-object v1, v0, v15

    const-string v1, "PK"

    const-string v15, "PKR"

    .line 172
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa4

    aput-object v1, v0, v15

    const-string v1, "PW"

    .line 173
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa5

    aput-object v1, v0, v15

    const-string v1, "PA"

    .line 174
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa6

    aput-object v1, v0, v15

    const-string v1, "PG"

    const-string v15, "PGK"

    .line 175
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa7

    aput-object v1, v0, v15

    const-string v1, "PY"

    const-string v15, "PYG"

    .line 176
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa8

    aput-object v1, v0, v15

    const-string v1, "PE"

    const-string v15, "PEN"

    .line 177
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xa9

    aput-object v1, v0, v15

    const-string v1, "PH"

    const-string v15, "PHP"

    .line 178
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xaa

    aput-object v1, v0, v15

    const-string v1, "PN"

    .line 179
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xab

    aput-object v1, v0, v15

    const-string v1, "PL"

    const-string v15, "PLN"

    .line 180
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xac

    aput-object v1, v0, v15

    const-string v1, "PT"

    .line 181
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xad

    aput-object v1, v0, v15

    const-string v1, "PR"

    .line 182
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xae

    aput-object v1, v0, v15

    const-string v1, "QA"

    const-string v15, "QAR"

    .line 183
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xaf

    aput-object v1, v0, v15

    const-string v1, "RO"

    const-string v15, "RON"

    .line 184
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb0

    aput-object v1, v0, v15

    const-string v1, "RU"

    const-string v15, "RUB"

    .line 185
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb1

    aput-object v1, v0, v15

    const-string v1, "RW"

    const-string v15, "RWF"

    .line 186
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb2

    aput-object v1, v0, v15

    const-string v1, "RE"

    .line 187
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb3

    aput-object v1, v0, v15

    const-string v1, "BL"

    .line 188
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb4

    aput-object v1, v0, v15

    const-string v1, "SH"

    const-string v15, "SHP"

    .line 189
    invoke-static {v1, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb5

    aput-object v1, v0, v15

    const-string v1, "KN"

    .line 190
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb6

    aput-object v1, v0, v15

    const-string v1, "LC"

    .line 191
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb7

    aput-object v1, v0, v15

    const-string v1, "MF"

    .line 192
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb8

    aput-object v1, v0, v15

    const-string v1, "PM"

    .line 193
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v15, 0xb9

    aput-object v1, v0, v15

    const-string v1, "VC"

    .line 194
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xba

    aput-object v1, v0, v4

    const-string v1, "WS"

    const-string v4, "WST"

    .line 195
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xbb

    aput-object v1, v0, v4

    const-string v1, "SM"

    .line 196
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xbc

    aput-object v1, v0, v4

    const-string v1, "ST"

    const-string v4, "STD"

    .line 197
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xbd

    aput-object v1, v0, v4

    const-string v1, "SA"

    const-string v4, "SAR"

    .line 198
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xbe

    aput-object v1, v0, v4

    const-string v1, "SN"

    .line 199
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xbf

    aput-object v1, v0, v4

    const-string v1, "RS"

    const-string v4, "RSD"

    .line 200
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc0

    aput-object v1, v0, v4

    const-string v1, "SC"

    const-string v4, "SCR"

    .line 201
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc1

    aput-object v1, v0, v4

    const-string v1, "SL"

    const-string v4, "SLL"

    .line 202
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc2

    aput-object v1, v0, v4

    const-string v1, "SG"

    const-string v4, "SGD"

    .line 203
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc3

    aput-object v1, v0, v4

    const-string v1, "SX"

    .line 204
    invoke-static {v1, v11}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc4

    aput-object v1, v0, v4

    const-string v1, "SK"

    .line 205
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc5

    aput-object v1, v0, v4

    const-string v1, "SI"

    .line 206
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc6

    aput-object v1, v0, v4

    const-string v1, "SB"

    const-string v4, "SBD"

    .line 207
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc7

    aput-object v1, v0, v4

    const-string v1, "SO"

    const-string v4, "SOS"

    .line 208
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc8

    aput-object v1, v0, v4

    const-string v1, "ZA"

    .line 209
    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xc9

    aput-object v1, v0, v4

    const-string v1, "SS"

    const-string v4, "SSP"

    .line 210
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xca

    aput-object v1, v0, v4

    const-string v1, "ES"

    .line 211
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xcb

    aput-object v1, v0, v4

    const-string v1, "LK"

    const-string v4, "LKR"

    .line 212
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xcc

    aput-object v1, v0, v4

    const-string v1, "SD"

    const-string v4, "SDG"

    .line 213
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xcd

    aput-object v1, v0, v4

    const-string v1, "SR"

    const-string v4, "SRD"

    .line 214
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xce

    aput-object v1, v0, v4

    const-string v1, "SJ"

    .line 215
    invoke-static {v1, v8}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xcf

    aput-object v1, v0, v4

    const-string v1, "SZ"

    const-string v4, "SZL"

    .line 216
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd0

    aput-object v1, v0, v4

    const-string v1, "SE"

    const-string v4, "SEK"

    .line 217
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd1

    aput-object v1, v0, v4

    const-string v1, "CH"

    .line 218
    invoke-static {v1, v12}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd2

    aput-object v1, v0, v4

    const-string v1, "SY"

    const-string v4, "SYP"

    .line 219
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd3

    aput-object v1, v0, v4

    const-string v1, "TW"

    const-string v4, "TWD"

    .line 220
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd4

    aput-object v1, v0, v4

    const-string v1, "TJ"

    const-string v4, "TJS"

    .line 221
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd5

    aput-object v1, v0, v4

    const-string v1, "TZ"

    const-string v4, "TZS"

    .line 222
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd6

    aput-object v1, v0, v4

    const-string v1, "TH"

    const-string v4, "THB"

    .line 223
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd7

    aput-object v1, v0, v4

    const-string v1, "TL"

    .line 224
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd8

    aput-object v1, v0, v4

    const-string v1, "TG"

    .line 225
    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xd9

    aput-object v1, v0, v4

    const-string v1, "TK"

    .line 226
    invoke-static {v1, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xda

    aput-object v1, v0, v4

    const-string v1, "TO"

    const-string v4, "TOP"

    .line 227
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xdb

    aput-object v1, v0, v4

    const-string v1, "TT"

    const-string v4, "TTD"

    .line 228
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xdc

    aput-object v1, v0, v4

    const-string v1, "TN"

    const-string v4, "TND"

    .line 229
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xdd

    aput-object v1, v0, v4

    const-string v1, "TR"

    const-string v4, "TRY"

    .line 230
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xde

    aput-object v1, v0, v4

    const-string v1, "TM"

    const-string v4, "TMT"

    .line 231
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xdf

    aput-object v1, v0, v4

    const-string v1, "TC"

    .line 232
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe0

    aput-object v1, v0, v4

    const-string v1, "TV"

    .line 233
    invoke-static {v1, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe1

    aput-object v1, v0, v4

    const-string v1, "UG"

    const-string v4, "UGX"

    .line 234
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe2

    aput-object v1, v0, v4

    const-string v1, "UA"

    const-string v4, "UAH"

    .line 235
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe3

    aput-object v1, v0, v4

    const-string v1, "AE"

    const-string v4, "AED"

    .line 236
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe4

    aput-object v1, v0, v4

    const-string v1, "GB"

    .line 237
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe5

    aput-object v1, v0, v4

    const-string v1, "US"

    .line 238
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe6

    aput-object v1, v0, v4

    const-string v1, "UM"

    .line 239
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe7

    aput-object v1, v0, v4

    const-string v1, "UY"

    const-string v4, "UYU"

    .line 240
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe8

    aput-object v1, v0, v4

    const-string v1, "UZ"

    const-string v4, "UZS"

    .line 241
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xe9

    aput-object v1, v0, v4

    const-string v1, "VU"

    const-string v4, "VUV"

    .line 242
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xea

    aput-object v1, v0, v4

    const-string v1, "VE"

    const-string v4, "VEF"

    .line 243
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xeb

    aput-object v1, v0, v4

    const-string v1, "VN"

    const-string v4, "VND"

    .line 244
    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xec

    aput-object v1, v0, v4

    const-string v1, "VG"

    .line 245
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v4, 0xed

    aput-object v1, v0, v4

    const-string v1, "VI"

    .line 246
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xee

    aput-object v1, v0, v2

    const-string v1, "WF"

    .line 247
    invoke-static {v1, v13}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xef

    aput-object v1, v0, v2

    const-string v1, "EH"

    .line 248
    invoke-static {v1, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xf0

    aput-object v1, v0, v2

    const-string v1, "YE"

    const-string v2, "YER"

    .line 249
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xf1

    aput-object v1, v0, v2

    const-string v1, "ZM"

    const-string v2, "ZMW"

    .line 250
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xf2

    aput-object v1, v0, v2

    const-string v1, "ZW"

    const-string v2, "ZWL"

    .line 251
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xf3

    aput-object v1, v0, v2

    const-string v1, "AX"

    .line 252
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0xf4

    aput-object v1, v0, v2

    .line 7
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;->conversions:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final convertOrEmpty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "iso3166Alpha2Code"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lcom/revenuecat/purchases/amazon/ISO3166Alpha2ToISO42170Converter;->conversions:Ljava/util/Map;

    .line 5
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method
