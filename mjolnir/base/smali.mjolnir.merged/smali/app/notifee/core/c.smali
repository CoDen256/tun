.class public Lapp/notifee/core/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public static a(Lapp/notifee/core/model/NotificationAndroidModel;Lapp/notifee/core/model/NotificationModel;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 368
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 369
    new-instance v1, Landroidx/core/app/NotificationCompat$Builder;

    .line 370
    sget-object v2, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 371
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getChannelId()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 372
    iget-object v2, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    const-string v3, "data"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 373
    invoke-virtual {v2}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    goto :goto_0

    .line 374
    :cond_0
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 375
    :goto_0
    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    const-string v2, "notification"

    .line 377
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Landroid/os/Bundle;

    .line 381
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-string v6, "app.notifee.core.ReceiverService.DELETE_INTENT"

    .line 382
    invoke-static {v6, v3, v5}, Lapp/notifee/core/ReceiverService;->a(Ljava/lang/String;[Ljava/lang/String;[Landroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v3

    .line 383
    invoke-virtual {v1, v3}, Landroidx/core/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    const-string v3, "pressAction"

    .line 389
    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v5, v3, [Landroid/os/Bundle;

    .line 393
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object v6

    aput-object v6, v5, v7

    .line 394
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getPressAction()Landroid/os/Bundle;

    move-result-object v6

    aput-object v6, v5, v4

    const-string v6, "app.notifee.core.ReceiverService.PRESS_INTENT"

    .line 395
    invoke-static {v6, v2, v5}, Lapp/notifee/core/ReceiverService;->a(Ljava/lang/String;[Ljava/lang/String;[Landroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v2

    .line 396
    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 397
    iget-object v2, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    const-string/jumbo v5, "title"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 398
    iget-object v2, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 399
    invoke-static {v2, v7}, Landroidx/core/text/HtmlCompat;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v2

    .line 400
    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 401
    :cond_1
    iget-object v2, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    const-string v5, "subtitle"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 402
    iget-object v2, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 403
    invoke-static {v2, v7}, Landroidx/core/text/HtmlCompat;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v2

    .line 404
    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 405
    :cond_2
    iget-object v2, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    const-string v5, "body"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 406
    iget-object p1, p1, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 407
    invoke-static {p1, v7}, Landroidx/core/text/HtmlCompat;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p1

    .line 408
    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 411
    :cond_3
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getBadgeIconType()Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 412
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getBadgeIconType()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setBadgeIconType(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 415
    :cond_4
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getCategory()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 416
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getCategory()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 419
    :cond_5
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getColor()Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 420
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getColor()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 423
    :cond_6
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getColorized()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setColorized(Z)Landroidx/core/app/NotificationCompat$Builder;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt p1, v2, :cond_7

    .line 426
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getChronometerCountDown()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setChronometerCountDown(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 429
    :cond_7
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getGroup()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_8

    .line 430
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getGroup()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setGroup(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 433
    :cond_8
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getGroupAlertBehaviour()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setGroupAlertBehavior(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 434
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getGroupSummary()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setGroupSummary(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 436
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getInputHistory()[Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_9

    .line 437
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getInputHistory()[Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setRemoteInputHistory([Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 440
    :cond_9
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getLights()Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_a

    .line 441
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getLights()Ljava/util/ArrayList;

    move-result-object p1

    .line 442
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, v2, v4, p1}, Landroidx/core/app/NotificationCompat$Builder;->setLights(III)Landroidx/core/app/NotificationCompat$Builder;

    .line 445
    :cond_a
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getLocalOnly()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setLocalOnly(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 447
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getNumber()Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_b

    .line 448
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getNumber()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setNumber(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 451
    :cond_b
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSound()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_d

    .line 452
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSound()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ln/o/t/i/f/e/e/k;->c(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_c

    .line 454
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 455
    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_1

    .line 457
    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to retrieve sound for notification, sound was specified as: "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 460
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSound()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "NotificationManager"

    .line 461
    invoke-static {v2, p1}, Lapp/notifee/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    :cond_d
    :goto_1
    invoke-virtual {p0, v0}, Lapp/notifee/core/model/NotificationAndroidModel;->getDefaults(Ljava/lang/Boolean;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 469
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getOngoing()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setOngoing(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 470
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getOnlyAlertOnce()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 471
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getPriority()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 473
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getProgress()Lapp/notifee/core/model/NotificationAndroidModel$a;

    move-result-object p1

    if-eqz p1, :cond_e

    .line 474
    iget v0, p1, Lapp/notifee/core/model/NotificationAndroidModel$a;->a:I

    .line 475
    iget v2, p1, Lapp/notifee/core/model/NotificationAndroidModel$a;->b:I

    .line 476
    iget-boolean p1, p1, Lapp/notifee/core/model/NotificationAndroidModel$a;->c:Z

    .line 477
    invoke-virtual {v1, v0, v2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setProgress(IIZ)Landroidx/core/app/NotificationCompat$Builder;

    .line 481
    :cond_e
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getShortcutId()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 482
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getShortcutId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setShortcutId(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 485
    :cond_f
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getShowTimestamp()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setShowWhen(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 487
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSmallIcon()Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 489
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSmallIconLevel()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 491
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(II)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_2

    .line 493
    :cond_10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 497
    :cond_11
    :goto_2
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSortKey()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_12

    .line 498
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getSortKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setSortKey(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 501
    :cond_12
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getTicker()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_13

    .line 502
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getTicker()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 505
    :cond_13
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getTimeoutAfter()Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 506
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getTimeoutAfter()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setTimeoutAfter(J)Landroidx/core/app/NotificationCompat$Builder;

    .line 509
    :cond_14
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getShowChronometer()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setUsesChronometer(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 511
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getVibrationPattern()[J

    move-result-object p1

    .line 512
    array-length v0, p1

    if-lez v0, :cond_15

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setVibrate([J)Landroidx/core/app/NotificationCompat$Builder;

    .line 514
    :cond_15
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getVisibility()I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/core/app/NotificationCompat$Builder;->setVisibility(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 516
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getTimestamp()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long p1, v2, v4

    if-lez p1, :cond_16

    .line 517
    invoke-virtual {v1, v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    .line 519
    :cond_16
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getAutoCancel()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-virtual {v1, p0}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    return-object v1
.end method

.method public static a(Lapp/notifee/core/model/NotificationAndroidModel;Lapp/notifee/core/model/NotificationModel;Lcom/google/android/gms/tasks/Task;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 580
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/core/app/NotificationCompat$Builder;

    .line 581
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->hasFullScreenAction()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 583
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getFullScreenAction()Lapp/notifee/core/model/NotificationAndroidPressActionModel;

    move-result-object p0

    .line 585
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivity()Ljava/lang/String;

    move-result-object v0

    .line 586
    invoke-static {v0}, Ln/o/t/i/f/e/e/g;->a(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    if-nez v1, :cond_0

    new-array p0, v2, [Ljava/lang/Object;

    const/4 p1, 0x0

    aput-object v0, p0, p1

    const-string p1, "Launch Activity for full-screen action does not exist (\'%s\')."

    .line 590
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "NotificationManager"

    .line 591
    invoke-static {p1, p0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    .line 599
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 600
    sget-object v3, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 601
    invoke-direct {v0, v3, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 602
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivityFlags()I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 603
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getLaunchActivityFlags()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 606
    :cond_1
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getMainComponent()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 607
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getMainComponent()Ljava/lang/String;

    move-result-object v1

    const-string v3, "mainComponent"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 608
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string v3, "notification"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 609
    new-instance v1, Ln/o/t/i/f/e/e/h;

    .line 610
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->getMainComponent()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ln/o/t/i/f/e/e/h;-><init>(Ljava/lang/String;)V

    .line 611
    invoke-static {v1}, Ln/o/t/i/f/e/e/e;->b(Ljava/lang/Object;)V

    .line 612
    :cond_2
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 613
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->a()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/high16 v1, 0xa000000

    .line 614
    invoke-static {p0, p1, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 619
    invoke-virtual {p2, p0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroidx/core/app/NotificationCompat$Builder;

    :cond_3
    return-object p2
.end method

.method public static a(Lapp/notifee/core/model/NotificationAndroidModel;Lcom/google/android/gms/tasks/Task;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "NotificationManager"

    .line 520
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/core/app/NotificationCompat$Builder;

    .line 522
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->hasLargeIcon()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 523
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getLargeIcon()Ljava/lang/String;

    move-result-object v1

    .line 528
    :try_start_0
    invoke-static {v1}, Ln/o/t/i/f/e/e/k;->a(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0xa

    invoke-static {v2, v4, v5, v3}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 535
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "An error occurred whilst trying to retrieve a largeIcon image: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :catch_1
    move-exception v2

    .line 536
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Timeout occurred whilst trying to retrieve a largeIcon image: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_0
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_2

    .line 548
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getCircularLargeIcon()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 549
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    .line 550
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    const/4 v1, 0x0

    if-le p0, v0, :cond_0

    .line 553
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    sub-int/2addr p0, v0

    .line 554
    div-int/lit8 p0, p0, 0x2

    add-int v4, p0, v0

    .line 556
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, p0, v1, v4, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 557
    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0, v1, v1, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 558
    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    goto :goto_2

    .line 560
    :cond_0
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    sub-int/2addr v0, p0

    .line 561
    div-int/lit8 v0, v0, 0x2

    add-int v4, v0, p0

    .line 563
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v1, v0, p0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 564
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v1, p0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 565
    div-int/lit8 p0, p0, 0x2

    int-to-float p0, p0

    move-object v8, v0

    move v0, p0

    move-object p0, v8

    .line 568
    :goto_2
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 571
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    const/4 v7, 0x1

    .line 573
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 574
    invoke-virtual {v4, v1, v1, v1, v1}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    const/high16 v1, -0x10000

    .line 575
    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 576
    invoke-virtual {v4, v0, v0, v0, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 577
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 578
    invoke-virtual {v4, v2, v5, p0, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    move-object v2, v3

    .line 579
    :cond_1
    invoke-virtual {p1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_2
    return-object p1
.end method

.method public static a()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;"
        }
    .end annotation

    .line 815
    new-instance v0, Lapp/notifee/core/c$$ExternalSyntheticLambda12;

    invoke-direct {v0}, Lapp/notifee/core/c$$ExternalSyntheticLambda12;-><init>()V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public static a(I)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 620
    new-instance v0, Lapp/notifee/core/c$$ExternalSyntheticLambda16;

    invoke-direct {v0, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda16;-><init>(I)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    sget-object v1, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lapp/notifee/core/c$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda1;-><init>(I)V

    .line 641
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(ILjava/util/List;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 645
    new-instance v0, Lapp/notifee/core/c$$ExternalSyntheticLambda9;

    invoke-direct {v0, p1, p0, p2}, Lapp/notifee/core/c$$ExternalSyntheticLambda9;-><init>(Ljava/util/List;ILjava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    new-instance v0, Lapp/notifee/core/c$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0, p1}, Lapp/notifee/core/c$$ExternalSyntheticLambda10;-><init>(ILjava/util/List;)V

    .line 693
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroidx/work/Data;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 882
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ln/o/t/i/f/e/e/o;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 883
    iget-object v1, p2, Ln/o/t/i/f/e/e/o;->b:[B

    if-nez v1, :cond_1

    :cond_0
    const-string v1, "notification"

    .line 884
    invoke-virtual {p0, v1}, Landroidx/work/Data;->getByteArray(Ljava/lang/String;)[B

    move-result-object v1

    const-string p0, "NotificationManager"

    if-eqz v1, :cond_3

    const-string p1, "The trigger notification was created using an older version, please consider recreating the notification."

    .line 886
    invoke-static {p0, p1}, Lapp/notifee/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 901
    :cond_1
    invoke-static {v1}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object p0

    .line 902
    new-instance p1, Lapp/notifee/core/model/NotificationModel;

    invoke-direct {p1, p0}, Lapp/notifee/core/model/NotificationModel;-><init>(Landroid/os/Bundle;)V

    .line 903
    iget-object p0, p2, Ln/o/t/i/f/e/e/o;->c:[B

    if-eqz p0, :cond_2

    .line 904
    invoke-static {p0}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object v0

    .line 907
    :cond_2
    invoke-static {p1, v0}, Lapp/notifee/core/c;->b(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :cond_3
    const-string p2, "Attempted to handle doScheduledWork but no notification data was found."

    .line 908
    invoke-static {p0, p2}, Lapp/notifee/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 910
    invoke-static {}, Landroidx/work/ListenableWorker$Result;->success()Landroidx/work/ListenableWorker$Result;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static a(Lapp/notifee/core/model/NotificationModel;)Lcom/google/android/gms/tasks/Task;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/model/NotificationModel;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Landroidx/core/app/NotificationCompat$Builder;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    const-string v1, "android"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lapp/notifee/core/model/NotificationAndroidModel;->fromBundle(Landroid/os/Bundle;)Lapp/notifee/core/model/NotificationAndroidModel;

    move-result-object v0

    .line 47
    new-instance v1, Lapp/notifee/core/c$$ExternalSyntheticLambda3;

    invoke-direct {v1, v0, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda3;-><init>(Lapp/notifee/core/model/NotificationAndroidModel;Lapp/notifee/core/model/NotificationModel;)V

    .line 191
    new-instance v2, Lapp/notifee/core/c$$ExternalSyntheticLambda4;

    invoke-direct {v2, v0}, Lapp/notifee/core/c$$ExternalSyntheticLambda4;-><init>(Lapp/notifee/core/model/NotificationAndroidModel;)V

    .line 230
    new-instance v3, Lapp/notifee/core/c$$ExternalSyntheticLambda5;

    invoke-direct {v3, v0, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda5;-><init>(Lapp/notifee/core/model/NotificationAndroidModel;Lapp/notifee/core/model/NotificationModel;)V

    .line 276
    new-instance v4, Lapp/notifee/core/c$$ExternalSyntheticLambda6;

    invoke-direct {v4, v0, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda6;-><init>(Lapp/notifee/core/model/NotificationAndroidModel;Lapp/notifee/core/model/NotificationModel;)V

    .line 337
    new-instance p0, Lapp/notifee/core/c$$ExternalSyntheticLambda7;

    invoke-direct {p0, v0}, Lapp/notifee/core/c$$ExternalSyntheticLambda7;-><init>(Lapp/notifee/core/model/NotificationAndroidModel;)V

    sget-object v0, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    .line 359
    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    .line 361
    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    .line 363
    invoke-virtual {v1, v0, v4}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    .line 365
    invoke-virtual {v1, v0, p0}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    .line 367
    invoke-virtual {p0, v0, v3}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/model/NotificationModel;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    .line 730
    new-instance v1, Lapp/notifee/core/c$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda2;-><init>(Landroid/os/Bundle;Lapp/notifee/core/model/NotificationModel;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/util/List;ILjava/lang/String;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Landroidx/work/WorkManager;->getInstance(Landroid/content/Context;)Landroidx/work/WorkManager;

    move-result-object v0

    .line 3
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 4
    invoke-static {v1}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v1

    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 7
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Removing notification with id "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "NotificationManager"

    invoke-static {v6, v4}, Lapp/notifee/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x2

    if-eq p1, v4, :cond_2

    if-eqz p2, :cond_1

    const-string v4, "0"

    .line 12
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 17
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 19
    :catch_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "cancelAllNotificationsWithIds -> Failed to parse id as integer  "

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    if-eqz v3, :cond_1

    .line 25
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, p2, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    .line 30
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-virtual {v1, p2, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    :cond_2
    const/4 v3, 0x1

    if-eq p1, v3, :cond_0

    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lapp/notifee/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "trigger:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/work/WorkManager;->cancelUniqueWork(Ljava/lang/String;)Landroidx/work/Operation;

    .line 39
    invoke-virtual {v0}, Landroidx/work/WorkManager;->pruneWork()Landroidx/work/Operation;

    .line 40
    invoke-static {v2}, Lapp/notifee/core/b;->a(Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v2

    .line 41
    sget-object v3, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    const-string v4, "alarm"

    .line 42
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/AlarmManager;

    if-eqz v2, :cond_0

    .line 43
    invoke-virtual {v3, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto/16 :goto_0

    :cond_3
    return-object v3
.end method

.method public static a(ILcom/google/android/gms/tasks/Task;)Ljava/lang/Void;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p1, 0x2

    if-eq p0, p1, :cond_0

    if-nez p0, :cond_1

    .line 642
    :cond_0
    invoke-static {}, Lapp/notifee/core/b;->a()Lcom/google/android/gms/tasks/Continuation;

    .line 643
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 644
    invoke-static {p0}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    move-result-object p0

    invoke-virtual {p0}, Lapp/notifee/core/database/a;->a()V

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(ILjava/util/List;Lcom/google/android/gms/tasks/Task;)Ljava/lang/Void;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p2, 0x1

    if-eq p0, p2, :cond_0

    .line 44
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 45
    invoke-static {p0}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    move-result-object p0

    invoke-virtual {p0, p1}, Lapp/notifee/core/database/a;->a(Ljava/util/List;)V

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroid/os/Bundle;Lapp/notifee/core/model/NotificationModel;)Ljava/lang/Void;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string/jumbo v0, "type"

    .line 731
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    double-to-int v0, v0

    const/4 v1, -0x1

    const-string v2, "Periodic"

    const-string v3, "id"

    const-string/jumbo v4, "workType"

    const/4 v5, 0x1

    const-string/jumbo v6, "trigger:"

    const-string/jumbo v7, "workRequestType"

    const-string v8, "app.notifee.core.NotificationManager.TRIGGER"

    if-eqz v0, :cond_3

    if-eq v0, v5, :cond_0

    goto/16 :goto_1

    .line 732
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 733
    sget-object v5, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 734
    invoke-static {v5}, Landroidx/work/WorkManager;->getInstance(Landroid/content/Context;)Landroidx/work/WorkManager;

    move-result-object v5

    .line 736
    new-instance v6, Landroidx/work/Data$Builder;

    invoke-direct {v6}, Landroidx/work/Data$Builder;-><init>()V

    .line 738
    invoke-virtual {v6, v4, v8}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v4

    .line 739
    invoke-virtual {v4, v7, v2}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v2

    .line 740
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v2

    .line 741
    sget-object v3, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 742
    invoke-static {v3}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    .line 743
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1, p0, v3}, Lapp/notifee/core/database/a;->a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;Ljava/lang/Boolean;)V

    const-string v3, "interval"

    .line 744
    invoke-virtual {p0, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 745
    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 746
    invoke-virtual {v1}, Ljava/lang/Double;->intValue()I

    move-result v1

    :cond_1
    int-to-long v3, v1

    .line 747
    new-instance v1, Landroidx/work/PeriodicWorkRequest$Builder;

    const-class v6, Lapp/notifee/core/Worker;

    .line 748
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-string/jumbo v9, "timeUnit"

    .line 749
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 750
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 752
    :try_start_0
    invoke-static {p0}, Ljava/util/concurrent/TimeUnit;->valueOf(Ljava/lang/String;)Ljava/util/concurrent/TimeUnit;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v9

    .line 754
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "An error occurred whilst trying to convert interval time unit: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v10, "IntervalTriggerModel"

    invoke-static {v10, p0, v9}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 755
    :cond_2
    :goto_0
    invoke-direct {v1, v6, v3, v4, v7}, Landroidx/work/PeriodicWorkRequest$Builder;-><init>(Ljava/lang/Class;JLjava/util/concurrent/TimeUnit;)V

    .line 757
    invoke-virtual {v1, v8}, Landroidx/work/PeriodicWorkRequest$Builder;->addTag(Ljava/lang/String;)Landroidx/work/WorkRequest$Builder;

    .line 758
    invoke-virtual {v1, v0}, Landroidx/work/PeriodicWorkRequest$Builder;->addTag(Ljava/lang/String;)Landroidx/work/WorkRequest$Builder;

    .line 759
    invoke-virtual {v2}, Landroidx/work/Data$Builder;->build()Landroidx/work/Data;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroidx/work/PeriodicWorkRequest$Builder;->setInputData(Landroidx/work/Data;)Landroidx/work/WorkRequest$Builder;

    .line 760
    sget-object p0, Landroidx/work/ExistingPeriodicWorkPolicy;->REPLACE:Landroidx/work/ExistingPeriodicWorkPolicy;

    .line 761
    invoke-virtual {v1}, Landroidx/work/PeriodicWorkRequest$Builder;->build()Landroidx/work/WorkRequest;

    move-result-object v1

    check-cast v1, Landroidx/work/PeriodicWorkRequest;

    .line 762
    invoke-virtual {v5, v0, p0, v1}, Landroidx/work/WorkManager;->enqueueUniquePeriodicWork(Ljava/lang/String;Landroidx/work/ExistingPeriodicWorkPolicy;Landroidx/work/PeriodicWorkRequest;)Landroidx/work/Operation;

    goto/16 :goto_1

    .line 763
    :cond_3
    new-instance v0, Ln/o/t/i/f/e/e/l;

    invoke-direct {v0, p0}, Ln/o/t/i/f/e/e/l;-><init>(Landroid/os/Bundle;)V

    .line 764
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 765
    iget-object v9, v0, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    const-string/jumbo v10, "timestamp"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v9

    const-wide/16 v11, 0x0

    if-eqz v9, :cond_4

    .line 766
    iget-object v9, v0, Ln/o/t/i/f/e/e/l;->a:Landroid/os/Bundle;

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getDouble(Ljava/lang/String;)D

    move-result-wide v9

    double-to-long v9, v9

    cmp-long v13, v9, v11

    if-lez v13, :cond_4

    .line 768
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long/2addr v9, v11

    const-wide/16 v11, 0x3e8

    div-long/2addr v9, v11

    long-to-float v9, v9

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    int-to-long v11, v9

    .line 769
    :cond_4
    iget v9, v0, Ln/o/t/i/f/e/e/l;->b:I

    .line 770
    new-instance v10, Landroidx/work/Data$Builder;

    invoke-direct {v10}, Landroidx/work/Data$Builder;-><init>()V

    .line 772
    invoke-virtual {v10, v4, v8}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v4

    .line 773
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->b()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v3, v10}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v3

    .line 774
    iget-object v4, v0, Ln/o/t/i/f/e/e/l;->d:Ljava/lang/Boolean;

    .line 775
    sget-object v10, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 776
    invoke-static {v10}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    .line 777
    invoke-static {p1, p0, v4}, Lapp/notifee/core/database/a;->a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;Ljava/lang/Boolean;)V

    .line 780
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_5

    .line 781
    invoke-static {p1, v0, v5}, Lapp/notifee/core/b;->a(Lapp/notifee/core/model/NotificationModel;Ln/o/t/i/f/e/e/l;Z)V

    goto :goto_1

    .line 782
    :cond_5
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 783
    invoke-static {p0}, Landroidx/work/WorkManager;->getInstance(Landroid/content/Context;)Landroidx/work/WorkManager;

    move-result-object p0

    if-ne v9, v1, :cond_6

    .line 787
    new-instance v0, Landroidx/work/OneTimeWorkRequest$Builder;

    const-class v1, Lapp/notifee/core/Worker;

    invoke-direct {v0, v1}, Landroidx/work/OneTimeWorkRequest$Builder;-><init>(Ljava/lang/Class;)V

    .line 788
    invoke-virtual {v0, v8}, Landroidx/work/OneTimeWorkRequest$Builder;->addTag(Ljava/lang/String;)Landroidx/work/WorkRequest$Builder;

    .line 789
    invoke-virtual {v0, v6}, Landroidx/work/OneTimeWorkRequest$Builder;->addTag(Ljava/lang/String;)Landroidx/work/WorkRequest$Builder;

    const-string v1, "OneTime"

    .line 790
    invoke-virtual {v3, v7, v1}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    .line 791
    invoke-virtual {v3}, Landroidx/work/Data$Builder;->build()Landroidx/work/Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/work/OneTimeWorkRequest$Builder;->setInputData(Landroidx/work/Data;)Landroidx/work/WorkRequest$Builder;

    .line 792
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v11, v12, v1}, Landroidx/work/OneTimeWorkRequest$Builder;->setInitialDelay(JLjava/util/concurrent/TimeUnit;)Landroidx/work/WorkRequest$Builder;

    .line 793
    sget-object v1, Landroidx/work/ExistingWorkPolicy;->REPLACE:Landroidx/work/ExistingWorkPolicy;

    .line 794
    invoke-virtual {v0}, Landroidx/work/OneTimeWorkRequest$Builder;->build()Landroidx/work/WorkRequest;

    move-result-object v0

    check-cast v0, Landroidx/work/OneTimeWorkRequest;

    .line 795
    invoke-virtual {p0, v6, v1, v0}, Landroidx/work/WorkManager;->enqueueUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Landroidx/work/OneTimeWorkRequest;)Landroidx/work/Operation;

    goto :goto_1

    .line 801
    :cond_6
    new-instance v1, Landroidx/work/PeriodicWorkRequest$Builder;

    .line 802
    iget v4, v0, Ln/o/t/i/f/e/e/l;->b:I

    int-to-long v4, v4

    .line 803
    iget-object v0, v0, Ln/o/t/i/f/e/e/l;->c:Ljava/util/concurrent/TimeUnit;

    .line 804
    const-class v9, Lapp/notifee/core/Worker;

    invoke-direct {v1, v9, v4, v5, v0}, Landroidx/work/PeriodicWorkRequest$Builder;-><init>(Ljava/lang/Class;JLjava/util/concurrent/TimeUnit;)V

    .line 806
    invoke-virtual {v1, v8}, Landroidx/work/PeriodicWorkRequest$Builder;->addTag(Ljava/lang/String;)Landroidx/work/WorkRequest$Builder;

    .line 807
    invoke-virtual {v1, v6}, Landroidx/work/PeriodicWorkRequest$Builder;->addTag(Ljava/lang/String;)Landroidx/work/WorkRequest$Builder;

    .line 808
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v11, v12, v0}, Landroidx/work/PeriodicWorkRequest$Builder;->setInitialDelay(JLjava/util/concurrent/TimeUnit;)Landroidx/work/WorkRequest$Builder;

    .line 809
    invoke-virtual {v3, v7, v2}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    .line 810
    invoke-virtual {v3}, Landroidx/work/Data$Builder;->build()Landroidx/work/Data;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/work/PeriodicWorkRequest$Builder;->setInputData(Landroidx/work/Data;)Landroidx/work/WorkRequest$Builder;

    .line 811
    sget-object v0, Landroidx/work/ExistingPeriodicWorkPolicy;->REPLACE:Landroidx/work/ExistingPeriodicWorkPolicy;

    .line 812
    invoke-virtual {v1}, Landroidx/work/PeriodicWorkRequest$Builder;->build()Landroidx/work/WorkRequest;

    move-result-object v1

    check-cast v1, Landroidx/work/PeriodicWorkRequest;

    .line 813
    invoke-virtual {p0, v6, v0, v1}, Landroidx/work/WorkManager;->enqueueUniquePeriodicWork(Ljava/lang/String;Landroidx/work/ExistingPeriodicWorkPolicy;Landroidx/work/PeriodicWorkRequest;)Landroidx/work/Operation;

    .line 814
    :goto_1
    new-instance p0, Lapp/notifee/core/event/NotificationEvent;

    const/4 v0, 0x7

    invoke-direct {p0, v0, p1}, Lapp/notifee/core/event/NotificationEvent;-><init>(ILapp/notifee/core/model/NotificationModel;)V

    invoke-static {p0}, Ln/o/t/i/f/e/e/e;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;Lcom/google/android/gms/tasks/Task;)Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 694
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/core/app/NotificationCompat$Builder;

    .line 697
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 698
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "notifee.notification"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v1, "notifee.trigger"

    .line 700
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 702
    :cond_0
    invoke-virtual {p2, v0}, Landroidx/core/app/NotificationCompat$Builder;->addExtras(Landroid/os/Bundle;)Landroidx/core/app/NotificationCompat$Builder;

    .line 705
    invoke-virtual {p2}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    .line 707
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationModel;->a()Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 708
    iget-object v0, p0, Lapp/notifee/core/model/NotificationModel;->a:Landroid/os/Bundle;

    const-string v1, "android"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lapp/notifee/core/model/NotificationAndroidModel;->fromBundle(Landroid/os/Bundle;)Lapp/notifee/core/model/NotificationAndroidModel;

    move-result-object v0

    .line 709
    invoke-virtual {v0}, Lapp/notifee/core/model/NotificationAndroidModel;->getAsForegroundService()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 710
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lapp/notifee/core/ForegroundService;->a:Ljava/lang/String;

    .line 711
    new-instance v1, Landroid/content/Intent;

    .line 712
    sget-object v2, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 713
    const-class v3, Lapp/notifee/core/ForegroundService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "app.notifee.core.ForegroundService.START"

    .line 714
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "hashCode"

    .line 715
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p2, "notification"

    .line 716
    invoke-virtual {v1, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "notificationBundle"

    .line 717
    invoke-virtual {v1, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1a

    if-lt p1, p2, :cond_1

    .line 720
    sget-object p1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 721
    invoke-static {p1, v1}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 722
    :cond_1
    sget-object p1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 723
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 724
    :cond_2
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 725
    invoke-static {v1}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v1

    .line 726
    invoke-virtual {v0}, Lapp/notifee/core/model/NotificationAndroidModel;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0, p2, p1}, Landroidx/core/app/NotificationManagerCompat;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 729
    :goto_0
    new-instance p1, Lapp/notifee/core/event/NotificationEvent;

    const/4 p2, 0x3

    invoke-direct {p1, p2, p0}, Lapp/notifee/core/event/NotificationEvent;-><init>(ILapp/notifee/core/model/NotificationModel;)V

    invoke-static {p1}, Ln/o/t/i/f/e/e/e;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/work/Data;Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 911
    invoke-static {}, Landroidx/work/ListenableWorker$Result;->success()Landroidx/work/ListenableWorker$Result;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 913
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result p0

    if-nez p0, :cond_0

    .line 914
    invoke-virtual {p3}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    const-string p1, "NotificationManager"

    const-string p2, "Failed to display notification"

    invoke-static {p1, p2, p0}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :cond_0
    const-string/jumbo p0, "workRequestType"

    .line 916
    invoke-virtual {p1, p0}, Landroidx/work/Data;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    const-string p1, "OneTime"

    .line 918
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 919
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 920
    invoke-static {p0}, Lapp/notifee/core/database/a;->a(Landroid/content/Context;)Lapp/notifee/core/database/a;

    move-result-object p0

    invoke-virtual {p0, p2}, Lapp/notifee/core/database/a;->a(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static a(Landroidx/work/Data;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/Data;",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/work/ListenableWorker$Result;",
            ">;)V"
        }
    .end annotation

    const-string v0, "id"

    .line 835
    invoke-virtual {p0, v0}, Landroidx/work/Data;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 837
    new-instance v1, Lapp/notifee/core/database/a;

    .line 838
    sget-object v2, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 839
    invoke-direct {v1, v2}, Lapp/notifee/core/database/a;-><init>(Landroid/content/Context;)V

    .line 841
    new-instance v2, Lapp/notifee/core/c$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0, p1}, Lapp/notifee/core/c$$ExternalSyntheticLambda14;-><init>(Landroidx/work/Data;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 879
    invoke-virtual {v1, v0}, Lapp/notifee/core/database/a;->b(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    sget-object v3, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    .line 880
    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lapp/notifee/core/c$$ExternalSyntheticLambda15;

    invoke-direct {v2, p1, p0, v0}, Lapp/notifee/core/c$$ExternalSyntheticLambda15;-><init>(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/work/Data;Ljava/lang/String;)V

    .line 881
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public static a(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 816
    new-instance v0, Lapp/notifee/core/database/a;

    .line 817
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 818
    invoke-direct {v0, v1}, Lapp/notifee/core/database/a;-><init>(Landroid/content/Context;)V

    .line 821
    invoke-virtual {v0}, Lapp/notifee/core/database/a;->b()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lapp/notifee/core/c$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda8;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 822
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public static a(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 823
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 825
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 826
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 827
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln/o/t/i/f/e/e/o;

    .line 828
    iget-object v1, v1, Ln/o/t/i/f/e/e/o;->a:Ljava/lang/String;

    .line 829
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 832
    :cond_0
    invoke-interface {p0, v2, v0}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_1

    .line 834
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v2}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public static b(Lapp/notifee/core/model/NotificationAndroidModel;Lapp/notifee/core/model/NotificationModel;Lcom/google/android/gms/tasks/Task;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "NotificationManager"

    .line 14
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/core/app/NotificationCompat$Builder;

    .line 15
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getActions()Ljava/util/ArrayList;

    move-result-object p0

    if-nez p0, :cond_0

    return-object p2

    .line 21
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/notifee/core/model/NotificationAndroidActionModel;

    const-string v2, "notification"

    const-string v3, "pressAction"

    .line 22
    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/os/Bundle;

    .line 26
    invoke-virtual {p1}, Lapp/notifee/core/model/NotificationModel;->toBundle()Landroid/os/Bundle;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 27
    invoke-virtual {v1}, Lapp/notifee/core/model/NotificationAndroidActionModel;->getPressAction()Lapp/notifee/core/model/NotificationAndroidPressActionModel;

    move-result-object v4

    invoke-virtual {v4}, Lapp/notifee/core/model/NotificationAndroidPressActionModel;->toBundle()Landroid/os/Bundle;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "app.notifee.core.ReceiverService.ACTION_PRESS_INTENT"

    .line 28
    invoke-static {v4, v2, v3}, Lapp/notifee/core/ReceiverService;->a(Ljava/lang/String;[Ljava/lang/String;[Landroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v2

    .line 34
    invoke-virtual {v1}, Lapp/notifee/core/model/NotificationAndroidActionModel;->getIcon()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 41
    :try_start_0
    invoke-virtual {v1}, Lapp/notifee/core/model/NotificationAndroidActionModel;->getIcon()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ln/o/t/i/f/e/e/k;->a(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v6

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v8, 0xa

    .line 42
    invoke-static {v6, v8, v9, v7}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v6

    .line 50
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "An error occurred whilst trying to retrieve an action icon: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v6}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    :catch_1
    move-exception v6

    .line 51
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Timeout occurred whilst trying to retrieve an action icon: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v6}, Lapp/notifee/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_1
    :goto_1
    move-object v6, v4

    :goto_2
    if-eqz v6, :cond_2

    .line 61
    invoke-static {v6}, Landroidx/core/graphics/drawable/IconCompat;->createWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v4

    .line 64
    :cond_2
    new-instance v3, Landroidx/core/app/NotificationCompat$Action$Builder;

    .line 66
    invoke-virtual {v1}, Lapp/notifee/core/model/NotificationAndroidActionModel;->getTitle()Ljava/lang/String;

    move-result-object v6

    .line 67
    invoke-static {v6, v5}, Landroidx/core/text/HtmlCompat;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v5

    .line 68
    invoke-direct {v3, v4, v5, v2}, Landroidx/core/app/NotificationCompat$Action$Builder;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 70
    invoke-virtual {v1, v3}, Lapp/notifee/core/model/NotificationAndroidActionModel;->getRemoteInput(Landroidx/core/app/NotificationCompat$Action$Builder;)Landroidx/core/app/RemoteInput;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 72
    invoke-virtual {v3, v1}, Landroidx/core/app/NotificationCompat$Action$Builder;->addRemoteInput(Landroidx/core/app/RemoteInput;)Landroidx/core/app/NotificationCompat$Action$Builder;

    .line 75
    :cond_3
    invoke-virtual {v3}, Landroidx/core/app/NotificationCompat$Action$Builder;->build()Landroidx/core/app/NotificationCompat$Action;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroidx/core/app/NotificationCompat$Builder;->addAction(Landroidx/core/app/NotificationCompat$Action;)Landroidx/core/app/NotificationCompat$Builder;

    goto/16 :goto_0

    :cond_4
    return-object p2
.end method

.method public static synthetic b(Lapp/notifee/core/model/NotificationAndroidModel;Lcom/google/android/gms/tasks/Task;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 76
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/core/app/NotificationCompat$Builder;

    .line 77
    invoke-virtual {p0}, Lapp/notifee/core/model/NotificationAndroidModel;->getStyle()Lapp/notifee/core/model/NotificationAndroidStyleModel;

    move-result-object p0

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    sget-object v0, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    .line 83
    invoke-virtual {p0, v0}, Lapp/notifee/core/model/NotificationAndroidStyleModel;->getStyleTask(Ljava/util/concurrent/Executor;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    if-nez p0, :cond_1

    return-object p1

    .line 88
    :cond_1
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/core/app/NotificationCompat$Style;

    if-eqz p0, :cond_2

    .line 90
    invoke-virtual {p1, p0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_2
    return-object p1
.end method

.method public static b(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/model/NotificationModel;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 91
    invoke-static {p0}, Lapp/notifee/core/c;->a(Lapp/notifee/core/model/NotificationModel;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    sget-object v1, Lapp/notifee/core/c;->a:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lapp/notifee/core/c$$ExternalSyntheticLambda11;

    invoke-direct {v2, p0, p1}, Lapp/notifee/core/c$$ExternalSyntheticLambda11;-><init>(Lapp/notifee/core/model/NotificationModel;Landroid/os/Bundle;)V

    .line 92
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public static b(I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 2
    invoke-static {v0}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;

    move-result-object v0

    const/4 v1, 0x1

    if-eq p0, v1, :cond_0

    if-nez p0, :cond_1

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroidx/core/app/NotificationManagerCompat;->cancelAll()V

    :cond_1
    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    if-nez p0, :cond_3

    .line 7
    :cond_2
    sget-object p0, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 8
    invoke-static {p0}, Landroidx/work/WorkManager;->getInstance(Landroid/content/Context;)Landroidx/work/WorkManager;

    move-result-object p0

    const-string v0, "app.notifee.core.NotificationManager.TRIGGER"

    .line 9
    invoke-virtual {p0, v0}, Landroidx/work/WorkManager;->cancelAllWorkByTag(Ljava/lang/String;)Landroidx/work/Operation;

    .line 13
    invoke-virtual {p0}, Landroidx/work/WorkManager;->pruneWork()Landroidx/work/Operation;

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b()Ljava/util/List;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 96
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    const-string v2, "notification"

    .line 97
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 99
    invoke-virtual {v1}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object v1

    .line 101
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_6

    aget-object v5, v1, v4

    .line 102
    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v6

    .line 104
    iget-object v7, v6, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    .line 105
    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    const-string v9, "notifee.notification"

    .line 107
    invoke-virtual {v7, v9}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v9

    const-string v10, "notifee.trigger"

    .line 108
    invoke-virtual {v7, v10}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v10

    const-string v11, "id"

    const-string v12, ""

    if-nez v9, :cond_4

    .line 111
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 112
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v11, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "android.title"

    .line 114
    invoke-virtual {v7, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_0

    .line 117
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    const-string/jumbo v14, "title"

    invoke-virtual {v9, v14, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v13, "android.text"

    .line 120
    invoke-virtual {v7, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_1

    .line 123
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "body"

    invoke-virtual {v9, v14, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v13, "android.subText"

    .line 126
    invoke-virtual {v7, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 129
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v13, "subtitle"

    invoke-virtual {v9, v13, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :cond_2
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x1a

    if-lt v13, v14, :cond_3

    .line 134
    invoke-static {v6}, Lapp/notifee/core/a$$ExternalSyntheticApiModelOutline1;->m(Landroid/app/Notification;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "channelId"

    invoke-virtual {v7, v14, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    :cond_3
    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getTag()Ljava/lang/String;

    move-result-object v13

    const-string/jumbo v14, "tag"

    invoke-virtual {v7, v14, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-virtual {v6}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v6

    const-string v13, "group"

    invoke-virtual {v7, v13, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "android"

    .line 139
    invoke-virtual {v9, v6, v7}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 141
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v11, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 143
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v11}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v11, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    if-eqz v10, :cond_5

    const-string/jumbo v6, "trigger"

    .line 147
    invoke-virtual {v8, v6, v10}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 150
    :cond_5
    invoke-virtual {v8, v2, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 151
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v9

    invoke-virtual {v6, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "date"

    invoke-virtual {v8, v6, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_6
    return-object v0
.end method

.method public static b(Lapp/notifee/core/interfaces/MethodCallResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lapp/notifee/core/interfaces/MethodCallResult<",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;>;)V"
        }
    .end annotation

    .line 154
    new-instance v0, Lapp/notifee/core/database/a;

    .line 155
    sget-object v1, Ln/o/t/i/f/e/e/d;->a:Landroid/content/Context;

    .line 156
    invoke-direct {v0, v1}, Lapp/notifee/core/database/a;-><init>(Landroid/content/Context;)V

    .line 159
    invoke-virtual {v0}, Lapp/notifee/core/database/a;->b()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lapp/notifee/core/c$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lapp/notifee/core/c$$ExternalSyntheticLambda13;-><init>(Lapp/notifee/core/interfaces/MethodCallResult;)V

    .line 160
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public static b(Lapp/notifee/core/interfaces/MethodCallResult;Lcom/google/android/gms/tasks/Task;)V
    .locals 5

    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 163
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 164
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 165
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln/o/t/i/f/e/e/o;

    .line 166
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 169
    iget-object v3, v1, Ln/o/t/i/f/e/e/o;->b:[B

    .line 170
    invoke-static {v3}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "notification"

    .line 171
    invoke-virtual {v2, v4, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 175
    iget-object v1, v1, Ln/o/t/i/f/e/e/o;->c:[B

    .line 176
    invoke-static {v1}, Ln/o/t/i/f/e/e/i;->a([B)Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v3, "trigger"

    .line 177
    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 179
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 182
    invoke-interface {p0, p1, v0}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_1

    .line 184
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-interface {p0, p1, v0}, Lapp/notifee/core/interfaces/MethodCallResult;->onComplete(Ljava/lang/Exception;Ljava/lang/Object;)V

    :goto_1
    return-void
.end method
