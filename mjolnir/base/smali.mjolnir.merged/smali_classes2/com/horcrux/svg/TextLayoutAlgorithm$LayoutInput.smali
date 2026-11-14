.class Lcom/horcrux/svg/TextLayoutAlgorithm$LayoutInput;
.super Ljava/lang/Object;
.source "TextLayoutAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/horcrux/svg/TextLayoutAlgorithm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LayoutInput"
.end annotation


# instance fields
.field horizontal:Z

.field text:Lcom/horcrux/svg/TextView;

.field final synthetic this$0:Lcom/horcrux/svg/TextLayoutAlgorithm;


# direct methods
.method constructor <init>(Lcom/horcrux/svg/TextLayoutAlgorithm;)V
    .locals 0

    iput-object p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$LayoutInput;->this$0:Lcom/horcrux/svg/TextLayoutAlgorithm;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
