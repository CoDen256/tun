.class public final Lexpo/modules/kotlin/types/ColorTypeConverterKt;
.super Ljava/lang/Object;
.source "ColorTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nColorTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ColorTypeConverter.kt\nexpo/modules/kotlin/types/ColorTypeConverterKt\n+ 2 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,237:1\n453#2:238\n403#2:239\n1238#3,2:240\n1241#3:246\n11065#4:242\n11400#4,3:243\n*S KotlinDebug\n*F\n+ 1 ColorTypeConverter.kt\nexpo/modules/kotlin/types/ColorTypeConverterKt\n*L\n167#1:238\n167#1:239\n167#1:240,2\n167#1:246\n168#1:242\n168#1:243,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010 \n\u0002\u0010\u0007\n\u0000\" \u0010\u0000\u001a\u0014\u0012\u0004\u0012\u00020\u0002\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00040\u00030\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0005"
    }
    d2 = {
        "namedColors",
        "",
        "",
        "",
        "",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final namedColors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 23

    const/16 v0, 0x95

    new-array v0, v0, [Lkotlin/Pair;

    const/4 v1, 0x4

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xf0

    .line 18
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    .line 20
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v3, v2, v4

    const/16 v6, 0xf8

    .line 18
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v2, v7

    const/16 v6, 0xff

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v8, 0x2

    aput-object v6, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v10, "aliceblue"

    invoke-static {v10, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v4

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v10, 0xfa

    .line 19
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v2, v4

    const/16 v11, 0xeb

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0xd7

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "antiquewhite"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v7

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v6, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v11, "aqua"

    .line 20
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v8

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0x7f

    .line 21
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v2, v4

    aput-object v6, v2, v7

    const/16 v12, 0xd4

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v2, v8

    aput-object v6, v2, v9

    const-string v12, "aquamarine"

    invoke-static {v12, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v3, v2, v4

    aput-object v6, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v12, "azure"

    .line 22
    invoke-static {v12, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    aput-object v2, v0, v1

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v12, 0xf5

    .line 23
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v2, v4

    aput-object v12, v2, v7

    const/16 v13, 0xdc

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v2, v8

    aput-object v6, v2, v9

    const-string v14, "beige"

    invoke-static {v14, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v14, 0x5

    aput-object v2, v0, v14

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v14, 0xe4

    .line 24
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v2, v7

    const/16 v14, 0xc4

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v2, v8

    aput-object v6, v2, v9

    const-string v14, "bisque"

    invoke-static {v14, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v14, 0x6

    aput-object v2, v0, v14

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v5, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v14, "black"

    .line 25
    invoke-static {v14, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v14, 0x7

    aput-object v2, v0, v14

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v14, 0xeb

    .line 26
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v2, v7

    const/16 v14, 0xcd

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v2, v8

    aput-object v6, v2, v9

    const-string v15, "blanchedalmond"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x8

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v5, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v15, "blue"

    .line 27
    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x9

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x8a

    .line 28
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x2b

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0xe2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "blueviolet"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0xa

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xa5

    .line 29
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x2a

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x2a

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "brown"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0xb

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xde

    .line 30
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0xb8

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x87

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "burlywood"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0xc

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x5f

    .line 31
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x9e

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0xa0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "cadetblue"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0xd

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    .line 32
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    aput-object v6, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v15, "chartreuse"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0xe

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xd2

    .line 33
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x69

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v2, v7

    const/16 v17, 0x1e

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v2, v8

    aput-object v6, v2, v9

    const-string v15, "chocolate"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0xf

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    .line 34
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x50

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "coral"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x10

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x64

    .line 35
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x95

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0xed

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "cornflowerblue"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x11

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v15, 0xf8

    .line 36
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v9

    const-string v15, "cornsilk"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x12

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v13, v2, v4

    const/16 v15, 0x14

    .line 37
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x3c

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "crimson"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x13

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v6, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v15, "cyan"

    .line 38
    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x14

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v5, v2, v7

    const/16 v15, 0x8b

    .line 39
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkblue"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x15

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v18, v2, v7

    aput-object v18, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkcyan"

    .line 40
    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x16

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xb8

    .line 41
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x86

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0xb

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkgoldenrod"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x17

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xa9

    .line 42
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    aput-object v15, v2, v7

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v11, "darkgray"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x18

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    const/16 v11, 0x64

    .line 43
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v11, "darkgreen"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x19

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v15, v2, v4

    aput-object v15, v2, v7

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v11, "darkgrey"

    .line 44
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x1a

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0xbd

    .line 45
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    const/16 v11, 0xb7

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0x6b

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "darkkhaki"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x1b

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v18, v2, v4

    aput-object v5, v2, v7

    aput-object v18, v2, v8

    aput-object v6, v2, v9

    const-string v11, "darkmagenta"

    .line 46
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x1c

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0x55

    .line 47
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    const/16 v11, 0x6b

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0x2f

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkolivegreen"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x1d

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v15, 0x8c

    .line 48
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkorange"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x1e

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x99

    .line 49
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x32

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0xcc

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkorchid"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x1f

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v18, v2, v4

    aput-object v5, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkred"

    .line 50
    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x20

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xe9

    .line 51
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x96

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x7a

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darksalmon"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x21

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x8f

    .line 52
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0xbc

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x8f

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkseagreen"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x22

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x48

    .line 53
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x3d

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    aput-object v18, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkslateblue"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x23

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    .line 54
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x4f

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x4f

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkslategray"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x24

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    .line 55
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x4f

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x4f

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkslategrey"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x25

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    const/16 v15, 0xce

    .line 56
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0xd1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v15, "darkturquoise"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x26

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x94

    .line 57
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    aput-object v5, v2, v7

    const/16 v15, 0xd3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v9

    const-string v11, "darkviolet"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x27

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v11, 0x14

    .line 58
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0x93

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "deeppink"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x28

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    const/16 v11, 0xbf

    .line 59
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v11, "deepskyblue"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x29

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v16, v2, v4

    aput-object v16, v2, v7

    aput-object v16, v2, v8

    aput-object v6, v2, v9

    const-string v11, "dimgray"

    .line 60
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x2a

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v16, v2, v4

    aput-object v16, v2, v7

    aput-object v16, v2, v8

    aput-object v6, v2, v9

    const-string v11, "dimgrey"

    .line 61
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x2b

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0x1e

    .line 62
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    const/16 v11, 0x90

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v11, "dodgerblue"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x2c

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0xb2

    .line 63
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    const/16 v11, 0x22

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0x22

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "firebrick"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x2d

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v10, v2, v7

    aput-object v3, v2, v8

    aput-object v6, v2, v9

    const-string v11, "floralwhite"

    .line 64
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x2e

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0x22

    .line 65
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    aput-object v18, v2, v7

    const/16 v11, 0x22

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "forestgreen"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x2f

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v5, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v11, "fuchsia"

    .line 66
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x30

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v13, v2, v4

    aput-object v13, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v9

    const-string v11, "gainsboro"

    .line 67
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x31

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0xf8

    .line 68
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    const/16 v11, 0xf8

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v9

    const-string v11, "ghostwhite"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x32

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v11, 0xd7

    .line 69
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v11, "gold"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x33

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0xda

    .line 70
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    const/16 v11, 0xa5

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0x20

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "goldenrod"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x34

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0x80

    .line 71
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v2, v4

    aput-object v13, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v9

    const-string v11, "gray"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x35

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v13, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v9

    const-string v11, "green"

    .line 72
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x36

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0xad

    .line 73
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    aput-object v6, v2, v7

    const/16 v11, 0x2f

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "greenyellow"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x37

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v13, v2, v4

    aput-object v13, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v9

    const-string v11, "grey"

    .line 74
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x38

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v3, v2, v4

    aput-object v6, v2, v7

    aput-object v3, v2, v8

    aput-object v6, v2, v9

    const-string v11, "honeydew"

    .line 75
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x39

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v16, v2, v7

    const/16 v11, 0xb4

    .line 76
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "hotpink"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x3a

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v14, v2, v4

    const/16 v11, 0x5c

    .line 77
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v11, 0x5c

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "indianred"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x3b

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v11, 0x4b

    .line 78
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v4

    aput-object v5, v2, v7

    const/16 v11, 0x82

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v9

    const-string v11, "indigo"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x3c

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v6, v2, v7

    aput-object v3, v2, v8

    aput-object v6, v2, v9

    const-string v11, "ivory"

    .line 79
    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x3d

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v3, v2, v4

    const/16 v11, 0xe6

    .line 80
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v7

    const/16 v19, 0x8c

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v2, v8

    aput-object v6, v2, v9

    const-string v9, "khaki"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x3e

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v11, v2, v4

    aput-object v11, v2, v7

    aput-object v10, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lavender"

    .line 81
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x3f

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v3, v2, v7

    aput-object v12, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lavenderblush"

    .line 82
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x40

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x7c

    .line 83
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0xfc

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    aput-object v5, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lawngreen"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x41

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v10, v2, v7

    aput-object v14, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lemonchiffon"

    .line 84
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x42

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0xad

    .line 85
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0xd8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    aput-object v11, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightblue"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x43

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v3, v2, v4

    aput-object v13, v2, v7

    aput-object v13, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightcoral"

    .line 86
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x44

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0xe0

    .line 87
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    aput-object v6, v2, v7

    aput-object v6, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightcyan"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x45

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v10, v2, v4

    aput-object v10, v2, v7

    const/16 v9, 0xd2

    .line 88
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightgoldenrodyellow"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x46

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v15, v2, v4

    aput-object v15, v2, v7

    aput-object v15, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightgray"

    .line 89
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x47

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x90

    .line 90
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v2, v4

    const/16 v20, 0xee

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v2, v7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightgreen"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x48

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v15, v2, v4

    aput-object v15, v2, v7

    aput-object v15, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightgrey"

    .line 91
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x49

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v9, 0xb6

    .line 92
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v9, 0xc1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightpink"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x4a

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v9, 0xa0

    .line 93
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v9, 0x7a

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightsalmon"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x4b

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x20

    .line 94
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0xb2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v9, 0xaa

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightseagreen"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x4c

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x87

    .line 95
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0xce

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    aput-object v10, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightskyblue"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x4d

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x77

    .line 96
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0x88

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v9, 0x99

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightslategray"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x4e

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x77

    .line 97
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0x88

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v9, 0x99

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightslategrey"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x4f

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0xb0

    .line 98
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    const/16 v9, 0xc4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v9, 0xde

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightsteelblue"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x50

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v6, v2, v7

    const/16 v9, 0xe0

    .line 99
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lightyellow"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x51

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v6, v2, v7

    aput-object v5, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "lime"

    .line 100
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x52

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v9, 0x32

    .line 101
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v4

    aput-object v14, v2, v7

    const/16 v9, 0x32

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    const/4 v9, 0x3

    aput-object v6, v2, v9

    const-string v9, "limegreen"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x53

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v10, v2, v4

    aput-object v3, v2, v7

    aput-object v11, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v9, "linen"

    .line 102
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x54

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v5, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v3

    const-string v9, "magenta"

    .line 103
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x55

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v13, v2, v4

    aput-object v5, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v3

    const-string v3, "maroon"

    .line 104
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x56

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x66

    .line 105
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    aput-object v14, v2, v7

    const/16 v3, 0xaa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v9, "mediumaquamarine"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x57

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v5, v2, v7

    aput-object v14, v2, v8

    aput-object v6, v2, v3

    const-string v3, "mediumblue"

    .line 106
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x58

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xba

    .line 107
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x55

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    aput-object v15, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "mediumorchid"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x59

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x93

    .line 108
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x70

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    const/16 v15, 0xdb

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    const/4 v15, 0x3

    aput-object v6, v2, v15

    const-string v15, "mediumpurple"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x5a

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x3c

    .line 109
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0xb3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    const/16 v15, 0x71

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    const/4 v15, 0x3

    aput-object v6, v2, v15

    const-string v15, "mediumseagreen"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x5b

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0x7b

    .line 110
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    const/16 v15, 0x68

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    aput-object v21, v2, v8

    const/4 v15, 0x3

    aput-object v6, v2, v15

    const-string v3, "mediumslateblue"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x5c

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v10, v2, v7

    const/16 v3, 0x9a

    .line 111
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    aput-object v6, v2, v15

    const-string v3, "mediumspringgreen"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x5d

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x48

    .line 112
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xd1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xcc

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "mediumturquoise"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x5e

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xc7

    .line 113
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x15

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x85

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "mediumvioletred"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x5f

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x19

    .line 114
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x19

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    aput-object v9, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v15, "midnightblue"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x60

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v12, v2, v4

    aput-object v6, v2, v7

    aput-object v10, v2, v8

    aput-object v6, v2, v3

    const-string v3, "mintcream"

    .line 115
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x61

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0xe4

    .line 116
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xe1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "mistyrose"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x62

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0xe4

    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xb5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "moccasin"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x63

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0xde

    .line 118
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xad

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v15, "navajowhite"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x64

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v5, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v3

    const-string v15, "navy"

    .line 119
    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x65

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xfd

    .line 120
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    aput-object v12, v2, v7

    aput-object v11, v2, v8

    aput-object v6, v2, v3

    const-string v15, "oldlace"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x66

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v13, v2, v4

    aput-object v13, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v3

    const-string v3, "olive"

    .line 121
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x67

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x6b

    .line 122
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x8e

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x23

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v15, "olivedrab"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x68

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v15, 0xa5

    .line 123
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v3

    const-string v15, "orange"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x69

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v15, 0x45

    .line 124
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v3

    const-string v3, "orangered"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x6a

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xda

    .line 125
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    aput-object v9, v2, v7

    const/16 v3, 0xd6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "orchid"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x6b

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v21, v2, v4

    const/16 v3, 0xe8

    .line 126
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xaa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "palegoldenrod"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x6c

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x98

    .line 127
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xfb

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x98

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v15, "palegreen"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x6d

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v15, 0xaf

    .line 128
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v4

    aput-object v21, v2, v7

    aput-object v21, v2, v8

    aput-object v6, v2, v3

    const-string v3, "paleturquoise"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x6e

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xdb

    .line 129
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    aput-object v9, v2, v7

    const/16 v3, 0x93

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "palevioletred"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x6f

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0xef

    .line 130
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xd5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "papayawhip"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x70

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0xda

    .line 131
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xb9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "peachpuff"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x71

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v14, v2, v4

    const/16 v3, 0x85

    .line 132
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x3f

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "peru"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x72

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0xc0

    .line 133
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xcb

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "pink"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x73

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xdd

    .line 134
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xa0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xdd

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "plum"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x74

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xb0

    .line 135
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xe0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    aput-object v11, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v11, "powderblue"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x75

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v13, v2, v4

    aput-object v5, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v3

    const-string v3, "purple"

    .line 136
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x76

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x66

    .line 137
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x33

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x99

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v11, "rebeccapurple"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x77

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v5, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v3

    const-string v3, "red"

    .line 138
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x78

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xbc

    .line 139
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x8f

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x8f

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "rosybrown"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x79

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x41

    .line 140
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    aput-object v16, v2, v7

    const/16 v3, 0xe1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "royalblue"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x7a

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v18, v2, v4

    const/16 v3, 0x45

    .line 141
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x13

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v11, "saddlebrown"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x7b

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v10, v2, v4

    aput-object v13, v2, v7

    const/16 v11, 0x72

    .line 142
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v2, v8

    aput-object v6, v2, v3

    const-string v3, "salmon"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x7c

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xf4

    .line 143
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xa4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x60

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "sandybrown"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x7d

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x2e

    .line 144
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    aput-object v18, v2, v7

    const/16 v3, 0x57

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v11, "seagreen"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x7e

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v12, v2, v7

    aput-object v21, v2, v8

    aput-object v6, v2, v3

    const-string v3, "seashell"

    .line 145
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x7f

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xa0

    .line 146
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x52

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x2d

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "sienna"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x80

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xc0

    .line 147
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xc0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xc0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "silver"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x81

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x87

    .line 148
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xce

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xeb

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "skyblue"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x82

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x6a

    .line 149
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x5a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    aput-object v14, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v11, "slateblue"

    invoke-static {v11, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v11, 0x83

    aput-object v2, v0, v11

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v9, v2, v4

    aput-object v13, v2, v7

    const/16 v11, 0x90

    .line 150
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v2, v8

    aput-object v6, v2, v3

    const-string v15, "slategray"

    invoke-static {v15, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v15, 0x84

    aput-object v2, v0, v15

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v9, v2, v4

    aput-object v13, v2, v7

    .line 151
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    aput-object v6, v2, v3

    const-string v9, "slategrey"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x85

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v10, v2, v7

    aput-object v10, v2, v8

    aput-object v6, v2, v3

    const-string v9, "snow"

    .line 152
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x86

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v6, v2, v7

    const/16 v9, 0x7f

    .line 153
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v8

    aput-object v6, v2, v3

    const-string v3, "springgreen"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x87

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x46

    .line 154
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0x82

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xb4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "steelblue"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x88

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xd2

    .line 155
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xb4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x8c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v9, "tan"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x89

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v13, v2, v7

    aput-object v13, v2, v8

    aput-object v6, v2, v3

    const-string v3, "teal"

    .line 156
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x8a

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0xd8

    .line 157
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xbf

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xd8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v3, "thistle"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x8b

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    const/16 v3, 0x63

    .line 158
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0x47

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v9, "tomato"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x8c

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v5, v2, v4

    aput-object v5, v2, v7

    aput-object v5, v2, v8

    aput-object v5, v2, v3

    const-string v3, "transparent"

    .line 159
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x8d

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    const/16 v3, 0x40

    .line 160
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    const/16 v3, 0xe0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xd0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v9, "turquoise"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x8e

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v21, v2, v4

    const/16 v9, 0x82

    .line 161
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v7

    aput-object v21, v2, v8

    aput-object v6, v2, v3

    const-string v3, "violet"

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x8f

    aput-object v2, v0, v3

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v12, v2, v4

    const/16 v3, 0xde

    .line 162
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    const/16 v3, 0xb3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const-string v9, "wheat"

    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x90

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v6, v2, v7

    aput-object v6, v2, v8

    aput-object v6, v2, v3

    const-string v9, "white"

    .line 163
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x91

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v12, v2, v4

    aput-object v12, v2, v7

    aput-object v12, v2, v8

    aput-object v6, v2, v3

    const-string v9, "whitesmoke"

    .line 164
    invoke-static {v9, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v9, 0x92

    aput-object v2, v0, v9

    new-array v2, v1, [Ljava/lang/Integer;

    aput-object v6, v2, v4

    aput-object v6, v2, v7

    aput-object v5, v2, v8

    aput-object v6, v2, v3

    const-string v3, "yellow"

    .line 165
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/16 v3, 0x93

    aput-object v2, v0, v3

    new-array v1, v1, [Ljava/lang/Integer;

    const/16 v2, 0x9a

    .line 166
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    aput-object v14, v1, v7

    const/16 v2, 0x32

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v8

    const/4 v2, 0x3

    aput-object v6, v1, v2

    const-string v2, "yellowgreen"

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/16 v2, 0x94

    aput-object v1, v0, v2

    .line 17
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    .line 238
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {v2}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    check-cast v1, Ljava/util/Map;

    .line 239
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 240
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 241
    check-cast v2, Ljava/util/Map$Entry;

    .line 239
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 167
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Integer;

    .line 242
    new-instance v5, Ljava/util/ArrayList;

    array-length v6, v2

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v5, Ljava/util/Collection;

    .line 243
    array-length v6, v2

    move v7, v4

    :goto_1
    if-ge v7, v6, :cond_0

    aget-object v8, v2, v7

    .line 244
    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x437f0000    # 255.0f

    div-float/2addr v8, v9

    .line 168
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    .line 244
    invoke-interface {v5, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 245
    :cond_0
    check-cast v5, Ljava/util/List;

    .line 241
    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    sput-object v1, Lexpo/modules/kotlin/types/ColorTypeConverterKt;->namedColors:Ljava/util/Map;

    return-void
.end method

.method public static final synthetic access$getNamedColors$p()Ljava/util/Map;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/types/ColorTypeConverterKt;->namedColors:Ljava/util/Map;

    return-object v0
.end method
