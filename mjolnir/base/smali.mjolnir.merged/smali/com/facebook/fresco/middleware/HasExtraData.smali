.class public interface abstract Lcom/facebook/fresco/middleware/HasExtraData;
.super Ljava/lang/Object;
.source "HasExtraData.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/fresco/middleware/HasExtraData$Companion;,
        Lcom/facebook/fresco/middleware/HasExtraData$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\u0008f\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012J\u001d\u0010\u0002\u001a\u0004\u0018\u0001H\u0003\"\u0004\u0008\u0000\u0010\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&\u00a2\u0006\u0002\u0010\u0006J)\u0010\u0002\u001a\u0004\u0018\u0001H\u0003\"\u0004\u0008\u0000\u0010\u00032\u0006\u0010\u0004\u001a\u00020\u00052\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u0001H\u0003H&\u00a2\u0006\u0002\u0010\u0008J\u001a\u0010\t\u001a\u0014\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\nj\u0002`\u000bH&J%\u0010\u000c\u001a\u00020\r\"\u0004\u0008\u0000\u0010\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u000e\u001a\u0004\u0018\u0001H\u0003H&\u00a2\u0006\u0002\u0010\u000fJ\"\u0010\u0010\u001a\u00020\r2\u0018\u0010\u0011\u001a\u0014\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\nj\u0002`\u000bH&\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/fresco/middleware/HasExtraData;",
        "",
        "getExtra",
        "E",
        "key",
        "",
        "(Ljava/lang/String;)Ljava/lang/Object;",
        "valueIfNotFound",
        "(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;",
        "getExtras",
        "",
        "Lcom/facebook/fresco/middleware/Extras;",
        "putExtra",
        "",
        "value",
        "(Ljava/lang/String;Ljava/lang/Object;)V",
        "putExtras",
        "extras",
        "Companion",
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
.field public static final Companion:Lcom/facebook/fresco/middleware/HasExtraData$Companion;

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

    sget-object v0, Lcom/facebook/fresco/middleware/HasExtraData$Companion;->$$INSTANCE:Lcom/facebook/fresco/middleware/HasExtraData$Companion;

    sput-object v0, Lcom/facebook/fresco/middleware/HasExtraData;->Companion:Lcom/facebook/fresco/middleware/HasExtraData$Companion;

    return-void
.end method


# virtual methods
.method public abstract getExtra(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TE;"
        }
    .end annotation
.end method

.method public abstract getExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TE;)TE;"
        }
    .end annotation
.end method

.method public abstract getExtras()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public abstract putExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TE;)V"
        }
    .end annotation
.end method

.method public abstract putExtras(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method
