.class public Ln/o/t/i/f/e/e/l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/os/Bundle;

.field public b:I

.field public c:Ljava/util/concurrent/TimeUnit;

.field public d:Ljava/lang/Boolean;

.field public e:Ljava/lang/Boolean;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Ln/o/t/i/f/e/e/l;->b:I

    const/4 v0, 0x0

    iput-object v0, p0, Ln/o/t/i/f/e/e/l;->c:Ljava/util/concurrent/TimeUnit;

    .line 4
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Ln/o/t/i/f/e/e/l;->d:Ljava/lang/Boolean;

    iput-object v1, p0, Ln/o/t/i/f/e/e/l;->e:Ljava/lang/Boolean;

    iput-object v0, p0, Ln/o/t/i/f/e/e/l;->f:Ljava/lang/String;

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    const-string v0, "repeatFrequency"

    .line 23
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    .line 24
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/Double;->intValue()I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x7

    iput p1, p0, Ln/o/t/i/f/e/e/l;->b:I

    .line 44
    sget-object p1, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->c:Ljava/util/concurrent/TimeUnit;

    const-string p1, "WEEKLY"

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->f:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iput v0, p0, Ln/o/t/i/f/e/e/l;->b:I

    .line 47
    sget-object p1, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->c:Ljava/util/concurrent/TimeUnit;

    const-string p1, "DAILY"

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->f:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iput v0, p0, Ln/o/t/i/f/e/e/l;->b:I

    .line 50
    sget-object p1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->c:Ljava/util/concurrent/TimeUnit;

    const-string p1, "HOURLY"

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->f:Ljava/lang/String;

    :cond_3
    :goto_0
    iget-object p1, p0, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    const-string v0, "alarmManager"

    .line 67
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 68
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->d:Ljava/lang/Boolean;

    iget-object p1, p0, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    .line 70
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "allowWhileIdle"

    .line 72
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 73
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Ln/o/t/i/f/e/e/l;->e:Ljava/lang/Boolean;

    :cond_4
    return-void
.end method
