.class public final Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;
.super Ljava/lang/Object;
.source "Shape.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/revenuecat/purchases/paywalls/components/properties/Shape;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000f\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006H\u00c6\u0001R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;",
        "",
        "()V",
        "pillCornerRadiuses",
        "Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;",
        "serializer",
        "Lkotlinx/serialization/KSerializer;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape;",
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
.field static final synthetic $$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;

.field private static final pillCornerRadiuses:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;->$$INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;

    .line 13
    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;-><init>(I)V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;->pillCornerRadiuses:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getPillCornerRadiuses$p()Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;
    .locals 1

    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Companion;->pillCornerRadiuses:Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses$Percentage;

    return-object v0
.end method


# virtual methods
.method public final serializer()Lkotlinx/serialization/KSerializer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer<",
            "Lcom/revenuecat/purchases/paywalls/components/properties/Shape;",
            ">;"
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;

    check-cast v0, Lkotlinx/serialization/KSerializer;

    return-object v0
.end method
