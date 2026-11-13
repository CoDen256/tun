.class Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;
.super Landroid/content/BroadcastReceiver;
.source "RNDeviceModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/learnium/RNDeviceInfo/RNDeviceModule;->initialize()V
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

    iput-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 111
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    iget-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 114
    invoke-static {p1, p2}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$mgetPowerStateFromIntent(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Landroid/content/Intent;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 120
    :cond_0
    invoke-static {}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$sfgetBATTERY_STATE()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/facebook/react/bridge/WritableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 121
    invoke-static {}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$sfgetBATTERY_LEVEL()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/WritableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 122
    invoke-static {}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$sfgetLOW_POWER_MODE()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/WritableMap;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object v1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 124
    invoke-static {v1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$fgetmLastBatteryState(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    invoke-static {v1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$fgetmLastPowerSaveState(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)Z

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eq v1, v2, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 125
    invoke-static {v1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->access$000(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v2

    const-string v3, "RNDeviceInfo_powerStateDidChange"

    invoke-static {v1, v2, v3, p2}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$msendEvent(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 126
    invoke-static {v1, p2}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$fputmLastBatteryState(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 127
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p2, p1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$fputmLastPowerSaveState(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Z)V

    :cond_2
    iget-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 130
    invoke-static {p1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$fgetmLastBatteryLevel(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)D

    move-result-wide p1

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    cmpl-double p1, p1, v1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 131
    invoke-static {p1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->access$100(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p2

    const-string v1, "RNDeviceInfo_batteryLevelDidChange"

    invoke-static {p1, p2, v1, v0}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$msendEvent(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    const-wide v1, 0x3fc3333333333333L    # 0.15

    cmpg-double p1, p1, v1

    if-gtz p1, :cond_3

    iget-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 134
    invoke-static {p1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->access$200(Lcom/learnium/RNDeviceInfo/RNDeviceModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object p2

    const-string v1, "RNDeviceInfo_batteryLevelIsLow"

    invoke-static {p1, p2, v1, v0}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$msendEvent(Lcom/learnium/RNDeviceInfo/RNDeviceModule;Lcom/facebook/react/bridge/ReactContext;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    iget-object p1, p0, Lcom/learnium/RNDeviceInfo/RNDeviceModule$1;->this$0:Lcom/learnium/RNDeviceInfo/RNDeviceModule;

    .line 137
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/learnium/RNDeviceInfo/RNDeviceModule;->-$$Nest$fputmLastBatteryLevel(Lcom/learnium/RNDeviceInfo/RNDeviceModule;D)V

    :cond_4
    return-void
.end method
