.class public final enum Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;
.super Ljava/lang/Enum;
.source "JavaScriptObject.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/jni/JavaScriptObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PropertyDescriptor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\t\u00a8\u0006\n"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
        "",
        "value",
        "",
        "(Ljava/lang/String;II)V",
        "getValue",
        "()I",
        "Configurable",
        "Enumerable",
        "Writable",
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


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

.field public static final enum Configurable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

.field public static final enum Enumerable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

.field public static final enum Writable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;


# instance fields
.field private final value:I


# direct methods
.method private static final synthetic $values()[Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->Configurable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->Enumerable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->Writable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 20
    new-instance v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    const-string v1, "Configurable"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->Configurable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    .line 25
    new-instance v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    const-string v1, "Enumerable"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v3, v2}, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->Enumerable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    .line 30
    new-instance v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    const-string v1, "Writable"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->Writable:Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    invoke-static {}, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->$values()[Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->$VALUES:[Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->value:I

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;
    .locals 1

    const-class v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    return-object p0
.end method

.method public static values()[Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->$VALUES:[Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;

    return-object v0
.end method


# virtual methods
.method public final getValue()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/jni/JavaScriptObject$PropertyDescriptor;->value:I

    return v0
.end method
