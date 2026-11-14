.class Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "AndroidChannelBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultNetworkCallback"
.end annotation


# instance fields
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

    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;->this$0:Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;

    .line 311
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;Lio/grpc/android/AndroidChannelBuilder$1;)V
    .locals 0

    .line 311
    invoke-direct {p0, p1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;-><init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)V

    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "network"
        }
    .end annotation

    iget-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;->this$0:Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;

    .line 314
    invoke-static {p1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->access$400(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)Lio/grpc/ManagedChannel;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/ManagedChannel;->enterIdle()V

    return-void
.end method

.method public onBlockedStatusChanged(Landroid/net/Network;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "network",
            "blocked"
        }
    .end annotation

    if-nez p2, :cond_0

    iget-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;->this$0:Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;

    .line 320
    invoke-static {p1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->access$400(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)Lio/grpc/ManagedChannel;

    move-result-object p1

    invoke-virtual {p1}, Lio/grpc/ManagedChannel;->enterIdle()V

    :cond_0
    return-void
.end method
