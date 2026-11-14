.class Lcom/learnium/RNDeviceInfo/RNDeviceModule$2;
.super Landroid/content/BroadcastReceiver;
.source "RNDeviceModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/learnium/RNDeviceInfo/RNDeviceModule;->initializeHeadphoneConnectionReceivers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;


# direct methods
.method constructor <init>(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)V
    .locals 0

    iput-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$2;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 152
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$2;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 155
    invoke-virtual {p1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->isHeadphonesConnectedSync()Z

    move-result p1

    iget-object p2, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$2;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 156
    invoke-static {p2}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->access$300(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v0

    const-string v1, "RNDeviceInfo_headphoneConnectionDidChange"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p2, v0, v1, p1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$msendEvent(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
