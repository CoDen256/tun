.class Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;
.super Ljava/lang/Object;
.source "TextLayoutAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/horcrux/svg/TextLayoutAlgorithm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CharacterInformation"
.end annotation


# instance fields
.field addressable:Z

.field advance:D

.field anchoredChunk:Z

.field character:C

.field element:Lcom/horcrux/svg/TextView;

.field firstCharacterInResolvedDescendant:Z

.field hidden:Z

.field index:I

.field middle:Z

.field resolved:Z

.field rotate:D

.field rotateSpecified:Z

.field final synthetic this$0:Lcom/horcrux/svg/TextLayoutAlgorithm;

.field x:D

.field xSpecified:Z

.field y:D

.field ySpecified:Z


# direct methods
.method constructor <init>(Lcom/horcrux/svg/TextLayoutAlgorithm;IC)V
    .locals 2

    iput-object p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->this$0:Lcom/horcrux/svg/TextLayoutAlgorithm;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->x:D

    iput-wide v0, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->y:D

    iput-wide v0, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->rotate:D

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->hidden:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->middle:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->resolved:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->xSpecified:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->ySpecified:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->addressable:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->anchoredChunk:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->rotateSpecified:Z

    iput-boolean p1, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->firstCharacterInResolvedDescendant:Z

    iput p2, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->index:I

    iput-char p3, p0, Lcom/horcrux/svg/TextLayoutAlgorithm$CharacterInformation;->character:C

    return-void
.end method
