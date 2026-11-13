.class Lcom/facebook/react/devsupport/LogBoxDialog;
.super Landroid/app/Dialog;
.source "LogBoxDialog.java"


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/view/View;)V
    .locals 1

    .line 21
    sget v0, Lcom/facebook/react/R$style;->Theme_Catalyst_LogBox:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Lcom/facebook/react/devsupport/LogBoxDialog;->requestWindowFeature(I)Z

    .line 24
    invoke-virtual {p0, p2}, Lcom/facebook/react/devsupport/LogBoxDialog;->setContentView(Landroid/view/View;)V

    return-void
.end method
