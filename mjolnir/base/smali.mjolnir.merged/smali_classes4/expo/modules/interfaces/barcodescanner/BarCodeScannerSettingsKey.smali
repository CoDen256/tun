.class public final enum Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;
.super Ljava/lang/Enum;
.source "BarCodeScannerSettingsKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

.field public static final enum TYPES:Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;


# instance fields
.field private final mName:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->TYPES:Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 4
    new-instance v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    const/4 v1, 0x0

    const-string v2, "barCodeTypes"

    const-string v3, "TYPES"

    invoke-direct {v0, v3, v1, v2}, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->TYPES:Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    .line 3
    invoke-static {}, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->$values()[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    move-result-object v0

    sput-object v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->$VALUES:[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

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

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->mName:Ljava/lang/String;

    return-void
.end method

.method public static fromStringName(Ljava/lang/String;)Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;
    .locals 5

    .line 13
    invoke-static {}, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->values()[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 14
    invoke-virtual {v3}, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;
    .locals 1

    const-class v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    return-object p0
.end method

.method public static values()[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;
    .locals 1

    sget-object v0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->$VALUES:[Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    .line 3
    invoke-virtual {v0}, [Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/interfaces/barcodescanner/BarCodeScannerSettingsKey;->mName:Ljava/lang/String;

    return-object v0
.end method
