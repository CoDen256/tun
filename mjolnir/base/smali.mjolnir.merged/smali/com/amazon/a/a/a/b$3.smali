.class Lcom/amazon/a/a/a/b$3;
.super Landroid/content/BroadcastReceiver;
.source "ContextManagerImplV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/a/a/a/b;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/amazon/a/a/a/b;


# direct methods
.method constructor <init>(Lcom/amazon/a/a/a/b;)V
    .locals 0

    iput-object p1, p0, Lcom/amazon/a/a/a/b$3;->a:Lcom/amazon/a/a/a/b;

    .line 684
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Lcom/amazon/a/a/a/b$3;->a:Lcom/amazon/a/a/a/b;

    .line 688
    invoke-static {p1, p2}, Lcom/amazon/a/a/a/b;->a(Lcom/amazon/a/a/a/b;Landroid/content/Intent;)V

    return-void
.end method
