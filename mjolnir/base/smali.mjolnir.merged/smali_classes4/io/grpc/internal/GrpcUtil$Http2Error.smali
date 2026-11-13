.class public final enum Lio/grpc/internal/GrpcUtil$Http2Error;
.super Ljava/lang/Enum;
.source "GrpcUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/GrpcUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Http2Error"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/grpc/internal/GrpcUtil$Http2Error;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum CANCEL:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum COMPRESSION_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum CONNECT_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum ENHANCE_YOUR_CALM:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum FLOW_CONTROL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum FRAME_SIZE_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum HTTP_1_1_REQUIRED:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum INADEQUATE_SECURITY:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum INTERNAL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum NO_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum PROTOCOL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum REFUSED_STREAM:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum SETTINGS_TIMEOUT:Lio/grpc/internal/GrpcUtil$Http2Error;

.field public static final enum STREAM_CLOSED:Lio/grpc/internal/GrpcUtil$Http2Error;

.field private static final codeMap:[Lio/grpc/internal/GrpcUtil$Http2Error;


# instance fields
.field private final code:I

.field private final status:Lio/grpc/Status;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 332
    new-instance v0, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v1, Lio/grpc/Status;->UNAVAILABLE:Lio/grpc/Status;

    const-string v2, "NO_ERROR"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v3, v1}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v0, Lio/grpc/internal/GrpcUtil$Http2Error;->NO_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 333
    new-instance v1, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v2, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v4, "PROTOCOL_ERROR"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v5, v2}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v1, Lio/grpc/internal/GrpcUtil$Http2Error;->PROTOCOL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 334
    new-instance v2, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v4, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v6, "INTERNAL_ERROR"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v7, v4}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v2, Lio/grpc/internal/GrpcUtil$Http2Error;->INTERNAL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 335
    new-instance v4, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v6, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v8, "FLOW_CONTROL_ERROR"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v9, v6}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v4, Lio/grpc/internal/GrpcUtil$Http2Error;->FLOW_CONTROL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 336
    new-instance v6, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v8, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v10, "SETTINGS_TIMEOUT"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v11, v8}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v6, Lio/grpc/internal/GrpcUtil$Http2Error;->SETTINGS_TIMEOUT:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 337
    new-instance v8, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v10, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v12, "STREAM_CLOSED"

    const/4 v13, 0x5

    invoke-direct {v8, v12, v13, v13, v10}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v8, Lio/grpc/internal/GrpcUtil$Http2Error;->STREAM_CLOSED:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 338
    new-instance v10, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v12, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v14, "FRAME_SIZE_ERROR"

    const/4 v15, 0x6

    invoke-direct {v10, v14, v15, v15, v12}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v10, Lio/grpc/internal/GrpcUtil$Http2Error;->FRAME_SIZE_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 339
    new-instance v12, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v14, Lio/grpc/Status;->UNAVAILABLE:Lio/grpc/Status;

    const-string v15, "REFUSED_STREAM"

    const/4 v13, 0x7

    invoke-direct {v12, v15, v13, v13, v14}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v12, Lio/grpc/internal/GrpcUtil$Http2Error;->REFUSED_STREAM:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 340
    new-instance v14, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v15, Lio/grpc/Status;->CANCELLED:Lio/grpc/Status;

    const-string v13, "CANCEL"

    const/16 v11, 0x8

    invoke-direct {v14, v13, v11, v11, v15}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v14, Lio/grpc/internal/GrpcUtil$Http2Error;->CANCEL:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 341
    new-instance v13, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v15, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v11, "COMPRESSION_ERROR"

    const/16 v9, 0x9

    invoke-direct {v13, v11, v9, v9, v15}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v13, Lio/grpc/internal/GrpcUtil$Http2Error;->COMPRESSION_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 342
    new-instance v11, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v15, Lio/grpc/Status;->INTERNAL:Lio/grpc/Status;

    const-string v9, "CONNECT_ERROR"

    const/16 v7, 0xa

    invoke-direct {v11, v9, v7, v7, v15}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v11, Lio/grpc/internal/GrpcUtil$Http2Error;->CONNECT_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 343
    new-instance v9, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v15, Lio/grpc/Status;->RESOURCE_EXHAUSTED:Lio/grpc/Status;

    const-string v7, "Bandwidth exhausted"

    invoke-virtual {v15, v7}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v7

    const-string v15, "ENHANCE_YOUR_CALM"

    const/16 v5, 0xb

    invoke-direct {v9, v15, v5, v5, v7}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v9, Lio/grpc/internal/GrpcUtil$Http2Error;->ENHANCE_YOUR_CALM:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 344
    new-instance v7, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v15, Lio/grpc/Status;->PERMISSION_DENIED:Lio/grpc/Status;

    const-string v5, "Permission denied as protocol is not secure enough to call"

    invoke-virtual {v15, v5}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object v5

    const-string v15, "INADEQUATE_SECURITY"

    const/16 v3, 0xc

    invoke-direct {v7, v15, v3, v3, v5}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v7, Lio/grpc/internal/GrpcUtil$Http2Error;->INADEQUATE_SECURITY:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 346
    new-instance v5, Lio/grpc/internal/GrpcUtil$Http2Error;

    sget-object v15, Lio/grpc/Status;->UNKNOWN:Lio/grpc/Status;

    const-string v3, "HTTP_1_1_REQUIRED"

    move-object/from16 v16, v7

    const/16 v7, 0xd

    invoke-direct {v5, v3, v7, v7, v15}, Lio/grpc/internal/GrpcUtil$Http2Error;-><init>(Ljava/lang/String;IILio/grpc/Status;)V

    sput-object v5, Lio/grpc/internal/GrpcUtil$Http2Error;->HTTP_1_1_REQUIRED:Lio/grpc/internal/GrpcUtil$Http2Error;

    const/16 v3, 0xe

    new-array v3, v3, [Lio/grpc/internal/GrpcUtil$Http2Error;

    const/4 v15, 0x0

    aput-object v0, v3, v15

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    const/4 v0, 0x3

    aput-object v4, v3, v0

    const/4 v0, 0x4

    aput-object v6, v3, v0

    const/4 v0, 0x5

    aput-object v8, v3, v0

    const/4 v0, 0x6

    aput-object v10, v3, v0

    const/4 v0, 0x7

    aput-object v12, v3, v0

    const/16 v0, 0x8

    aput-object v14, v3, v0

    const/16 v0, 0x9

    aput-object v13, v3, v0

    const/16 v0, 0xa

    aput-object v11, v3, v0

    const/16 v0, 0xb

    aput-object v9, v3, v0

    const/16 v0, 0xc

    aput-object v16, v3, v0

    aput-object v5, v3, v7

    sput-object v3, Lio/grpc/internal/GrpcUtil$Http2Error;->$VALUES:[Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 349
    invoke-static {}, Lio/grpc/internal/GrpcUtil$Http2Error;->buildHttp2CodeMap()[Lio/grpc/internal/GrpcUtil$Http2Error;

    move-result-object v0

    sput-object v0, Lio/grpc/internal/GrpcUtil$Http2Error;->codeMap:[Lio/grpc/internal/GrpcUtil$Http2Error;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILio/grpc/Status;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lio/grpc/Status;",
            ")V"
        }
    .end annotation

    .line 368
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/grpc/internal/GrpcUtil$Http2Error;->code:I

    .line 370
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "HTTP/2 error code: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lio/grpc/internal/GrpcUtil$Http2Error;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 371
    invoke-virtual {p4}, Lio/grpc/Status;->getDescription()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 372
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ("

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Lio/grpc/Status;->getDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 374
    :cond_0
    invoke-virtual {p4, p1}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p1

    iput-object p1, p0, Lio/grpc/internal/GrpcUtil$Http2Error;->status:Lio/grpc/Status;

    return-void
.end method

.method private static buildHttp2CodeMap()[Lio/grpc/internal/GrpcUtil$Http2Error;
    .locals 7

    .line 352
    invoke-static {}, Lio/grpc/internal/GrpcUtil$Http2Error;->values()[Lio/grpc/internal/GrpcUtil$Http2Error;

    move-result-object v0

    .line 353
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    invoke-virtual {v1}, Lio/grpc/internal/GrpcUtil$Http2Error;->code()J

    move-result-wide v1

    long-to-int v1, v1

    add-int/lit8 v1, v1, 0x1

    .line 354
    new-array v1, v1, [Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 355
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v0, v3

    .line 356
    invoke-virtual {v4}, Lio/grpc/internal/GrpcUtil$Http2Error;->code()J

    move-result-wide v5

    long-to-int v5, v5

    .line 357
    aput-object v4, v1, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static forCode(J)Lio/grpc/internal/GrpcUtil$Http2Error;
    .locals 3

    sget-object v0, Lio/grpc/internal/GrpcUtil$Http2Error;->codeMap:[Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 398
    array-length v1, v0

    int-to-long v1, v1

    cmp-long v1, p0, v1

    if-gez v1, :cond_1

    const-wide/16 v1, 0x0

    cmp-long v1, p0, v1

    if-gez v1, :cond_0

    goto :goto_0

    :cond_0
    long-to-int p0, p0

    .line 401
    aget-object p0, v0, p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static statusForCode(J)Lio/grpc/Status;
    .locals 3

    .line 415
    invoke-static {p0, p1}, Lio/grpc/internal/GrpcUtil$Http2Error;->forCode(J)Lio/grpc/internal/GrpcUtil$Http2Error;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lio/grpc/internal/GrpcUtil$Http2Error;->INTERNAL_ERROR:Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 418
    invoke-virtual {v0}, Lio/grpc/internal/GrpcUtil$Http2Error;->status()Lio/grpc/Status;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/Status;->getCode()Lio/grpc/Status$Code;

    move-result-object v0

    .line 419
    invoke-virtual {v0}, Lio/grpc/Status$Code;->value()I

    move-result v0

    invoke-static {v0}, Lio/grpc/Status;->fromCodeValue(I)Lio/grpc/Status;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unrecognized HTTP/2 error code: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 420
    invoke-virtual {v0, p0}, Lio/grpc/Status;->withDescription(Ljava/lang/String;)Lio/grpc/Status;

    move-result-object p0

    return-object p0

    .line 423
    :cond_0
    invoke-virtual {v0}, Lio/grpc/internal/GrpcUtil$Http2Error;->status()Lio/grpc/Status;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/grpc/internal/GrpcUtil$Http2Error;
    .locals 1

    const-class v0, Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 326
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/grpc/internal/GrpcUtil$Http2Error;

    return-object p0
.end method

.method public static values()[Lio/grpc/internal/GrpcUtil$Http2Error;
    .locals 1

    sget-object v0, Lio/grpc/internal/GrpcUtil$Http2Error;->$VALUES:[Lio/grpc/internal/GrpcUtil$Http2Error;

    .line 326
    invoke-virtual {v0}, [Lio/grpc/internal/GrpcUtil$Http2Error;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/grpc/internal/GrpcUtil$Http2Error;

    return-object v0
.end method


# virtual methods
.method public code()J
    .locals 2

    iget v0, p0, Lio/grpc/internal/GrpcUtil$Http2Error;->code:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public status()Lio/grpc/Status;
    .locals 1

    iget-object v0, p0, Lio/grpc/internal/GrpcUtil$Http2Error;->status:Lio/grpc/Status;

    return-object v0
.end method
