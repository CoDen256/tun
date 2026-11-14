.class public final Lio/grpc/InternalChannelz;
.super Ljava/lang/Object;
.source "InternalChannelz.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/InternalChannelz$TransportStats;,
        Lio/grpc/InternalChannelz$SocketOptions;,
        Lio/grpc/InternalChannelz$TcpInfo;,
        Lio/grpc/InternalChannelz$SocketStats;,
        Lio/grpc/InternalChannelz$Tls;,
        Lio/grpc/InternalChannelz$OtherSecurity;,
        Lio/grpc/InternalChannelz$Security;,
        Lio/grpc/InternalChannelz$ChannelTrace;,
        Lio/grpc/InternalChannelz$ChannelStats;,
        Lio/grpc/InternalChannelz$ServerStats;,
        Lio/grpc/InternalChannelz$ServerSocketsList;,
        Lio/grpc/InternalChannelz$ServerList;,
        Lio/grpc/InternalChannelz$RootChannelList;,
        Lio/grpc/InternalChannelz$ServerSocketMap;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final INSTANCE:Lio/grpc/InternalChannelz;

.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private final otherSockets:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Long;",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;>;"
        }
    .end annotation
.end field

.field private final perServerSockets:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Long;",
            "Lio/grpc/InternalChannelz$ServerSocketMap;",
            ">;"
        }
    .end annotation
.end field

.field private final rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentNavigableMap<",
            "Ljava/lang/Long;",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;>;"
        }
    .end annotation
.end field

.field private final servers:Ljava/util/concurrent/ConcurrentNavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentNavigableMap<",
            "Ljava/lang/Long;",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ServerStats;",
            ">;>;"
        }
    .end annotation
.end field

.field private final subchannels:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Long;",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lio/grpc/InternalChannelz;

    .line 49
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/grpc/InternalChannelz;->log:Ljava/util/logging/Logger;

    .line 50
    new-instance v0, Lio/grpc/InternalChannelz;

    invoke-direct {v0}, Lio/grpc/InternalChannelz;-><init>()V

    sput-object v0, Lio/grpc/InternalChannelz;->INSTANCE:Lio/grpc/InternalChannelz;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;-><init>()V

    iput-object v0, p0, Lio/grpc/InternalChannelz;->servers:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 54
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;-><init>()V

    iput-object v0, p0, Lio/grpc/InternalChannelz;->rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/grpc/InternalChannelz;->subchannels:Ljava/util/concurrent/ConcurrentMap;

    .line 59
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method static synthetic access$400()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lio/grpc/InternalChannelz;->log:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private static add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/grpc/InternalInstrumented<",
            "*>;>(",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 244
    invoke-interface {p1}, Lio/grpc/InternalInstrumented;->getLogId()Lio/grpc/InternalLogId;

    move-result-object v0

    invoke-virtual {v0}, Lio/grpc/InternalLogId;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/grpc/InternalInstrumented;

    return-void
.end method

.method private static contains(Ljava/util/Map;Lio/grpc/InternalLogId;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/grpc/InternalInstrumented<",
            "*>;>(",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "TT;>;",
            "Lio/grpc/InternalLogId;",
            ")Z"
        }
    .end annotation

    .line 255
    invoke-virtual {p1}, Lio/grpc/InternalLogId;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private getServerSocket(J)Lio/grpc/InternalInstrumented;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 215
    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/InternalChannelz$ServerSocketMap;

    .line 216
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/grpc/InternalChannelz$ServerSocketMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/InternalInstrumented;

    if-eqz v1, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static id(Lio/grpc/InternalWithLogId;)J
    .locals 2

    .line 1103
    invoke-interface {p0}, Lio/grpc/InternalWithLogId;->getLogId()Lio/grpc/InternalLogId;

    move-result-object p0

    invoke-virtual {p0}, Lio/grpc/InternalLogId;->getId()J

    move-result-wide v0

    return-wide v0
.end method

.method public static instance()Lio/grpc/InternalChannelz;
    .locals 1

    sget-object v0, Lio/grpc/InternalChannelz;->INSTANCE:Lio/grpc/InternalChannelz;

    return-object v0
.end method

