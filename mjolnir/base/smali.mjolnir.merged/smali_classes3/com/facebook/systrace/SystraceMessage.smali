.class public final Lcom/facebook/systrace/SystraceMessage;
.super Ljava/lang/Object;
.source "SystraceMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/systrace/SystraceMessage$StartSectionBuilder;,
        Lcom/facebook/systrace/SystraceMessage$EndSectionBuilder;,
        Lcom/facebook/systrace/SystraceMessage$Builder;
    }
.end annotation


# static fields
.field public static INCLUDE_ARGS:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/facebook/systrace/SystraceMessage;->INCLUDE_ARGS:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beginSection(JLjava/lang/String;)Lcom/facebook/systrace/SystraceMessage$Builder;
    .locals 1

    .line 18
    new-instance v0, Lcom/facebook/systrace/SystraceMessage$StartSectionBuilder;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/systrace/SystraceMessage$StartSectionBuilder;-><init>(JLjava/lang/String;)V

    return-object v0
.end method

.method public static endSection(J)Lcom/facebook/systrace/SystraceMessage$Builder;
    .locals 1

    .line 22
    new-instance v0, Lcom/facebook/systrace/SystraceMessage$EndSectionBuilder;

    invoke-direct {v0, p0, p1}, Lcom/facebook/systrace/SystraceMessage$EndSectionBuilder;-><init>(J)V

    return-object v0
.end method
