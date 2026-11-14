.class final enum Lcom/horcrux/svg/TextProperties$TextAnchor;
.super Ljava/lang/Enum;
.source "TextProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/horcrux/svg/TextProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TextAnchor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/horcrux/svg/TextProperties$TextAnchor;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/horcrux/svg/TextProperties$TextAnchor;

.field public static final enum end:Lcom/horcrux/svg/TextProperties$TextAnchor;

.field public static final enum middle:Lcom/horcrux/svg/TextProperties$TextAnchor;

.field public static final enum start:Lcom/horcrux/svg/TextProperties$TextAnchor;


# direct methods
.method private static synthetic $values()[Lcom/horcrux/svg/TextProperties$TextAnchor;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/horcrux/svg/TextProperties$TextAnchor;

    const/4 v1, 0x0

    sget-object v2, Lcom/horcrux/svg/TextProperties$TextAnchor;->start:Lcom/horcrux/svg/TextProperties$TextAnchor;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/horcrux/svg/TextProperties$TextAnchor;->middle:Lcom/horcrux/svg/TextProperties$TextAnchor;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/horcrux/svg/TextProperties$TextAnchor;->end:Lcom/horcrux/svg/TextProperties$TextAnchor;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 145
    new-instance v0, Lcom/horcrux/svg/TextProperties$TextAnchor;

    const-string v1, "start"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/horcrux/svg/TextProperties$TextAnchor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$TextAnchor;->start:Lcom/horcrux/svg/TextProperties$TextAnchor;

    .line 146
    new-instance v0, Lcom/horcrux/svg/TextProperties$TextAnchor;

    const-string v1, "middle"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/horcrux/svg/TextProperties$TextAnchor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$TextAnchor;->middle:Lcom/horcrux/svg/TextProperties$TextAnchor;

    .line 147
    new-instance v0, Lcom/horcrux/svg/TextProperties$TextAnchor;

    const-string v1, "end"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/horcrux/svg/TextProperties$TextAnchor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/horcrux/svg/TextProperties$TextAnchor;->end:Lcom/horcrux/svg/TextProperties$TextAnchor;

    .line 144
    invoke-static {}, Lcom/horcrux/svg/TextProperties$TextAnchor;->$values()[Lcom/horcrux/svg/TextProperties$TextAnchor;

    move-result-object v0

    sput-object v0, Lcom/horcrux/svg/TextProperties$TextAnchor;->$VALUES:[Lcom/horcrux/svg/TextProperties$TextAnchor;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 144
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/horcrux/svg/TextProperties$TextAnchor;
    .locals 1

    const-class v0, Lcom/horcrux/svg/TextProperties$TextAnchor;

    .line 144
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/horcrux/svg/TextProperties$TextAnchor;

    return-object p0
.end method

.method public static values()[Lcom/horcrux/svg/TextProperties$TextAnchor;
    .locals 1

    sget-object v0, Lcom/horcrux/svg/TextProperties$TextAnchor;->$VALUES:[Lcom/horcrux/svg/TextProperties$TextAnchor;

    .line 144
    invoke-virtual {v0}, [Lcom/horcrux/svg/TextProperties$TextAnchor;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/horcrux/svg/TextProperties$TextAnchor;

    return-object v0
.end method