.method private static remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/grpc/InternalInstrumented<",
            "*>;>(",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 249
    invoke-static {p1}, Lio/grpc/InternalChannelz;->id(Lio/grpc/InternalWithLogId;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/grpc/InternalInstrumented;

    return-void
.end method


# virtual methods
.method public addClientSocket(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 97
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public addListenSocket(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 101
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public addRootChannel(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 92
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public addServer(Lio/grpc/InternalInstrumented;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ServerStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 80
    invoke-static {p1}, Lio/grpc/InternalChannelz;->id(Lio/grpc/InternalWithLogId;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    new-instance v2, Lio/grpc/InternalChannelz$ServerSocketMap;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lio/grpc/InternalChannelz$ServerSocketMap;-><init>(Lio/grpc/InternalChannelz$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/InternalChannelz$ServerSocketMap;

    iget-object v0, p0, Lio/grpc/InternalChannelz;->servers:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 82
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public addServerSocket(Lio/grpc/InternalInstrumented;Lio/grpc/InternalInstrumented;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ServerStats;",
            ">;",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 107
    invoke-static {p1}, Lio/grpc/InternalChannelz;->id(Lio/grpc/InternalWithLogId;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalChannelz$ServerSocketMap;

    .line 109
    invoke-static {p1, p2}, Lio/grpc/InternalChannelz;->add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public addSubchannel(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->subchannels:Ljava/util/concurrent/ConcurrentMap;

    .line 87
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->add(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public containsClientSocket(Lio/grpc/InternalLogId;)Z
    .locals 1

    iget-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 240
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->contains(Ljava/util/Map;Lio/grpc/InternalLogId;)Z

    move-result p1

    return p1
.end method

.method public containsServer(Lio/grpc/InternalLogId;)Z
    .locals 1

    iget-object v0, p0, Lio/grpc/InternalChannelz;->servers:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 226
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->contains(Ljava/util/Map;Lio/grpc/InternalLogId;)Z

    move-result p1

    return p1
.end method

.method public containsSubchannel(Lio/grpc/InternalLogId;)Z
    .locals 1

    iget-object v0, p0, Lio/grpc/InternalChannelz;->subchannels:Ljava/util/concurrent/ConcurrentMap;

    .line 231
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->contains(Ljava/util/Map;Lio/grpc/InternalLogId;)Z

    move-result p1

    return p1
.end method

.method public getChannel(J)Lio/grpc/InternalInstrumented;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 160
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalInstrumented;

    return-object p1
.end method

.method public getRootChannel(J)Lio/grpc/InternalInstrumented;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 235
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalInstrumented;

    return-object p1
.end method

.method public getRootChannels(JI)Lio/grpc/InternalChannelz$RootChannelList;
    .locals 2

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lio/grpc/InternalChannelz;->rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 149
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->tailMap(Ljava/lang/Object;)Ljava/util/concurrent/ConcurrentNavigableMap;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 151
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    if-ge p2, p3, :cond_0

    .line 152
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/grpc/InternalInstrumented;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 154
    :cond_0
    new-instance p2, Lio/grpc/InternalChannelz$RootChannelList;

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-direct {p2, v0, p1}, Lio/grpc/InternalChannelz$RootChannelList;-><init>(Ljava/util/List;Z)V

    return-object p2
.end method

.method public getServer(J)Lio/grpc/InternalInstrumented;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ServerStats;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->servers:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 185
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalInstrumented;

    return-object p1
.end method

.method public getServerSockets(JJI)Lio/grpc/InternalChannelz$ServerSocketsList;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 191
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalChannelz$ServerSocketMap;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 195
    :cond_0
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p5}, Ljava/util/ArrayList;-><init>(I)V

    .line 197
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {p1, p3}, Lio/grpc/InternalChannelz$ServerSocketMap;->tailMap(Ljava/lang/Object;)Ljava/util/concurrent/ConcurrentNavigableMap;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 198
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    if-ge p3, p5, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 199
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lio/grpc/InternalWithLogId;

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 201
    :cond_1
    new-instance p3, Lio/grpc/InternalChannelz$ServerSocketsList;

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-direct {p3, p2, p1}, Lio/grpc/InternalChannelz$ServerSocketsList;-><init>(Ljava/util/List;Z)V

    return-object p3
.end method

.method public getServers(JI)Lio/grpc/InternalChannelz$ServerList;
    .locals 2

    .line 171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Lio/grpc/InternalChannelz;->servers:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 174
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->tailMap(Ljava/lang/Object;)Ljava/util/concurrent/ConcurrentNavigableMap;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentNavigableMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 176
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    if-ge p2, p3, :cond_0

    .line 177
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/grpc/InternalInstrumented;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 179
    :cond_0
    new-instance p2, Lio/grpc/InternalChannelz$ServerList;

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-direct {p2, v0, p1}, Lio/grpc/InternalChannelz$ServerList;-><init>(Ljava/util/List;Z)V

    return-object p2
.end method

.method public getSocket(J)Lio/grpc/InternalInstrumented;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 207
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/grpc/InternalInstrumented;

    if-eqz v0, :cond_0

    return-object v0

    .line 211
    :cond_0
    invoke-direct {p0, p1, p2}, Lio/grpc/InternalChannelz;->getServerSocket(J)Lio/grpc/InternalInstrumented;

    move-result-object p1

    return-object p1
.end method

.method public getSubchannel(J)Lio/grpc/InternalInstrumented;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->subchannels:Ljava/util/concurrent/ConcurrentMap;

    .line 166
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalInstrumented;

    return-object p1
.end method

.method public removeClientSocket(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 129
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public removeListenSocket(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->otherSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 133
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public removeRootChannel(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->rootChannels:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 125
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public removeServer(Lio/grpc/InternalInstrumented;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ServerStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->servers:Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 114
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    iget-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 115
    invoke-static {p1}, Lio/grpc/InternalChannelz;->id(Lio/grpc/InternalWithLogId;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalChannelz$ServerSocketMap;

    return-void
.end method

.method public removeServerSocket(Lio/grpc/InternalInstrumented;Lio/grpc/InternalInstrumented;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ServerStats;",
            ">;",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->perServerSockets:Ljava/util/concurrent/ConcurrentMap;

    .line 139
    invoke-static {p1}, Lio/grpc/InternalChannelz;->id(Lio/grpc/InternalWithLogId;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/grpc/InternalChannelz$ServerSocketMap;

    .line 141
    invoke-static {p1, p2}, Lio/grpc/InternalChannelz;->remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method

.method public removeSubchannel(Lio/grpc/InternalInstrumented;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/InternalInstrumented<",
            "Lio/grpc/InternalChannelz$ChannelStats;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/grpc/InternalChannelz;->subchannels:Ljava/util/concurrent/ConcurrentMap;

    .line 121
    invoke-static {v0, p1}, Lio/grpc/InternalChannelz;->remove(Ljava/util/Map;Lio/grpc/InternalInstrumented;)V

    return-void
.end method
