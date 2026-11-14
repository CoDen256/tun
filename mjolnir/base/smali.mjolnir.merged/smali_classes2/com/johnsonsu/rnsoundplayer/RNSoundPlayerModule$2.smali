.class Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule$2;
.super Ljava/lang/Object;
.source "RNSoundPlayerModule.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;->initializeMediaPlayer(Landroid/net/Uri;)Landroid/media/MediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;


# direct methods
.method constructor <init>(Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;)V
    .locals 0

    iput-object p1, p0, Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule$2;->this$0:Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 3

    .line 249
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    const-string v0, "success"

    const/4 v1, 0x1

    .line 250
    invoke-interface {p1, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule$2;->this$0:Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;

    .line 251
    invoke-static {v0}, Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;->access$100(Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;)Lcom/facebook/react/bridge/ReactApplicationContext;

    move-result-object v1

    const-string v2, "FinishedPlaying"

    invoke-static {v0, v1, v2, p1}, Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;->-$$Nest$msendEvent(Lcom/johnsonsu/rnsoundplayer/RNSoundPlayerModule;Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method
