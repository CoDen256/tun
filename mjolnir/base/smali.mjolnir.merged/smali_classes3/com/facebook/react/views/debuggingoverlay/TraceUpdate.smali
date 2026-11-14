.class public final Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;
.super Ljava/lang/Object;
.source "TraceUpdate.java"


# instance fields
.field private final mColor:I

.field private final mId:I

.field private final mRectangle:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(ILandroid/graphics/RectF;I)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;->mId:I

    iput-object p2, p0, Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;->mRectangle:Landroid/graphics/RectF;

    iput p3, p0, Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;->mColor:I

    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;->mColor:I

    return v0
.end method

.method public getId()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;->mId:I

    return v0
.end method

.method public getRectangle()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/debuggingoverlay/TraceUpdate;->mRectangle:Landroid/graphics/RectF;

    return-object v0
.end method
