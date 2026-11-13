.class public final Lexpo/modules/apploader/HeadlessAppLoader$Params;
.super Ljava/lang/Object;
.source "HeadlessAppLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/apploader/HeadlessAppLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Params"
.end annotation


# instance fields
.field private final appScopeKey:Ljava/lang/String;

.field private final appUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/apploader/HeadlessAppLoader$Params;->appScopeKey:Ljava/lang/String;

    iput-object p2, p0, Lexpo/modules/apploader/HeadlessAppLoader$Params;->appUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAppScopeKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/apploader/HeadlessAppLoader$Params;->appScopeKey:Ljava/lang/String;

    return-object v0
.end method

.method public getAppUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lexpo/modules/apploader/HeadlessAppLoader$Params;->appUrl:Ljava/lang/String;

    return-object v0
.end method
