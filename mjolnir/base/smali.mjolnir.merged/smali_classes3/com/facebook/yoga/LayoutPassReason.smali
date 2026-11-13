.class public final enum Lcom/facebook/yoga/LayoutPassReason;
.super Ljava/lang/Enum;
.source "LayoutPassReason.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/yoga/LayoutPassReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum ABS_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum ABS_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum FLEX_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum FLEX_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum INITIAL:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum MEASURE:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum MULTILINE_STRETCH:Lcom/facebook/yoga/LayoutPassReason;

.field public static final enum STRETCH:Lcom/facebook/yoga/LayoutPassReason;


# instance fields
.field private final mIntValue:I


# direct methods
.method private static synthetic $values()[Lcom/facebook/yoga/LayoutPassReason;
    .locals 3

    const/16 v0, 0x8

    new-array v0, v0, [Lcom/facebook/yoga/LayoutPassReason;

    const/4 v1, 0x0

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->INITIAL:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->ABS_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->STRETCH:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->MULTILINE_STRETCH:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->FLEX_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->ABS_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/facebook/yoga/LayoutPassReason;->FLEX_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 11
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "INITIAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->INITIAL:Lcom/facebook/yoga/LayoutPassReason;

    .line 12
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "ABS_LAYOUT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->ABS_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

    .line 13
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "STRETCH"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->STRETCH:Lcom/facebook/yoga/LayoutPassReason;

    .line 14
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "MULTILINE_STRETCH"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->MULTILINE_STRETCH:Lcom/facebook/yoga/LayoutPassReason;

    .line 15
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "FLEX_LAYOUT"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->FLEX_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

    .line 16
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "MEASURE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    .line 17
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "ABS_MEASURE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->ABS_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    .line 18
    new-instance v0, Lcom/facebook/yoga/LayoutPassReason;

    const-string v1, "FLEX_MEASURE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/LayoutPassReason;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->FLEX_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    .line 10
    invoke-static {}, Lcom/facebook/yoga/LayoutPassReason;->$values()[Lcom/facebook/yoga/LayoutPassReason;

    move-result-object v0

    sput-object v0, Lcom/facebook/yoga/LayoutPassReason;->$VALUES:[Lcom/facebook/yoga/LayoutPassReason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/facebook/yoga/LayoutPassReason;->mIntValue:I

    return-void
.end method

.method public static fromInt(I)Lcom/facebook/yoga/LayoutPassReason;
    .locals 3

    packed-switch p0, :pswitch_data_0

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown enum value: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->FLEX_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_1
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->ABS_MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_2
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->MEASURE:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_3
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->FLEX_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_4
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->MULTILINE_STRETCH:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_5
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->STRETCH:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_6
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->ABS_LAYOUT:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    :pswitch_7
    sget-object p0, Lcom/facebook/yoga/LayoutPassReason;->INITIAL:Lcom/facebook/yoga/LayoutPassReason;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/yoga/LayoutPassReason;
    .locals 1

    const-class v0, Lcom/facebook/yoga/LayoutPassReason;

    .line 10
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/yoga/LayoutPassReason;

    return-object p0
.end method

.method public static values()[Lcom/facebook/yoga/LayoutPassReason;
    .locals 1

    sget-object v0, Lcom/facebook/yoga/LayoutPassReason;->$VALUES:[Lcom/facebook/yoga/LayoutPassReason;

    .line 10
    invoke-virtual {v0}, [Lcom/facebook/yoga/LayoutPassReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/yoga/LayoutPassReason;

    return-object v0
.end method


# virtual methods
.method public intValue()I
    .locals 1

    iget v0, p0, Lcom/facebook/yoga/LayoutPassReason;->mIntValue:I

    return v0
.end method
