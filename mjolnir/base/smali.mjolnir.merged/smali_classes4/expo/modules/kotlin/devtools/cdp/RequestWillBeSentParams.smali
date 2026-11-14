.class public final Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;
.super Ljava/lang/Object;
.source "CdpNetworkTypes.kt"

# interfaces
.implements Lexpo/modules/kotlin/devtools/cdp/JsonSerializable;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCdpNetworkTypes.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CdpNetworkTypes.kt\nexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,269:1\n1#2:270\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008!\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u00002\u00020\u0001B-\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0010\u0004\u001a\u00060\u0005j\u0002`\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\n\u00a2\u0006\u0002\u0010\u000bB\u007f\u0012\n\u0010\u0004\u001a\u00060\u0005j\u0002`\u0006\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\r\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u000e\u0012\n\u0010\u000f\u001a\u00060\u0003j\u0002`\u0010\u0012\n\u0010\u0011\u001a\u00060\u0003j\u0002`\u0012\u0012\u0014\u0008\u0002\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050\u0014\u0012\u0006\u0010\u0015\u001a\u00020\u0016\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0017\u0012\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u0005\u0012\u0006\u0010\u0019\u001a\u00020\u001a\u00a2\u0006\u0002\u0010\u001bJ\r\u0010.\u001a\u00060\u0005j\u0002`\u0006H\u00c6\u0003J\t\u0010/\u001a\u00020\u0005H\u00c6\u0003J\t\u00100\u001a\u00020\u001aH\u00c6\u0003J\t\u00101\u001a\u00020\u0005H\u00c6\u0003J\t\u00102\u001a\u00020\u0005H\u00c6\u0003J\t\u00103\u001a\u00020\u000eH\u00c6\u0003J\r\u00104\u001a\u00060\u0003j\u0002`\u0010H\u00c6\u0003J\r\u00105\u001a\u00060\u0003j\u0002`\u0012H\u00c6\u0003J\u0015\u00106\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050\u0014H\u00c6\u0003J\t\u00107\u001a\u00020\u0016H\u00c6\u0003J\u000b\u00108\u001a\u0004\u0018\u00010\u0017H\u00c6\u0003J\u0091\u0001\u00109\u001a\u00020\u00002\u000c\u0008\u0002\u0010\u0004\u001a\u00060\u0005j\u0002`\u00062\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u00052\u0008\u0008\u0002\u0010\r\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u000e2\u000c\u0008\u0002\u0010\u000f\u001a\u00060\u0003j\u0002`\u00102\u000c\u0008\u0002\u0010\u0011\u001a\u00060\u0003j\u0002`\u00122\u0014\u0008\u0002\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050\u00142\u0008\u0008\u0002\u0010\u0015\u001a\u00020\u00162\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u00172\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u001aH\u00c6\u0001J\u0013\u0010:\u001a\u00020\u00162\u0008\u0010;\u001a\u0004\u0018\u00010<H\u00d6\u0003J\t\u0010=\u001a\u00020>H\u00d6\u0001J\u0008\u0010?\u001a\u00020@H\u0016J\t\u0010A\u001a\u00020\u0005H\u00d6\u0001R\u0011\u0010\r\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u001d\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050\u0014\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u001fR\u0011\u0010\u000c\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010\u001dR\u0011\u0010\u0015\u001a\u00020\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\"R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0017\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010$R\u0011\u0010\u0018\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010\u001dR\u0011\u0010\u0007\u001a\u00020\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008&\u0010\'R\u0015\u0010\u0004\u001a\u00060\u0005j\u0002`\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008(\u0010\u001dR\u0015\u0010\u000f\u001a\u00060\u0003j\u0002`\u0010\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008)\u0010*R\u0011\u0010\u0019\u001a\u00020\u001a\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010,R\u0015\u0010\u0011\u001a\u00060\u0003j\u0002`\u0012\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008-\u0010*\u00a8\u0006B"
    }
    d2 = {
        "Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;",
        "Lexpo/modules/kotlin/devtools/cdp/JsonSerializable;",
        "now",
        "Ljava/math/BigDecimal;",
        "requestId",
        "",
        "Lexpo/modules/kotlin/devtools/cdp/RequestId;",
        "request",
        "Lokhttp3/Request;",
        "redirectResponse",
        "Lokhttp3/Response;",
        "(Ljava/math/BigDecimal;Ljava/lang/String;Lokhttp3/Request;Lokhttp3/Response;)V",
        "loaderId",
        "documentURL",
        "Lexpo/modules/kotlin/devtools/cdp/Request;",
        "timestamp",
        "Lexpo/modules/kotlin/devtools/cdp/MonotonicTime;",
        "wallTime",
        "Lexpo/modules/kotlin/devtools/cdp/TimeSinceEpoch;",
        "initiator",
        "",
        "redirectHasExtraInfo",
        "",
        "Lexpo/modules/kotlin/devtools/cdp/Response;",
        "referrerPolicy",
        "type",
        "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;)V",
        "getDocumentURL",
        "()Ljava/lang/String;",
        "getInitiator",
        "()Ljava/util/Map;",
        "getLoaderId",
        "getRedirectHasExtraInfo",
        "()Z",
        "getRedirectResponse",
        "()Lexpo/modules/kotlin/devtools/cdp/Response;",
        "getReferrerPolicy",
        "getRequest",
        "()Lexpo/modules/kotlin/devtools/cdp/Request;",
        "getRequestId",
        "getTimestamp",
        "()Ljava/math/BigDecimal;",
        "getType",
        "()Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
        "getWallTime",
        "component1",
        "component10",
        "component11",
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
        "",
        "hashCode",
        "",
        "toJSONObject",
        "Lorg/json/JSONObject;",
        "toString",
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


# instance fields
.field private final documentURL:Ljava/lang/String;

.field private final initiator:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final loaderId:Ljava/lang/String;

.field private final redirectHasExtraInfo:Z

.field private final redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

.field private final referrerPolicy:Ljava/lang/String;

.field private final request:Lexpo/modules/kotlin/devtools/cdp/Request;

.field private final requestId:Ljava/lang/String;

.field private final timestamp:Ljava/math/BigDecimal;

.field private final type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

.field private final wallTime:Ljava/math/BigDecimal;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/devtools/cdp/Request;",
            "Ljava/math/BigDecimal;",
            "Ljava/math/BigDecimal;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Lexpo/modules/kotlin/devtools/cdp/Response;",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
            ")V"
        }
    .end annotation

    const-string v0, "requestId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "loaderId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "documentURL"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timestamp"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "wallTime"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "initiator"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "referrerPolicy"

    invoke-static {p10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    iput-object p3, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    iput-object p4, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    iput-object p5, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    iput-object p6, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    iput-object p7, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    iput-boolean p8, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    iput-object p9, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    iput-object p10, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    iput-object p11, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 14

    move/from16 v0, p12

    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_0

    const-string v1, ""

    move-object v4, v1

    goto :goto_0

    :cond_0
    move-object/from16 v4, p2

    :goto_0
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_1

    const-string v1, "mobile"

    move-object v5, v1

    goto :goto_1

    :cond_1
    move-object/from16 v5, p3

    :goto_1
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_2

    const-string v1, "type"

    const-string v2, "script"

    .line 121
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    move-object v9, v1

    goto :goto_2

    :cond_2
    move-object/from16 v9, p7

    :goto_2
    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_3

    const-string v0, "no-referrer"

    move-object v12, v0

    goto :goto_3

    :cond_3
    move-object/from16 v12, p10

    :goto_3
    move-object v2, p0

    move-object v3, p1

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v13, p11

    .line 114
    invoke-direct/range {v2 .. v13}, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;)V

    return-void
