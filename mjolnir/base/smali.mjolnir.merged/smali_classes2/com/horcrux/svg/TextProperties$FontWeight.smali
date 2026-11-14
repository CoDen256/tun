.class final enum Lcom/horcrux/svg/TextProperties$FontWeight;
.super Ljava/lang/Enum;
.source "TextProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/horcrux/svg/TextProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "FontWeight"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/horcrux/svg/TextProperties$FontWeight;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum Bold:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum Bolder:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum Lighter:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum Normal:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w100:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w200:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w300:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w400:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w500:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w600:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w700:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w800:Lcom/horcrux/svg/TextProperties$FontWeight;

.field public static final enum w900:Lcom/horcrux/svg/TextProperties$FontWeight;

.field private static final weightToEnum:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/horcrux/svg/TextProperties$FontWeight;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final weight:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/horcrux/svg/TextProperties$FontWeight;
    .locals 3

    const/16 v0, 0xd

    new-array v0, v0, [Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x0

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->Normal:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->Bold:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w100:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w200:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w300:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w400:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w500:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w600:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w700:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w800:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->w900:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->Bolder:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/horcrux/svg/TextProperties$FontWeight;->Lighter:Lcom/horcrux/svg/TextProperties$FontWeight;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 6

    .line 100
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const-string v1, "normal"

    const-string v2, "Normal"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->Normal:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 101
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x1

    const-string v2, "bold"

    const-string v4, "Bold"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->Bold:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 102
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x2

    const-string v2, "100"

    const-string v4, "w100"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w100:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 103
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x3

    const-string v2, "200"

    const-string v4, "w200"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w200:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 104
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x4

    const-string v2, "300"

    const-string v4, "w300"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w300:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 105
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x5

    const-string v2, "400"

    const-string v4, "w400"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w400:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 106
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x6

    const-string v2, "500"

    const-string v4, "w500"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w500:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 107
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/4 v1, 0x7

    const-string v2, "600"

    const-string v4, "w600"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w600:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 108
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/16 v1, 0x8

    const-string v2, "700"

    const-string v4, "w700"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w700:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 109
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/16 v1, 0x9

    const-string v2, "800"

    const-string v4, "w800"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w800:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 110
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/16 v1, 0xa

    const-string v2, "900"

    const-string v4, "w900"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->w900:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 112
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/16 v1, 0xb

    const-string v2, "bolder"

    const-string v4, "Bolder"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->Bolder:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 113
    new-instance v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    const/16 v1, 0xc

    const-string v2, "lighter"

    const-string v4, "Lighter"

    invoke-direct {v0, v4, v1, v2}, Lcom/horcrux/svg/TextProperties$FontWeight;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->Lighter:Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 98
    invoke-static {}, Lcom/horcrux/svg/TextProperties$FontWeight;->$values()[Lcom/horcrux/svg/TextProperties$FontWeight;

    move-result-object v0

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->$VALUES:[Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 129
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->weightToEnum:Ljava/util/Map;

    .line 132
    invoke-static {}, Lcom/horcrux/svg/TextProperties$FontWeight;->values()[Lcom/horcrux/svg/TextProperties$FontWeight;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v2, v0, v3

    sget-object v4, Lcom/horcrux/svg/TextProperties$FontWeight;->weightToEnum:Ljava/util/Map;

    .line 133
    iget-object v5, v2, Lcom/horcrux/svg/TextProperties$FontWeight;->weight:Ljava/lang/String;

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 117
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/horcrux/svg/TextProperties$FontWeight;->weight:Ljava/lang/String;

    return-void
.end method

.method static get(Ljava/lang/String;)Lcom/horcrux/svg/TextProperties$FontWeight;
    .locals 1

    sget-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->weightToEnum:Ljava/util/Map;

    .line 126
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/horcrux/svg/TextProperties$FontWeight;

    return-object p0
.end method

.method static hasEnum(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->weightToEnum:Ljava/util/Map;

    .line 122
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/horcrux/svg/TextProperties$FontWeight;
    .locals 1

    const-class v0, Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 98
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/horcrux/svg/TextProperties$FontWeight;

    return-object p0
.end method

.method public static values()[Lcom/horcrux/svg/TextProperties$FontWeight;
    .locals 1

    sget-object v0, Lcom/horcrux/svg/TextProperties$FontWeight;->$VALUES:[Lcom/horcrux/svg/TextProperties$FontWeight;

    .line 98
    invoke-virtual {v0}, [Lcom/horcrux/svg/TextProperties$FontWeight;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/horcrux/svg/TextProperties$FontWeight;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/horcrux/svg/TextProperties$FontWeight;->weight:Ljava/lang/String;

    return-object v0
.end method
