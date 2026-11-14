.class Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AndroidChannelBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkReceiver"
.end annotation


# instance fields
.field private isConnected:Z

.field final synthetic this$0:Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;


# direct methods
.method private constructor <init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;->this$0:Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;

    .line 326
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;->isConnected:Z

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;Lio/grpc/android/AndroidChannelBuilder$1;)V
    .locals 0

    .line 326
    invoke-direct {p0, p1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;-><init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "intent"
        }
    .end annotation

    const-string p2, "connectivity"

    .line 333
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    .line 334
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p1

    iget-boolean p2, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;->isConnected:Z

    if-eqz p1, :cond_0

    .line 336
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;->isConnected:Z

    if-eqz p1, :cond_1

    if-nez p2, :cond_1

    iget-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;->this$0:Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;

    .line 338
    invoke-static {p1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->access$400(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)Lio/grpc/ManagedChannel;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/ManagedChannel;->enterIdle()V

    :cond_1
    return-void
.end method