.end method

.method public constructor <init>(Ljava/math/BigDecimal;Ljava/lang/String;Lokhttp3/Request;Lokhttp3/Response;)V
    .locals 17

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    const-string v2, "now"

    move-object/from16 v9, p1

    invoke-static {v9, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "requestId"

    move-object/from16 v4, p2

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "request"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 129
    new-instance v7, Lexpo/modules/kotlin/devtools/cdp/Request;

    invoke-direct {v7, v0}, Lexpo/modules/kotlin/devtools/cdp/Request;-><init>(Lokhttp3/Request;)V

    const/4 v10, 0x0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move v11, v0

    if-eqz v1, :cond_1

    .line 133
    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/Response;

    invoke-direct {v0, v1}, Lexpo/modules/kotlin/devtools/cdp/Response;-><init>(Lokhttp3/Response;)V

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    move-object v12, v0

    const/4 v13, 0x0

    .line 134
    sget-object v14, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->OTHER:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    const/16 v15, 0x246

    const/16 v16, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p2

    move-object/from16 v8, p1

    move-object/from16 v9, p1

    .line 127
    invoke-direct/range {v3 .. v16}, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public static synthetic copy$default(Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;ILjava/lang/Object;)Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;
    .locals 12

    move-object v0, p0

    move/from16 v1, p12

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_0

    iget-object v2, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v2, p1

    :goto_0
    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_1

    iget-object v3, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    goto :goto_1

    :cond_1
    move-object v3, p2

    :goto_1
    and-int/lit8 v4, v1, 0x4

    if-eqz v4, :cond_2

    iget-object v4, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    goto :goto_2

    :cond_2
    move-object v4, p3

    :goto_2
    and-int/lit8 v5, v1, 0x8

    if-eqz v5, :cond_3

    iget-object v5, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    goto :goto_3

    :cond_3
    move-object/from16 v5, p4

    :goto_3
    and-int/lit8 v6, v1, 0x10

    if-eqz v6, :cond_4

    iget-object v6, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    goto :goto_4

    :cond_4
    move-object/from16 v6, p5

    :goto_4
    and-int/lit8 v7, v1, 0x20

    if-eqz v7, :cond_5

    iget-object v7, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    goto :goto_5

    :cond_5
    move-object/from16 v7, p6

    :goto_5
    and-int/lit8 v8, v1, 0x40

    if-eqz v8, :cond_6

    iget-object v8, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    goto :goto_6

    :cond_6
    move-object/from16 v8, p7

    :goto_6
    and-int/lit16 v9, v1, 0x80

    if-eqz v9, :cond_7

    iget-boolean v9, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    goto :goto_7

    :cond_7
    move/from16 v9, p8

    :goto_7
    and-int/lit16 v10, v1, 0x100

    if-eqz v10, :cond_8

    iget-object v10, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    goto :goto_8

    :cond_8
    move-object/from16 v10, p9

    :goto_8
    and-int/lit16 v11, v1, 0x200

    if-eqz v11, :cond_9

    iget-object v11, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    goto :goto_9

    :cond_9
    move-object/from16 v11, p10

    :goto_9
    and-int/lit16 v1, v1, 0x400

    if-eqz v1, :cond_a

    iget-object v1, v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    goto :goto_a

    :cond_a
    move-object/from16 v1, p11

    :goto_a
    move-object p1, v2

    move-object p2, v3

    move-object p3, v4

    move-object/from16 p4, v5

    move-object/from16 p5, v6

    move-object/from16 p6, v7

    move-object/from16 p7, v8

    move/from16 p8, v9

    move-object/from16 p9, v10

    move-object/from16 p10, v11

    move-object/from16 p11, v1

    invoke-virtual/range {p0 .. p11}, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;)Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    return-object v0
