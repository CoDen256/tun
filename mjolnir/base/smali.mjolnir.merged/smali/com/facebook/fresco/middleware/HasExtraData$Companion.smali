.class public final Lcom/facebook/fresco/middleware/HasExtraData$Companion;
.super Ljava/lang/Object;
.source "HasExtraData.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/fresco/middleware/HasExtraData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0011\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/facebook/fresco/middleware/HasExtraData$Companion;",
        "",
        "()V",
        "KEY_BITMAP_CONFIG",
        "",
        "KEY_COLOR_SPACE",
        "KEY_ENCODED_HEIGHT",
        "KEY_ENCODED_SIZE",
        "KEY_ENCODED_WIDTH",
        "KEY_ID",
        "KEY_IMAGE_FORMAT",
        "KEY_IMAGE_SOURCE_EXTRAS",
        "KEY_IS_ROUNDED",
        "KEY_LAST_SCAN_NUMBER",
        "KEY_MODIFIED_URL",
        "KEY_MULTIPLEX_BITMAP_COUNT",
        "KEY_MULTIPLEX_ENCODED_COUNT",
        "KEY_NON_FATAL_DECODE_ERROR",
        "KEY_ORIGIN",
        "KEY_ORIGIN_SUBCATEGORY",
        "KEY_URI_SOURCE",
        "middleware_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field static final synthetic $$INSTANCE:Lcom/facebook/fresco/middleware/HasExtraData$Companion;

.field public static final KEY_BITMAP_CONFIG:Ljava/lang/String; = "bitmap_config"

.field public static final KEY_COLOR_SPACE:Ljava/lang/String; = "image_color_space"

.field public static final KEY_ENCODED_HEIGHT:Ljava/lang/String; = "encoded_height"

.field public static final KEY_ENCODED_SIZE:Ljava/lang/String; = "encoded_size"

.field public static final KEY_ENCODED_WIDTH:Ljava/lang/String; = "encoded_width"

.field public static final KEY_ID:Ljava/lang/String; = "id"

.field public static final KEY_IMAGE_FORMAT:Ljava/lang/String; = "image_format"

.field public static final KEY_IMAGE_SOURCE_EXTRAS:Ljava/lang/String; = "image_source_extras"

.field public static final KEY_IS_ROUNDED:Ljava/lang/String; = "is_rounded"

.field public static final KEY_LAST_SCAN_NUMBER:Ljava/lang/String; = "last_scan_num"

.field public static final KEY_MODIFIED_URL:Ljava/lang/String; = "modified_url"

.field public static final KEY_MULTIPLEX_BITMAP_COUNT:Ljava/lang/String; = "multiplex_bmp_cnt"

.field public static final KEY_MULTIPLEX_ENCODED_COUNT:Ljava/lang/String; = "multiplex_enc_cnt"

.field public static final KEY_NON_FATAL_DECODE_ERROR:Ljava/lang/String; = "non_fatal_decode_error"

.field public static final KEY_ORIGIN:Ljava/lang/String; = "origin"

.field public static final KEY_ORIGIN_SUBCATEGORY:Ljava/lang/String; = "origin_sub"

.field public static final KEY_URI_SOURCE:Ljava/lang/String; = "uri_source"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/fresco/middleware/HasExtraData$Companion;

    invoke-direct {v0}, Lcom/facebook/fresco/middleware/HasExtraData$Companion;-><init>()V

    sput-object v0, Lcom/facebook/fresco/middleware/HasExtraData$Companion;->$$INSTANCE:Lcom/facebook/fresco/middleware/HasExtraData$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
