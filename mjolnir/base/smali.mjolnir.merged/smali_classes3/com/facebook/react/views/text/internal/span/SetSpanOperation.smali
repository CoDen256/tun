.class public Lcom/facebook/react/views/text/internal/span/SetSpanOperation;
.super Ljava/lang/Object;
.source "SetSpanOperation.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final SPAN_MAX_PRIORITY:I = 0xff

.field private static final TAG:Ljava/lang/String; = "SetSpanOperation"


# instance fields
.field protected end:I

.field protected start:I

.field private final what:Lcom/facebook/react/views/text/internal/span/ReactSpan;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(IILcom/facebook/react/views/text/internal/span/ReactSpan;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->start:I

    iput p2, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->end:I

    iput-object p3, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->what:Lcom/facebook/react/views/text/internal/span/ReactSpan;

    return-void
.end method


# virtual methods
.method public execute(Landroid/text/SpannableStringBuilder;I)V
    .locals 3

    iget v0, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->start:I

    if-nez v0, :cond_0

    const/16 v0, 0x12

    goto :goto_0

    :cond_0
    const/16 v0, 0x22

    :goto_0
    rsub-int p2, p2, 0xff

    if-gez p2, :cond_1

    const-string v1, "SetSpanOperation"

    const-string v2, "Text tree size exceeded the limit, styling may become unpredictable"

    .line 48
    invoke-static {v1, v2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 v1, 0x0

    .line 53
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    const v1, -0xff0001

    and-int/2addr v0, v1

    shl-int/lit8 p2, p2, 0x10

    const/high16 v1, 0xff0000

    and-int/2addr p2, v1

    or-int/2addr p2, v0

    iget-object v0, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->what:Lcom/facebook/react/views/text/internal/span/ReactSpan;

    iget v1, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->start:I

    iget v2, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->end:I

    .line 58
    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method public getWhat()Lcom/facebook/react/views/text/internal/span/ReactSpan;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/internal/span/SetSpanOperation;->what:Lcom/facebook/react/views/text/internal/span/ReactSpan;

    return-object v0
.end method
