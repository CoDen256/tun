.class public abstract Landroidx/autofill/inline/common/SlicedContent$Builder;
.super Ljava/lang/Object;
.source "SlicedContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/autofill/inline/common/SlicedContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/autofill/inline/common/SlicedContent;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final mSliceBuilder:Landroid/app/slice/Slice$Builder;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    invoke-static {}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m()V

    sget-object v0, Landroidx/autofill/inline/common/SlicedContent;->INLINE_SLICE_URI:Landroid/net/Uri;

    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/String;I)Landroid/app/slice/SliceSpec;

    move-result-object p1

    invoke-static {v0, p1}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/Uri;Landroid/app/slice/SliceSpec;)Landroid/app/slice/Slice$Builder;

    move-result-object p1

    iput-object p1, p0, Landroidx/autofill/inline/common/SlicedContent$Builder;->mSliceBuilder:Landroid/app/slice/Slice$Builder;

    return-void
.end method


# virtual methods
.method public abstract build()Landroidx/autofill/inline/common/SlicedContent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method
