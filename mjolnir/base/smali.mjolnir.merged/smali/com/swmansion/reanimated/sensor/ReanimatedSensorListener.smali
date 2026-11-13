.class public Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;
.super Ljava/lang/Object;
.source "ReanimatedSensorListener.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field private final display:Landroid/view/Display;

.field private final interval:D

.field private lastRead:D

.field private orientation:[F

.field private quaternion:[F

.field private rotation:[F

.field private setter:Lcom/swmansion/reanimated/nativeProxy/SensorSetter;


# direct methods
.method constructor <init>(Lcom/swmansion/reanimated/nativeProxy/SensorSetter;DLandroid/view/Display;)V
    .locals 2

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->lastRead:D

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->rotation:[F

    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->orientation:[F

    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->quaternion:[F

    iput-object p1, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->setter:Lcom/swmansion/reanimated/nativeProxy/SensorSetter;

    iput-wide p2, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->interval:D

    iput-object p4, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->display:Landroid/view/Display;

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 8

    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-double v0, v0

    iget-wide v2, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->lastRead:D

    sub-double v2, v0, v2

    iget-wide v4, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->interval:D

    cmpg-double v2, v2, v4

    if-gez v2, :cond_0

    return-void

    .line 35
    :cond_0
    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    iput-wide v0, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->lastRead:D

    iget-object v0, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->display:Landroid/view/Display;

    .line 39
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    const/4 v1, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-eq v0, v4, :cond_3

    if-eq v0, v5, :cond_2

    if-eq v0, v1, :cond_1

    move v0, v3

    goto :goto_0

    :cond_1
    const/16 v0, 0x10e

    goto :goto_0

    :cond_2
    const/16 v0, 0xb4

    goto :goto_0

    :cond_3
    const/16 v0, 0x5a

    :goto_0
    if-eq v2, v5, :cond_4

    const/4 v6, 0x4

    if-eq v2, v6, :cond_4

    packed-switch v2, :pswitch_data_0

    .line 90
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "[Reanimated] Unknown sensor type."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    iget-object v2, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->quaternion:[F

    .line 57
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-static {v2, v7}, Landroid/hardware/SensorManager;->getQuaternionFromVector([F[F)V

    iget-object v2, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->rotation:[F

    .line 58
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-static {v2, p1}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    iget-object p1, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->rotation:[F

    iget-object v2, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->orientation:[F

    .line 59
    invoke-static {p1, v2}, Landroid/hardware/SensorManager;->getOrientation([F[F)[F

    const/4 p1, 0x7

    new-array p1, p1, [F

    iget-object v2, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->quaternion:[F

    .line 60
    aget v7, v2, v4

    aput v7, p1, v3

    aget v7, v2, v1

    aput v7, p1, v4

    aget v7, v2, v5

    neg-float v7, v7

    aput v7, p1, v5

    aget v2, v2, v3

    aput v2, p1, v1

    iget-object v1, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->orientation:[F

    aget v2, v1, v3

    neg-float v2, v2

    aput v2, p1, v6

    aget v2, v1, v4

    neg-float v2, v2

    const/4 v3, 0x5

    aput v2, p1, v3

    const/4 v2, 0x6

    aget v1, v1, v5

    aput v1, p1, v2

    iget-object v1, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->setter:Lcom/swmansion/reanimated/nativeProxy/SensorSetter;

    .line 72
    invoke-virtual {v1, p1, v0}, Lcom/swmansion/reanimated/nativeProxy/SensorSetter;->sensorSetter([FI)V

    goto :goto_1

    :pswitch_1
    new-array v1, v1, [F

    .line 85
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    neg-float v2, v2

    aput v2, v1, v3

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v4

    neg-float v2, v2

    aput v2, v1, v4

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v5

    neg-float p1, p1

    aput p1, v1, v5

    iget-object p1, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->setter:Lcom/swmansion/reanimated/nativeProxy/SensorSetter;

    .line 86
    invoke-virtual {p1, v1, v0}, Lcom/swmansion/reanimated/nativeProxy/SensorSetter;->sensorSetter([FI)V

    goto :goto_1

    :cond_4
    new-array v1, v1, [F

    .line 78
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    aput v2, v1, v3

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v4

    aput v2, v1, v4

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v5

    aput p1, v1, v5

    iget-object p1, p0, Lcom/swmansion/reanimated/sensor/ReanimatedSensorListener;->setter:Lcom/swmansion/reanimated/nativeProxy/SensorSetter;

    .line 79
    invoke-virtual {p1, v1, v0}, Lcom/swmansion/reanimated/nativeProxy/SensorSetter;->sensorSetter([FI)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
