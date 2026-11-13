.class final Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;
.super Lkotlin/jvm/internal/Lambda;
.source "Shape.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/String;",
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "Lcom/revenuecat/purchases/paywalls/components/properties/Shape;",
        "it",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;

    invoke-direct {v0}, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;->INSTANCE:Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/properties/Shape;
    .locals 2

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    new-instance p1, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p1, v0, v1, v0}, Lcom/revenuecat/purchases/paywalls/components/properties/Shape$Rectangle;-><init>(Lcom/revenuecat/purchases/paywalls/components/properties/CornerRadiuses;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast p1, Lcom/revenuecat/purchases/paywalls/components/properties/Shape;

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 42
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/revenuecat/purchases/paywalls/components/properties/ShapeDeserializer$3;->invoke(Ljava/lang/String;)Lcom/revenuecat/purchases/paywalls/components/properties/Shape;

    move-result-object p1

    return-object p1
.end method