.end method

.method public final component10()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    return-object v0
.end method

.method public final component11()Lexpo/modules/kotlin/devtools/cdp/ResourceType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    return-object v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Lexpo/modules/kotlin/devtools/cdp/Request;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    return-object v0
.end method

.method public final component5()Ljava/math/BigDecimal;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public final component6()Ljava/math/BigDecimal;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public final component7()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    return-object v0
.end method

.method public final component8()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    return v0
.end method

.method public final component9()Lexpo/modules/kotlin/devtools/cdp/Response;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;)Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/devtools/cdp/Request;",
            "Ljava/math/BigDecimal;",
            "Ljava/math/BigDecimal;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Lexpo/modules/kotlin/devtools/cdp/Response;",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
            ")",
            "Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;"
        }
    .end annotation

    const-string v0, "requestId"

    move-object v2, p1

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "loaderId"

    move-object v3, p2

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "documentURL"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timestamp"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "wallTime"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "initiator"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "referrerPolicy"

    move-object/from16 v11, p10

    invoke-static {v11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    move-object/from16 v12, p11

    invoke-static {v12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;

    move-object v1, v0

    move/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v1 .. v12}, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/Request;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/util/Map;ZLexpo/modules/kotlin/devtools/cdp/Response;Ljava/lang/String;Lexpo/modules/kotlin/devtools/cdp/ResourceType;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-boolean v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    iget-boolean v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    if-eq v1, v3, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return v2

    :cond_a
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    iget-object v3, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    iget-object p1, p1, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    if-eq v1, p1, :cond_c

    return v2

    :cond_c
    return v0
.end method

.method public final getDocumentURL()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    return-object v0
.end method

.method public final getInitiator()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    return-object v0
.end method

.method public final getLoaderId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    return-object v0
.end method

.method public final getRedirectHasExtraInfo()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    return v0
.end method

.method public final getRedirectResponse()Lexpo/modules/kotlin/devtools/cdp/Response;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    return-object v0
.end method

.method public final getReferrerPolicy()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    return-object v0
.end method

.method public final getRequest()Lexpo/modules/kotlin/devtools/cdp/Request;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    return-object v0
.end method

.method public final getRequestId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    return-object v0
.end method

.method public final getTimestamp()Ljava/math/BigDecimal;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public final getType()Lexpo/modules/kotlin/devtools/cdp/ResourceType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    return-object v0
.end method

.method public final getWallTime()Ljava/math/BigDecimal;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/cdp/Request;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    invoke-virtual {v1}, Ljava/math/BigDecimal;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    invoke-virtual {v1}, Ljava/math/BigDecimal;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    invoke-static {v1}, Lexpo/modules/filesystem/DeletingOptions$$ExternalSyntheticBackport0;->m(Z)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/cdp/Response;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 3

    .line 138
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "requestId"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    .line 139
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "loaderId"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    .line 140
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "documentURL"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    .line 141
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    .line 142
    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/cdp/Request;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "request"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "timestamp"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    .line 143
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "wallTime"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    .line 144
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 145
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v2, "initiator"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "redirectHasExtraInfo"

    iget-boolean v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    .line 146
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    if-eqz v1, :cond_0

    const-string v2, "redirectResponse"

    .line 148
    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/cdp/Response;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string v1, "referrerPolicy"

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    .line 150
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    .line 151
    invoke-virtual {v1}, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->getValue()Ljava/lang/String;

    move-result-object v1

    const-string v2, "type"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 13

    iget-object v0, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->requestId:Ljava/lang/String;

    iget-object v1, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    iget-object v2, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    iget-object v3, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->request:Lexpo/modules/kotlin/devtools/cdp/Request;

    iget-object v4, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->timestamp:Ljava/math/BigDecimal;

    iget-object v5, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->wallTime:Ljava/math/BigDecimal;

    iget-object v6, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->initiator:Ljava/util/Map;

    iget-boolean v7, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectHasExtraInfo:Z

    iget-object v8, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->redirectResponse:Lexpo/modules/kotlin/devtools/cdp/Response;

    iget-object v9, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->referrerPolicy:Ljava/lang/String;

    iget-object v10, p0, Lexpo/modules/kotlin/devtools/cdp/RequestWillBeSentParams;->type:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "RequestWillBeSentParams(requestId="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", loaderId="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", documentURL="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", request="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", timestamp="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", wallTime="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", initiator="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", redirectHasExtraInfo="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", redirectResponse="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", referrerPolicy="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", type="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
