.class public final enum Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;
.super Ljava/lang/Enum;
.source "ConnectivityMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/ConnectivityMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NetworkStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

.field public static final enum REACHABLE:Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

.field public static final enum UNREACHABLE:Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 22
    new-instance v0, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    const-string v1, "UNREACHABLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;->UNREACHABLE:Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    .line 23
    new-instance v1, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    const-string v3, "REACHABLE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;->REACHABLE:Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;->$VALUES:[Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    .line 21
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;->$VALUES:[Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    .line 21
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/remote/ConnectivityMonitor$NetworkStatus;

    return-object v0
.end method
