.class public Lexpo/modules/filesystem/FileSystemModule;
.super Lexpo/modules/kotlin/modules/Module;
.source "FileSystemModule.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;,
        Lexpo/modules/filesystem/FileSystemModule$DownloadTaskHandler;,
        Lexpo/modules/filesystem/FileSystemModule$ProgressListener;,
        Lexpo/modules/filesystem/FileSystemModule$ProgressResponseBody;,
        Lexpo/modules/filesystem/FileSystemModule$TaskHandler;,
        Lexpo/modules/filesystem/FileSystemModule$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFileSystemModule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n+ 2 Module.kt\nexpo/modules/kotlin/modules/ModuleKt\n+ 3 ExpoTrace.kt\nexpo/modules/kotlin/tracing/ExpoTraceKt\n+ 4 Trace.kt\nandroidx/tracing/TraceKt\n+ 5 ModuleDefinitionBuilder.kt\nexpo/modules/kotlin/modules/ModuleDefinitionBuilder\n+ 6 ObjectDefinitionBuilder.kt\nexpo/modules/kotlin/objects/ObjectDefinitionBuilder\n+ 7 AnyType.kt\nexpo/modules/kotlin/types/AnyTypeKt\n+ 8 AsyncFunctionComponent.kt\nexpo/modules/kotlin/functions/AsyncFunctionComponentKt\n+ 9 EnforceType.kt\nexpo/modules/kotlin/types/EnforceTypeKt\n+ 10 ArrayIntrinsics.kt\nkotlin/ArrayIntrinsicsKt\n+ 11 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 12 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n+ 13 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 14 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,1125:1\n70#2:1126\n14#3:1127\n25#3:1128\n27#4,3:1129\n31#4:2266\n75#5,2:1132\n124#5,3:2261\n89#5,2:2264\n232#6:1134\n235#6,3:1187\n232#6:1190\n235#6,3:1244\n257#6:1247\n260#6,3:1311\n232#6:1314\n235#6,3:1368\n216#6,8:1371\n224#6,2:1431\n216#6,8:1433\n224#6,2:1493\n232#6:1495\n235#6,3:1549\n216#6,8:1552\n224#6,2:1612\n206#6:1614\n207#6,2:1645\n206#6:1647\n207#6,2:1678\n216#6,8:1680\n224#6,2:1740\n216#6,8:1742\n224#6,2:1802\n232#6:1804\n235#6,3:1858\n257#6:1861\n260#6,3:1925\n245#6:1928\n248#6,3:1952\n295#6:1955\n298#6,3:1990\n320#6:1993\n323#6,3:2038\n295#6:2041\n298#6,3:2076\n216#6,8:2079\n224#6,2:2139\n345#6:2141\n348#6,3:2196\n216#6,8:2199\n224#6,2:2259\n69#7,6:1135\n56#7:1141\n47#7,7:1142\n75#7:1149\n56#7:1150\n47#7,7:1151\n69#7,6:1191\n56#7:1197\n47#7,7:1198\n75#7:1205\n56#7:1206\n47#7,7:1207\n73#7:1214\n80#7,7:1248\n56#7:1255\n47#7,7:1256\n87#7:1263\n56#7:1264\n47#7,7:1265\n88#7:1272\n56#7:1273\n47#7,7:1274\n85#7:1281\n69#7,6:1315\n56#7:1321\n47#7,7:1322\n75#7:1329\n56#7:1330\n47#7,7:1331\n73#7:1338\n60#7,5:1379\n56#7:1384\n47#7,17:1385\n60#7,5:1441\n56#7:1446\n47#7,17:1447\n69#7,6:1496\n56#7:1502\n47#7,7:1503\n75#7:1510\n56#7:1511\n47#7,7:1512\n73#7:1519\n60#7,5:1560\n56#7:1565\n47#7,17:1566\n60#7,5:1688\n56#7:1693\n47#7,17:1694\n60#7,5:1750\n56#7:1755\n47#7,17:1756\n69#7,6:1805\n56#7:1811\n47#7,7:1812\n75#7:1819\n56#7:1820\n47#7,7:1821\n73#7:1828\n80#7,7:1862\n56#7:1869\n47#7,7:1870\n87#7:1877\n56#7:1878\n47#7,7:1879\n88#7:1886\n56#7:1887\n47#7,7:1888\n85#7:1895\n60#7,5:1929\n56#7:1934\n47#7,17:1935\n80#7,7:1956\n56#7:1963\n47#7,7:1964\n87#7:1971\n56#7:1972\n47#7,7:1973\n88#7:1980\n56#7:1981\n47#7,7:1982\n85#7:1989\n93#7,8:1994\n56#7:2002\n47#7,7:2003\n101#7:2010\n56#7:2011\n47#7,7:2012\n102#7:2019\n56#7:2020\n47#7,7:2021\n103#7:2028\n56#7:2029\n47#7,7:2030\n99#7:2037\n80#7,7:2042\n56#7:2049\n47#7,7:2050\n87#7:2057\n56#7:2058\n47#7,7:2059\n88#7:2066\n56#7:2067\n47#7,7:2068\n85#7:2075\n60#7,5:2087\n56#7:2092\n47#7,17:2093\n108#7,9:2142\n56#7:2151\n47#7,7:2152\n117#7:2159\n56#7:2160\n47#7,7:2161\n118#7:2168\n56#7:2169\n47#7,7:2170\n119#7:2177\n56#7:2178\n47#7,7:2179\n120#7:2186\n56#7:2187\n47#7,7:2188\n115#7:2195\n60#7,5:2207\n56#7:2212\n47#7,17:2213\n15#8,6:1158\n21#8,19:1168\n15#8,6:1215\n21#8,19:1225\n15#8,6:1282\n21#8,19:1292\n15#8,6:1339\n21#8,19:1349\n15#8,6:1402\n21#8,19:1412\n15#8,6:1464\n21#8,19:1474\n15#8,6:1520\n21#8,19:1530\n15#8,6:1583\n21#8,19:1593\n15#8,6:1616\n21#8,19:1626\n15#8,6:1649\n21#8,19:1659\n15#8,6:1711\n21#8,19:1721\n15#8,6:1773\n21#8,19:1783\n15#8,6:1829\n21#8,19:1839\n15#8,6:1896\n21#8,19:1906\n15#8,6:2110\n21#8,19:2120\n15#8,6:2230\n21#8,19:2240\n8#9,4:1164\n8#9,4:1221\n8#9,4:1288\n8#9,4:1345\n8#9,4:1408\n8#9,4:1470\n8#9,4:1526\n8#9,4:1589\n8#9,4:1622\n8#9,4:1655\n8#9,4:1717\n8#9,4:1779\n8#9,4:1835\n8#9,4:1902\n8#9,4:2116\n8#9,4:2236\n26#10:1615\n26#10:1648\n1#11:2267\n215#12,2:2268\n215#12,2:2270\n11065#13:2272\n11400#13,3:2273\n2730#14,7:2276\n*S KotlinDebug\n*F\n+ 1 FileSystemModule.kt\nexpo/modules/filesystem/FileSystemModule\n*L\n89#1:1126\n89#1:1127\n89#1:1128\n89#1:1129,3\n89#1:2266\n103#1:1132,2\n700#1:2261,3\n724#1:2264,2\n112#1:1134\n112#1:1187,3\n172#1:1190\n172#1:1244,3\n203#1:1247\n203#1:1311,3\n217#1:1314\n217#1:1368,3\n256#1:1371,8\n256#1:1431,2\n283#1:1433,8\n283#1:1493,2\n334#1:1495\n334#1:1549,3\n352#1:1552,8\n352#1:1612,2\n369#1:1614\n369#1:1645,2\n378#1:1647\n378#1:1678,2\n387#1:1680,8\n387#1:1740,2\n401#1:1742,8\n401#1:1802,2\n417#1:1804\n417#1:1858,3\n436#1:1861\n436#1:1925,3\n453#1:1928\n453#1:1952,3\n470#1:1955\n470#1:1990,3\n499#1:1993\n499#1:2038,3\n551#1:2041\n551#1:2076,3\n613#1:2079,8\n613#1:2139,2\n618#1:2141\n618#1:2196,3\n683#1:2199,8\n683#1:2259,2\n112#1:1135,6\n112#1:1141\n112#1:1142,7\n112#1:1149\n112#1:1150\n112#1:1151,7\n172#1:1191,6\n172#1:1197\n172#1:1198,7\n172#1:1205\n172#1:1206\n172#1:1207,7\n172#1:1214\n203#1:1248,7\n203#1:1255\n203#1:1256,7\n203#1:1263\n203#1:1264\n203#1:1265,7\n203#1:1272\n203#1:1273\n203#1:1274,7\n203#1:1281\n217#1:1315,6\n217#1:1321\n217#1:1322,7\n217#1:1329\n217#1:1330\n217#1:1331,7\n217#1:1338\n256#1:1379,5\n256#1:1384\n256#1:1385,17\n283#1:1441,5\n283#1:1446\n283#1:1447,17\n334#1:1496,6\n334#1:1502\n334#1:1503,7\n334#1:1510\n334#1:1511\n334#1:1512,7\n334#1:1519\n352#1:1560,5\n352#1:1565\n352#1:1566,17\n387#1:1688,5\n387#1:1693\n387#1:1694,17\n401#1:1750,5\n401#1:1755\n401#1:1756,17\n417#1:1805,6\n417#1:1811\n417#1:1812,7\n417#1:1819\n417#1:1820\n417#1:1821,7\n417#1:1828\n436#1:1862,7\n436#1:1869\n436#1:1870,7\n436#1:1877\n436#1:1878\n436#1:1879,7\n436#1:1886\n436#1:1887\n436#1:1888,7\n436#1:1895\n453#1:1929,5\n453#1:1934\n453#1:1935,17\n470#1:1956,7\n470#1:1963\n470#1:1964,7\n470#1:1971\n470#1:1972\n470#1:1973,7\n470#1:1980\n470#1:1981\n470#1:1982,7\n470#1:1989\n499#1:1994,8\n499#1:2002\n499#1:2003,7\n499#1:2010\n499#1:2011\n499#1:2012,7\n499#1:2019\n499#1:2020\n499#1:2021,7\n499#1:2028\n499#1:2029\n499#1:2030,7\n499#1:2037\n551#1:2042,7\n551#1:2049\n551#1:2050,7\n551#1:2057\n551#1:2058\n551#1:2059,7\n551#1:2066\n551#1:2067\n551#1:2068,7\n551#1:2075\n613#1:2087,5\n613#1:2092\n613#1:2093,17\n618#1:2142,9\n618#1:2151\n618#1:2152,7\n618#1:2159\n618#1:2160\n618#1:2161,7\n618#1:2168\n618#1:2169\n618#1:2170,7\n618#1:2177\n618#1:2178\n618#1:2179,7\n618#1:2186\n618#1:2187\n618#1:2188,7\n618#1:2195\n683#1:2207,5\n683#1:2212\n683#1:2213,17\n112#1:1158,6\n112#1:1168,19\n172#1:1215,6\n172#1:1225,19\n203#1:1282,6\n203#1:1292,19\n217#1:1339,6\n217#1:1349,19\n256#1:1402,6\n256#1:1412,19\n283#1:1464,6\n283#1:1474,19\n334#1:1520,6\n334#1:1530,19\n352#1:1583,6\n352#1:1593,19\n369#1:1616,6\n369#1:1626,19\n378#1:1649,6\n378#1:1659,19\n387#1:1711,6\n387#1:1721,19\n401#1:1773,6\n401#1:1783,19\n417#1:1829,6\n417#1:1839,19\n436#1:1896,6\n436#1:1906,19\n613#1:2110,6\n613#1:2120,19\n683#1:2230,6\n683#1:2240,19\n112#1:1164,4\n172#1:1221,4\n203#1:1288,4\n217#1:1345,4\n256#1:1408,4\n283#1:1470,4\n334#1:1526,4\n352#1:1589,4\n369#1:1622,4\n378#1:1655,4\n387#1:1717,4\n401#1:1779,4\n417#1:1835,4\n436#1:1902,4\n613#1:2116,4\n683#1:2236,4\n369#1:1615\n378#1:1648\n883#1:2268,2\n900#1:2270,2\n1046#1:2272\n1046#1:2273,3\n1046#1:2276,7\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00be\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\u0008\u0016\u0018\u00002\u00020\u0001:\u0005VWXYZB\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0018\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J \u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J(\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\u00122\u0006\u0010$\u001a\u00020\u00122\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 H\u0002J\u0008\u0010%\u001a\u00020&H\u0017J\u0018\u0010\'\u001a\u0004\u0018\u00010(2\u0006\u0010)\u001a\u00020*H\u0082@\u00a2\u0006\u0002\u0010+J\u0010\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020\u001aH\u0002J\u0018\u0010/\u001a\u00020-2\u0006\u00100\u001a\u00020\u00162\u0006\u00101\u001a\u000202H\u0002J \u0010/\u001a\u00020-2\u0006\u00100\u001a\u00020\u00162\u0006\u00101\u001a\u0002022\u0006\u00103\u001a\u00020\u0012H\u0002J\u0010\u00104\u001a\u00020-2\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0010\u00105\u001a\u0002062\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0010\u00107\u001a\u0002082\u0006\u00100\u001a\u00020\u0016H\u0002J\u0010\u00109\u001a\u00020:2\u0006\u0010;\u001a\u000208H\u0002J\u0012\u0010<\u001a\u0004\u0018\u00010=2\u0006\u00100\u001a\u00020\u0016H\u0002J\u0010\u0010>\u001a\u00020?2\u0006\u00100\u001a\u00020\u0016H\u0002J\u0010\u0010@\u001a\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0010\u0010A\u001a\u0002082\u0006\u00100\u001a\u00020\u0016H\u0002J\u0012\u0010B\u001a\u0002082\u0008\u0010C\u001a\u0004\u0018\u00010\u0012H\u0003J\u0010\u0010D\u001a\u00020\u00122\u0006\u0010E\u001a\u00020\u0012H\u0002J\u001a\u0010F\u001a\n\u0012\u0004\u0012\u000202\u0018\u00010G2\u0008\u0010H\u001a\u0004\u0018\u00010\u0012H\u0002J\u0016\u0010I\u001a\u0008\u0012\u0004\u0012\u0002020G2\u0006\u00100\u001a\u00020\u0016H\u0002J\u0018\u0010J\u001a\n\u0012\u0004\u0012\u000202\u0018\u00010G2\u0006\u00100\u001a\u00020\u0016H\u0002J \u0010K\u001a\u00020-2\u0006\u0010L\u001a\u00020=2\u0006\u0010M\u001a\u00020\u001a2\u0006\u0010N\u001a\u00020\u0015H\u0002J\u0010\u0010O\u001a\u00020P2\u0006\u0010Q\u001a\u00020RH\u0002J\u000c\u0010S\u001a\u00020-*\u00020\u0016H\u0002J\u000c\u0010T\u001a\u00020-*\u00020\u0016H\u0002J\u000c\u0010U\u001a\u00020\u001a*\u00020\u0016H\u0002R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u00020\u00068BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00048BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000e\u0010\u000fR\u001a\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0018\u0010\u0014\u001a\u00020\u0015*\u00020\u00168BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0017\u00a8\u0006["
    }
    d2 = {
        "Lexpo/modules/filesystem/FileSystemModule;",
        "Lexpo/modules/kotlin/modules/Module;",
        "()V",
        "client",
        "Lokhttp3/OkHttpClient;",
        "context",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "dirPermissionsRequest",
        "Lexpo/modules/kotlin/Promise;",
        "moduleCoroutineScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "okHttpClient",
        "getOkHttpClient",
        "()Lokhttp3/OkHttpClient;",
        "taskHandlers",
        "",
        "",
        "Lexpo/modules/filesystem/FileSystemModule$TaskHandler;",
        "isSAFUri",
        "",
        "Landroid/net/Uri;",
        "(Landroid/net/Uri;)Z",
        "contentUriFromFile",
        "file",
        "Ljava/io/File;",
        "createRequestBody",
        "Lokhttp3/RequestBody;",
        "options",
        "Lexpo/modules/filesystem/FileSystemUploadOptions;",
        "decorator",
        "Lexpo/modules/filesystem/RequestBodyDecorator;",
        "createUploadRequest",
        "Lokhttp3/Request;",
        "url",
        "fileUriString",
        "definition",
        "Lexpo/modules/kotlin/modules/ModuleDefinitionData;",
        "downloadResumableTask",
        "",
        "params",
        "Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;",
        "(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "ensureDirExists",
        "",
        "dir",
        "ensurePermission",
        "uri",
        "permission",
        "Lexpo/modules/interfaces/filesystem/Permission;",
        "errorMsg",
        "forceDelete",
        "getFileSize",
        "",
        "getInputStream",
        "Ljava/io/InputStream;",
        "getInputStreamBytes",
        "",
        "inputStream",
        "getNearestSAFFile",
        "Landroidx/documentfile/provider/DocumentFile;",
        "getOutputStream",
        "Ljava/io/OutputStream;",
        "md5",
        "openAssetInputStream",
        "openResourceInputStream",
        "resourceName",
        "parseFileUri",
        "uriStr",
        "permissionsForPath",
        "Ljava/util/EnumSet;",
        "path",
        "permissionsForSAFUri",
        "permissionsForUri",
        "transformFilesFromSAF",
        "documentFile",
        "outputDir",
        "copy",
        "translateHeaders",
        "Landroid/os/Bundle;",
        "headers",
        "Lokhttp3/Headers;",
        "checkIfFileDirExists",
        "checkIfFileExists",
        "toFile",
        "DownloadResumableTaskParams",
        "DownloadTaskHandler",
        "ProgressListener",
        "ProgressResponseBody",
        "TaskHandler",
        "expo-file-system_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private client:Lokhttp3/OkHttpClient;

.field private dirPermissionsRequest:Lexpo/modules/kotlin/Promise;

.field private final moduleCoroutineScope:Lkotlinx/coroutines/CoroutineScope;

.field private final taskHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/filesystem/FileSystemModule$TaskHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 80
    invoke-direct {p0}, Lexpo/modules/kotlin/modules/Module;-><init>()V

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lexpo/modules/filesystem/FileSystemModule;->taskHandlers:Ljava/util/Map;

    .line 86
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getDefault()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    invoke-static {v0}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/filesystem/FileSystemModule;->moduleCoroutineScope:Lkotlinx/coroutines/CoroutineScope;

    return-void
.end method

.method public static final synthetic access$checkIfFileDirExists(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->checkIfFileDirExists(Landroid/net/Uri;)V

    return-void
.end method

.method public static final synthetic access$contentUriFromFile(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)Landroid/net/Uri;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->contentUriFromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$createUploadRequest(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;Ljava/lang/String;Lexpo/modules/filesystem/FileSystemUploadOptions;Lexpo/modules/filesystem/RequestBodyDecorator;)Lokhttp3/Request;
    .locals 0

    .line 80
    invoke-direct {p0, p1, p2, p3, p4}, Lexpo/modules/filesystem/FileSystemModule;->createUploadRequest(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/filesystem/FileSystemUploadOptions;Lexpo/modules/filesystem/RequestBodyDecorator;)Lokhttp3/Request;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$downloadResumableTask(Lexpo/modules/filesystem/FileSystemModule;Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    .line 80
    invoke-direct {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule;->downloadResumableTask(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$ensureDirExists(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->ensureDirExists(Ljava/io/File;)V

    return-void
.end method

.method public static final synthetic access$ensurePermission(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1, p2}, Lexpo/modules/filesystem/FileSystemModule;->ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V

    return-void
.end method

.method public static final synthetic access$ensurePermission(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/filesystem/FileSystemModule;->ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$forceDelete(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->forceDelete(Ljava/io/File;)V

    return-void
.end method

.method public static final synthetic access$getContext(Lexpo/modules/filesystem/FileSystemModule;)Landroid/content/Context;
    .locals 0

    .line 80
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getDirPermissionsRequest$p(Lexpo/modules/filesystem/FileSystemModule;)Lexpo/modules/kotlin/Promise;
    .locals 0

    .line 80
    iget-object p0, p0, Lexpo/modules/filesystem/FileSystemModule;->dirPermissionsRequest:Lexpo/modules/kotlin/Promise;

    return-object p0
.end method

.method public static final synthetic access$getFileSize(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)J
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->getFileSize(Ljava/io/File;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$getInputStream(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->getInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getInputStreamBytes(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/InputStream;)[B
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->getInputStreamBytes(Ljava/io/InputStream;)[B

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getModuleCoroutineScope$p(Lexpo/modules/filesystem/FileSystemModule;)Lkotlinx/coroutines/CoroutineScope;
    .locals 0

    .line 80
    iget-object p0, p0, Lexpo/modules/filesystem/FileSystemModule;->moduleCoroutineScope:Lkotlinx/coroutines/CoroutineScope;

    return-object p0
.end method

.method public static final synthetic access$getNearestSAFFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->getNearestSAFFile(Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getOkHttpClient(Lexpo/modules/filesystem/FileSystemModule;)Lokhttp3/OkHttpClient;
    .locals 0

    .line 80
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getOutputStream(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/OutputStream;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->getOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getTaskHandlers$p(Lexpo/modules/filesystem/FileSystemModule;)Ljava/util/Map;
    .locals 0

    .line 80
    iget-object p0, p0, Lexpo/modules/filesystem/FileSystemModule;->taskHandlers:Ljava/util/Map;

    return-object p0
.end method

.method public static final synthetic access$isSAFUri(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Z
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->isSAFUri(Landroid/net/Uri;)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$md5(Lexpo/modules/filesystem/FileSystemModule;Ljava/io/File;)Ljava/lang/String;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->md5(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$openAssetInputStream(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->openAssetInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$openResourceInputStream(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->openResourceInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$parseFileUri(Lexpo/modules/filesystem/FileSystemModule;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->parseFileUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$setDirPermissionsRequest$p(Lexpo/modules/filesystem/FileSystemModule;Lexpo/modules/kotlin/Promise;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lexpo/modules/filesystem/FileSystemModule;->dirPermissionsRequest:Lexpo/modules/kotlin/Promise;

    return-void
.end method

.method public static final synthetic access$toFile(Lexpo/modules/filesystem/FileSystemModule;Landroid/net/Uri;)Ljava/io/File;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->toFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$transformFilesFromSAF(Lexpo/modules/filesystem/FileSystemModule;Landroidx/documentfile/provider/DocumentFile;Ljava/io/File;Z)V
    .locals 0

    .line 80
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/filesystem/FileSystemModule;->transformFilesFromSAF(Landroidx/documentfile/provider/DocumentFile;Ljava/io/File;Z)V

    return-void
.end method

.method public static final synthetic access$translateHeaders(Lexpo/modules/filesystem/FileSystemModule;Lokhttp3/Headers;)Landroid/os/Bundle;
    .locals 0

    .line 80
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->translateHeaders(Lokhttp3/Headers;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method

.method private final checkIfFileDirExists(Landroid/net/Uri;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 743
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->toFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    .line 744
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 745
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 746
    :cond_0
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Directory for \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' doesn\'t exist. Please make sure directory \'"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' exists before calling downloadAsync."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final checkIfFileExists(Landroid/net/Uri;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 735
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->toFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    .line 736
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 737
    :cond_0
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Directory for \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' doesn\'t exist."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final contentUriFromFile(Ljava/io/File;)Landroid/net/Uri;
    .locals 3

    .line 865
    invoke-virtual {p0}, Lexpo/modules/filesystem/FileSystemModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 869
    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    .line 870
    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".FileSystemFileProvider"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 868
    invoke-static {v1, v0, p1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "getUriForFile(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1

    .line 866
    :cond_0
    new-instance p1, Lexpo/modules/kotlin/exception/Exceptions$MissingActivity;

    invoke-direct {p1}, Lexpo/modules/kotlin/exception/Exceptions$MissingActivity;-><init>()V

    throw p1
.end method

.method private final createRequestBody(Lexpo/modules/filesystem/FileSystemUploadOptions;Lexpo/modules/filesystem/RequestBodyDecorator;Ljava/io/File;)Lokhttp3/RequestBody;
    .locals 5

    .line 891
    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemUploadOptions;->getUploadType()Lexpo/modules/filesystem/FileSystemUploadType;

    move-result-object v0

    sget-object v1, Lexpo/modules/filesystem/FileSystemModule$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Lexpo/modules/filesystem/FileSystemUploadType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_4

    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    .line 897
    new-instance v0, Lokhttp3/MultipartBody$Builder;

    invoke-direct {v0, v2, v1, v2}, Lokhttp3/MultipartBody$Builder;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sget-object v1, Lokhttp3/MultipartBody;->FORM:Lokhttp3/MediaType;

    invoke-virtual {v0, v1}, Lokhttp3/MultipartBody$Builder;->setType(Lokhttp3/MediaType;)Lokhttp3/MultipartBody$Builder;

    move-result-object v0

    .line 898
    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemUploadOptions;->getParameters()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2270
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 900
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Lokhttp3/MultipartBody$Builder;->addFormDataPart(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/MultipartBody$Builder;

    goto :goto_0

    .line 902
    :cond_0
    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemUploadOptions;->getMimeType()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URLConnection;->guessContentTypeFromName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "guessContentTypeFromName(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 904
    :cond_1
    invoke-virtual {p1}, Lexpo/modules/filesystem/FileSystemUploadOptions;->getFieldName()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    .line 905
    :cond_2
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    sget-object v4, Lokhttp3/MediaType;->Companion:Lokhttp3/MediaType$Companion;

    invoke-virtual {v4, v1}, Lokhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v1

    invoke-virtual {v3, p3, v1}, Lokhttp3/RequestBody$Companion;->create(Ljava/io/File;Lokhttp3/MediaType;)Lokhttp3/RequestBody;

    move-result-object p3

    invoke-interface {p2, p3}, Lexpo/modules/filesystem/RequestBodyDecorator;->decorate(Lokhttp3/RequestBody;)Lokhttp3/RequestBody;

    move-result-object p2

    invoke-virtual {v0, p1, v2, p2}, Lokhttp3/MultipartBody$Builder;->addFormDataPart(Ljava/lang/String;Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/MultipartBody$Builder;

    .line 906
    invoke-virtual {v0}, Lokhttp3/MultipartBody$Builder;->build()Lokhttp3/MultipartBody;

    move-result-object p1

    check-cast p1, Lokhttp3/RequestBody;

    goto :goto_1

    :cond_3
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 893
    :cond_4
    sget-object p1, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    invoke-virtual {p1, p3, v2}, Lokhttp3/RequestBody$Companion;->create(Ljava/io/File;Lokhttp3/MediaType;)Lokhttp3/RequestBody;

    move-result-object p1

    invoke-interface {p2, p1}, Lexpo/modules/filesystem/RequestBodyDecorator;->decorate(Lokhttp3/RequestBody;)Lokhttp3/RequestBody;

    move-result-object p1

    :goto_1
    return-object p1
.end method

.method private final createUploadRequest(Ljava/lang/String;Ljava/lang/String;Lexpo/modules/filesystem/FileSystemUploadOptions;Lexpo/modules/filesystem/RequestBodyDecorator;)Lokhttp3/Request;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 877
    invoke-static {p2}, Lexpo/modules/filesystem/FileSystemModuleKt;->access$slashifyFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 878
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v0, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    invoke-direct {p0, p2, v0}, Lexpo/modules/filesystem/FileSystemModule;->ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V

    .line 879
    invoke-direct {p0, p2}, Lexpo/modules/filesystem/FileSystemModule;->checkIfFileExists(Landroid/net/Uri;)V

    .line 881
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 882
    invoke-virtual {p3}, Lexpo/modules/filesystem/FileSystemUploadOptions;->getHeaders()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2268
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 883
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_0

    .line 886
    :cond_0
    invoke-direct {p0, p2}, Lexpo/modules/filesystem/FileSystemModule;->toFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p2

    invoke-direct {p0, p3, p4, p2}, Lexpo/modules/filesystem/FileSystemModule;->createRequestBody(Lexpo/modules/filesystem/FileSystemUploadOptions;Lexpo/modules/filesystem/RequestBodyDecorator;Ljava/io/File;)Lokhttp3/RequestBody;

    move-result-object p2

    .line 887
    invoke-virtual {p3}, Lexpo/modules/filesystem/FileSystemUploadOptions;->getHttpMethod()Lexpo/modules/filesystem/HttpMethod;

    move-result-object p3

    invoke-virtual {p3}, Lexpo/modules/filesystem/HttpMethod;->getValue()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3, p2}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method

.method private final downloadResumableTask(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3

    .line 919
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p0, v2}, Lexpo/modules/filesystem/FileSystemModule$downloadResumableTask$2;-><init>(Lexpo/modules/filesystem/FileSystemModule$DownloadResumableTaskParams;Lexpo/modules/filesystem/FileSystemModule;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p2}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private final ensureDirExists(Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 752
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 753
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Couldn\'t create directory \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method private final ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 795
    sget-object v0, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    const-string v1, "Location \'"

    if-ne p2, v0, :cond_0

    .line 796
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "\' isn\'t readable."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lexpo/modules/filesystem/FileSystemModule;->ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V

    .line 798
    :cond_0
    sget-object v0, Lexpo/modules/interfaces/filesystem/Permission;->WRITE:Lexpo/modules/interfaces/filesystem/Permission;

    if-ne p2, v0, :cond_1

    .line 799
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "\' isn\'t writable."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lexpo/modules/filesystem/FileSystemModule;->ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V

    .line 801
    :cond_1
    invoke-virtual {p2}, Lexpo/modules/interfaces/filesystem/Permission;->name()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\' doesn\'t have permission \'"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lexpo/modules/filesystem/FileSystemModule;->ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V

    return-void
.end method

.method private final ensurePermission(Landroid/net/Uri;Lexpo/modules/interfaces/filesystem/Permission;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 788
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->permissionsForUri(Landroid/net/Uri;)Ljava/util/EnumSet;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    return-void

    .line 789
    :cond_0
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final forceDelete(Ljava/io/File;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1020
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1021
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1023
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    .line 1025
    :try_start_0
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v4}, Lexpo/modules/filesystem/FileSystemModule;->forceDelete(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    if-nez v2, :cond_2

    .line 1033
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 1034
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to delete directory "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1031
    :cond_2
    throw v2

    .line 1021
    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to list contents of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1036
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_5

    :goto_2
    return-void

    .line 1037
    :cond_5
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to delete file: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final getContext()Landroid/content/Context;
    .locals 1

    .line 82
    invoke-virtual {p0}, Lexpo/modules/filesystem/FileSystemModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getReactContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lexpo/modules/kotlin/exception/Exceptions$AppContextLost;

    invoke-direct {v0}, Lexpo/modules/kotlin/exception/Exceptions$AppContextLost;-><init>()V

    throw v0
.end method

.method private final getFileSize(Ljava/io/File;)J
    .locals 7

    .line 1042
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1043
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0

    .line 1045
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    const-wide/16 v0, 0x0

    if-nez p1, :cond_1

    return-wide v0

    .line 2272
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, p1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 2273
    array-length v3, p1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, p1, v4

    .line 1046
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v5}, Lexpo/modules/filesystem/FileSystemModule;->getFileSize(Ljava/io/File;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 2274
    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2275
    :cond_2
    check-cast v2, Ljava/util/List;

    .line 1046
    check-cast v2, Ljava/lang/Iterable;

    .line 2276
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 2277
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    const/4 p1, 0x0

    goto :goto_2

    .line 2278
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 2279
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2280
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    add-long/2addr v5, v3

    .line 1046
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    goto :goto_1

    :cond_4
    move-object p1, v2

    :goto_2
    check-cast p1, Ljava/lang/Long;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    :cond_5
    return-wide v0
.end method

.method private final getInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1052
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->toFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    check-cast v0, Ljava/io/InputStream;

    goto :goto_0

    .line 1053
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "asset"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->openAssetInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0

    .line 1054
    :cond_1
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->isSAFUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    :goto_0
    return-object v0

    .line 1055
    :cond_2
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unsupported scheme for location \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final getInputStreamBytes(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1089
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 1094
    :goto_0
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    .line 1095
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 1097
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    const-string v1, "toByteArray(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1100
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-object p1

    :catchall_0
    move-exception p1

    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1101
    :catch_1
    throw p1
.end method

.method private final getNearestSAFFile(Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;
    .locals 2

    .line 1066
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/documentfile/provider/DocumentFile;->fromSingleUri(Landroid/content/Context;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1067
    invoke-virtual {v0}, Landroidx/documentfile/provider/DocumentFile;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1070
    :cond_0
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/documentfile/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private final declared-synchronized getOkHttpClient()Lokhttp3/OkHttpClient;
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule;->client:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_0

    .line 994
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 995
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x3c

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 996
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 997
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 999
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lexpo/modules/filesystem/FileSystemModule;->client:Lokhttp3/OkHttpClient;

    :cond_0
    iget-object v0, p0, Lexpo/modules/filesystem/FileSystemModule;->client:Lokhttp3/OkHttpClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1001
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private final getOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1060
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->toFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v0, Ljava/io/OutputStream;

    goto :goto_0

    .line 1061
    :cond_0
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->isSAFUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 1059
    :goto_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0

    .line 1062
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unsupported scheme for location \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final isSAFUri(Landroid/net/Uri;)Z
    .locals 4

    .line 1082
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    const/4 v2, 0x0

    const-string v3, "com.android.externalstorage"

    invoke-static {p1, v3, v1, v0, v2}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private final md5(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1006
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    check-cast v0, Ljava/io/InputStream;

    .line 1007
    check-cast v0, Ljava/io/Closeable;

    :try_start_0
    move-object p1, v0

    check-cast p1, Ljava/io/InputStream;

    .line 1008
    invoke-static {p1}, Lorg/apache/commons/codec/digest/DigestUtils;->md5(Ljava/io/InputStream;)[B

    move-result-object p1

    .line 1009
    invoke-static {p1}, Lorg/apache/commons/codec/binary/Hex;->encodeHex([B)[C

    move-result-object p1

    const-string v1, "encodeHex(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([C)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 1007
    invoke-static {v0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v1

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v1

    invoke-static {v0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private final openAssetInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 807
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "requireNotNull(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "substring(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 808
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    const-string v0, "open(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1

    .line 807
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value was null."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final openResourceInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 814
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "raw"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 817
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 819
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "No resource found with the name \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 822
    :cond_1
    :goto_0
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p1

    const-string v0, "openRawResource(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method private final parseFileUri(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1084
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    const/16 v1, 0x3a

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x6

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "substring(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method private final permissionsForPath(Ljava/lang/String;)Ljava/util/EnumSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/EnumSet<",
            "Lexpo/modules/interfaces/filesystem/Permission;",
            ">;"
        }
    .end annotation

    .line 758
    invoke-virtual {p0}, Lexpo/modules/filesystem/FileSystemModule;->getAppContext()Lexpo/modules/kotlin/AppContext;

    move-result-object v0

    invoke-virtual {v0}, Lexpo/modules/kotlin/AppContext;->getFilePermission()Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lexpo/modules/interfaces/filesystem/FilePermissionModuleInterface;->getPathPermissions(Landroid/content/Context;Ljava/lang/String;)Ljava/util/EnumSet;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private final permissionsForSAFUri(Landroid/net/Uri;)Ljava/util/EnumSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/EnumSet<",
            "Lexpo/modules/interfaces/filesystem/Permission;",
            ">;"
        }
    .end annotation

    .line 771
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->getNearestSAFFile(Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object p1

    const-class v0, Lexpo/modules/interfaces/filesystem/Permission;

    .line 772
    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    if-eqz p1, :cond_1

    .line 774
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->canRead()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 775
    sget-object v1, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 777
    :cond_0
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->canWrite()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 778
    sget-object p1, Lexpo/modules/interfaces/filesystem/Permission;->WRITE:Lexpo/modules/interfaces/filesystem/Permission;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    :cond_1
    const-string p1, "apply(...)"

    .line 772
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method private final permissionsForUri(Landroid/net/Uri;)Ljava/util/EnumSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/EnumSet<",
            "Lexpo/modules/interfaces/filesystem/Permission;",
            ">;"
        }
    .end annotation

    .line 762
    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->isSAFUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->permissionsForSAFUri(Landroid/net/Uri;)Ljava/util/EnumSet;

    move-result-object p1

    goto :goto_0

    .line 763
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p1, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    check-cast p1, Ljava/lang/Enum;

    invoke-static {p1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object p1

    goto :goto_0

    .line 764
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "asset"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    check-cast p1, Ljava/lang/Enum;

    invoke-static {p1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object p1

    goto :goto_0

    .line 765
    :cond_2
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lexpo/modules/filesystem/FileSystemModule;->permissionsForPath(Ljava/lang/String;)Ljava/util/EnumSet;

    move-result-object p1

    goto :goto_0

    .line 766
    :cond_3
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4

    sget-object p1, Lexpo/modules/interfaces/filesystem/Permission;->READ:Lexpo/modules/interfaces/filesystem/Permission;

    check-cast p1, Ljava/lang/Enum;

    invoke-static {p1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object p1

    goto :goto_0

    :cond_4
    const-class p1, Lexpo/modules/interfaces/filesystem/Permission;

    .line 767
    invoke-static {p1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private final toFile(Landroid/net/Uri;)Ljava/io/File;
    .locals 3

    .line 1075
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1076
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 1078
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid Uri: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final transformFilesFromSAF(Landroidx/documentfile/provider/DocumentFile;Ljava/io/File;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 827
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 830
    :cond_0
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    const-string v1, "Couldn\'t create folder in output dir."

    if-nez v0, :cond_2

    .line 831
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 832
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 833
    :cond_1
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 836
    :cond_2
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    .line 837
    :cond_3
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 840
    :cond_4
    :goto_0
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 841
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->listFiles()[Landroidx/documentfile/provider/DocumentFile;

    move-result-object v0

    const-string v1, "listFiles(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_5

    aget-object v3, v0, v2

    .line 842
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v3, p2, p3}, Lexpo/modules/filesystem/FileSystemModule;->transformFilesFromSAF(Landroidx/documentfile/provider/DocumentFile;Ljava/io/File;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    if-nez p3, :cond_6

    .line 845
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->delete()Z

    :cond_6
    return-void

    .line 850
    :cond_7
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 851
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 852
    new-instance v1, Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 854
    :cond_8
    new-instance v1, Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 856
    :goto_2
    invoke-direct {p0}, Lexpo/modules/filesystem/FileSystemModule;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2

    check-cast p2, Ljava/io/Closeable;

    .line 857
    :try_start_0
    move-object v0, p2

    check-cast v0, Ljava/io/InputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v2, Ljava/io/Closeable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    move-object v1, v2

    check-cast v1, Ljava/io/FileOutputStream;

    check-cast v1, Ljava/io/OutputStream;

    invoke-static {v0, v1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    :try_start_2
    invoke-static {v2, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    invoke-static {p2, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    if-nez p3, :cond_9

    .line 859
    invoke-virtual {p1}, Landroidx/documentfile/provider/DocumentFile;->delete()Z

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 857
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p3

    :try_start_4
    invoke-static {v2, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :catchall_3
    move-exception p3

    invoke-static {p2, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p3

    :cond_9
    :goto_3
    return-void
.end method

.method private final translateHeaders(Lokhttp3/Headers;)Landroid/os/Bundle;
    .locals 7

    .line 1109
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1110
    invoke-virtual {p1}, Lokhttp3/Headers;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 1111
    invoke-virtual {p1, v2}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    .line 1113
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1116
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v2}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1114
    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1119
    :cond_0
    invoke-virtual {p1, v2}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public definition()Lexpo/modules/kotlin/modules/ModuleDefinitionData;
    .locals 14

    const-string v0, "/"

    .line 89
    move-object v1, p0

    check-cast v1, Lexpo/modules/kotlin/modules/Module;

    .line 1126
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ".ModuleDefinition"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1128
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[ExpoModulesCore] "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1129
    invoke-static {v2}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 1126
    :try_start_0
    new-instance v2, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;

    invoke-direct {v2, v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;-><init>(Lexpo/modules/kotlin/modules/Module;)V

    const-string v1, "ExponentFileSystem"

    .line 90
    invoke-virtual {v2, v1}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Name(Ljava/lang/String;)V

    const/4 v1, 0x3

    new-array v3, v1, [Lkotlin/Pair;

    const-string v4, "documentDirectory"

    .line 93
    invoke-static {p0}, Lexpo/modules/filesystem/FileSystemModule;->access$getContext(Lexpo/modules/filesystem/FileSystemModule;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "cacheDirectory"

    .line 94
    invoke-static {p0}, Lexpo/modules/filesystem/FileSystemModule;->access$getContext(Lexpo/modules/filesystem/FileSystemModule;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    const-string v0, "bundleDirectory"

    const-string v6, "asset:///"

    .line 95
    invoke-static {v0, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    const/4 v6, 0x2

    aput-object v0, v3, v6

    .line 92
    invoke-virtual {v2, v3}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Constants([Lkotlin/Pair;)V

    new-array v0, v6, [Ljava/lang/String;

    const-string v3, "expo-file-system.downloadProgress"

    aput-object v3, v0, v5

    const-string v3, "expo-file-system.uploadProgress"

    aput-object v3, v0, v4

    .line 98
    invoke-virtual {v2, v0}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->Events([Ljava/lang/String;)V

    .line 1132
    invoke-virtual {v2}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->getEventListeners()Ljava/util/Map;

    move-result-object v0

    sget-object v3, Lexpo/modules/kotlin/events/EventName;->MODULE_CREATE:Lexpo/modules/kotlin/events/EventName;

    new-instance v7, Lexpo/modules/kotlin/events/BasicEventListener;

    sget-object v8, Lexpo/modules/kotlin/events/EventName;->MODULE_CREATE:Lexpo/modules/kotlin/events/EventName;

    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$OnCreate$1;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$OnCreate$1;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function0;

    invoke-direct {v7, v8, v9}, Lexpo/modules/kotlin/events/BasicEventListener;-><init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function0;)V

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "getInfoAsync"

    .line 1136
    const-class v7, Ljava/lang/String;

    .line 1137
    const-class v7, Lexpo/modules/filesystem/InfoOptions;

    new-array v7, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 1141
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$1;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$1;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1142
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1143
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1142
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1150
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$2;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$2;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1151
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1152
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/InfoOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1151
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1134
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$3;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1158
    const-class v9, Landroid/os/Bundle;

    .line 1162
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1168
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 1170
    :cond_0
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1172
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 1174
    :cond_1
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1176
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 1178
    :cond_2
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1180
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 1182
    :cond_3
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1184
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_0

    .line 1186
    :cond_4
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1188
    :goto_0
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "readAsStringAsync"

    .line 1192
    const-class v7, Ljava/lang/String;

    .line 1193
    const-class v7, Lexpo/modules/filesystem/ReadingOptions;

    new-array v7, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 1197
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$4;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$4;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1198
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1199
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1198
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1206
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$5;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$5;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1207
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1208
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/ReadingOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1207
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1190
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$6;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1216
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1245
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "writeAsStringAsync"

    .line 1249
    const-class v7, Ljava/lang/String;

    .line 1250
    const-class v7, Ljava/lang/String;

    .line 1251
    const-class v7, Lexpo/modules/filesystem/WritingOptions;

    new-array v7, v1, [Lexpo/modules/kotlin/types/AnyType;

    .line 1255
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$7;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$7;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1256
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1257
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1256
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1264
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$8;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$8;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1265
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1266
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1265
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1273
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$9;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$9;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1274
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1275
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/WritingOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1274
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v6

    .line 1247
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$10;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$10;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1282
    const-class v9, Lkotlin/Unit;

    .line 1286
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 1292
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_1

    .line 1294
    :cond_5
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 1296
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_1

    .line 1298
    :cond_6
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 1300
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_1

    .line 1302
    :cond_7
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 1304
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_1

    .line 1306
    :cond_8
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 1308
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_1

    .line 1310
    :cond_9
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1312
    :goto_1
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "deleteAsync"

    .line 1316
    const-class v7, Ljava/lang/String;

    .line 1317
    const-class v7, Lexpo/modules/filesystem/DeletingOptions;

    new-array v7, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 1321
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$11;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$11;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1322
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1323
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1322
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1330
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$12;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$12;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1331
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1332
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/DeletingOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1331
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1314
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$13;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$13;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1339
    const-class v9, Lkotlin/Unit;

    .line 1343
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 1349
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_2

    .line 1351
    :cond_a
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 1353
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_2

    .line 1355
    :cond_b
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1357
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_2

    .line 1359
    :cond_c
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 1361
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_2

    .line 1363
    :cond_d
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 1365
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_2

    .line 1367
    :cond_e
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1369
    :goto_2
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "moveAsync"

    .line 1371
    const-class v7, Lexpo/modules/filesystem/RelocatingOptions;

    const-class v8, Lexpo/modules/kotlin/Promise;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 1372
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v8, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1378
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$14;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1372
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_4

    .line 1380
    :cond_f
    const-class v7, Lexpo/modules/filesystem/RelocatingOptions;

    new-array v7, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 1384
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$15;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$15;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1385
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1386
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/RelocatingOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1385
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1374
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$16;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$16;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1402
    const-class v9, Lkotlin/Unit;

    .line 1406
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 1412
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_3
    move-object v7, v9

    goto :goto_4

    .line 1414
    :cond_10
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_11

    .line 1416
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_3

    .line 1418
    :cond_11
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_12

    .line 1420
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_3

    .line 1422
    :cond_12
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_13

    .line 1424
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_3

    .line 1426
    :cond_13
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    .line 1428
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_3

    .line 1430
    :cond_14
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_3

    .line 1431
    :goto_4
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "copyAsync"

    .line 1433
    const-class v7, Lexpo/modules/filesystem/RelocatingOptions;

    const-class v8, Lexpo/modules/kotlin/Promise;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 1434
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v8, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1440
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$17;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$17;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1434
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_6

    .line 1442
    :cond_15
    const-class v7, Lexpo/modules/filesystem/RelocatingOptions;

    new-array v7, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 1446
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$18;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$18;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1447
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1448
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/RelocatingOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1447
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1436
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$19;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$19;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1464
    const-class v9, Ljava/lang/Object;

    .line 1468
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_16

    .line 1474
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_5
    move-object v7, v9

    goto :goto_6

    .line 1476
    :cond_16
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_17

    .line 1478
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_5

    .line 1480
    :cond_17
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_18

    .line 1482
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_5

    .line 1484
    :cond_18
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_19

    .line 1486
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_5

    .line 1488
    :cond_19
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 1490
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_5

    .line 1492
    :cond_1a
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_5

    .line 1493
    :goto_6
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "makeDirectoryAsync"

    .line 1497
    const-class v7, Ljava/lang/String;

    .line 1498
    const-class v7, Lexpo/modules/filesystem/MakeDirectoryOptions;

    new-array v7, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 1502
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$20;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$20;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1503
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1504
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1503
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1511
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$21;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$21;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1512
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1513
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Lexpo/modules/filesystem/MakeDirectoryOptions;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1512
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1495
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$22;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$22;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1520
    const-class v9, Lkotlin/Unit;

    .line 1524
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1b

    .line 1530
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_7

    .line 1532
    :cond_1b
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1c

    .line 1534
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_7

    .line 1536
    :cond_1c
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1d

    .line 1538
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_7

    .line 1540
    :cond_1d
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1e

    .line 1542
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_7

    .line 1544
    :cond_1e
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1f

    .line 1546
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_7

    .line 1548
    :cond_1f
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1550
    :goto_7
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "readDirectoryAsync"

    .line 1552
    const-class v7, Ljava/lang/String;

    const-class v8, Lexpo/modules/kotlin/Promise;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_20

    .line 1553
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v8, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1559
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$23;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$23;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1553
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_9

    .line 1561
    :cond_20
    const-class v7, Ljava/lang/String;

    new-array v7, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 1565
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$24;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$24;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1566
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1567
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v4, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1566
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1555
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$25;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$25;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1583
    const-class v9, Ljava/util/List;

    .line 1587
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_21

    .line 1593
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_8
    move-object v7, v9

    goto :goto_9

    .line 1595
    :cond_21
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_22

    .line 1597
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_8

    .line 1599
    :cond_22
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_23

    .line 1601
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_8

    .line 1603
    :cond_23
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_24

    .line 1605
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_8

    .line 1607
    :cond_24
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_25

    .line 1609
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_8

    .line 1611
    :cond_25
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_8

    .line 1612
    :goto_9
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "getTotalDiskCapacityAsync"

    new-array v7, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1614
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$26;

    invoke-direct {v8}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$26;-><init>()V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1616
    const-class v9, Ljava/lang/Double;

    .line 1620
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_26

    .line 1626
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_a

    .line 1628
    :cond_26
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_27

    .line 1630
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_a

    .line 1632
    :cond_27
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_28

    .line 1634
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_a

    .line 1636
    :cond_28
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_29

    .line 1638
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_a

    .line 1640
    :cond_29
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2a

    .line 1642
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_a

    .line 1644
    :cond_2a
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1645
    :goto_a
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "getFreeDiskStorageAsync"

    new-array v7, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1647
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$27;

    invoke-direct {v8}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$27;-><init>()V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1649
    const-class v9, Ljava/lang/Double;

    .line 1653
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2b

    .line 1659
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_b

    .line 1661
    :cond_2b
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2c

    .line 1663
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_b

    .line 1665
    :cond_2c
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2d

    .line 1667
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_b

    .line 1669
    :cond_2d
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2e

    .line 1671
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_b

    .line 1673
    :cond_2e
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2f

    .line 1675
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_b

    .line 1677
    :cond_2f
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1678
    :goto_b
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "getContentUriAsync"

    .line 1680
    const-class v7, Ljava/lang/String;

    const-class v8, Lexpo/modules/kotlin/Promise;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_30

    .line 1681
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v8, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1687
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$28;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$28;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1681
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_d

    .line 1689
    :cond_30
    const-class v7, Ljava/lang/String;

    new-array v7, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 1693
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$29;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$29;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1694
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1695
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1694
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1683
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$30;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$30;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1711
    const-class v9, Ljava/lang/String;

    .line 1715
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_31

    .line 1721
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_c
    move-object v7, v9

    goto :goto_d

    .line 1723
    :cond_31
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_32

    .line 1725
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_c

    .line 1727
    :cond_32
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_33

    .line 1729
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_c

    .line 1731
    :cond_33
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_34

    .line 1733
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_c

    .line 1735
    :cond_34
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_35

    .line 1737
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_c

    .line 1739
    :cond_35
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_c

    .line 1740
    :goto_d
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "readSAFDirectoryAsync"

    .line 1742
    const-class v7, Ljava/lang/String;

    const-class v8, Lexpo/modules/kotlin/Promise;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_36

    .line 1743
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v8, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 1749
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$31;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$31;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1743
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_f

    .line 1751
    :cond_36
    const-class v7, Ljava/lang/String;

    new-array v7, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 1755
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$32;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$32;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1756
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1757
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1756
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1745
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$33;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$33;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1773
    const-class v9, Ljava/util/List;

    .line 1777
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_37

    .line 1783
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_e
    move-object v7, v9

    goto :goto_f

    .line 1785
    :cond_37
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_38

    .line 1787
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_e

    .line 1789
    :cond_38
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_39

    .line 1791
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_e

    .line 1793
    :cond_39
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3a

    .line 1795
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_e

    .line 1797
    :cond_3a
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3b

    .line 1799
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_e

    .line 1801
    :cond_3b
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_e

    .line 1802
    :goto_f
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "makeSAFDirectoryAsync"

    .line 1806
    const-class v7, Ljava/lang/String;

    .line 1807
    const-class v7, Ljava/lang/String;

    new-array v7, v6, [Lexpo/modules/kotlin/types/AnyType;

    .line 1811
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$34;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$34;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1812
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1813
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1812
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1820
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$35;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$35;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1821
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1822
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1821
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1804
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$36;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$36;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1829
    const-class v9, Ljava/lang/String;

    .line 1833
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3c

    .line 1839
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_10

    .line 1841
    :cond_3c
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3d

    .line 1843
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_10

    .line 1845
    :cond_3d
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3e

    .line 1847
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_10

    .line 1849
    :cond_3e
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3f

    .line 1851
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_10

    .line 1853
    :cond_3f
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_40

    .line 1855
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_10

    .line 1857
    :cond_40
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1859
    :goto_10
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "createSAFFileAsync"

    .line 1863
    const-class v7, Ljava/lang/String;

    .line 1864
    const-class v7, Ljava/lang/String;

    .line 1865
    const-class v7, Ljava/lang/String;

    new-array v7, v1, [Lexpo/modules/kotlin/types/AnyType;

    .line 1869
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$37;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$37;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1870
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1871
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1870
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v5

    .line 1878
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$38;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$38;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1879
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1880
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1879
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v4

    .line 1887
    sget-object v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$39;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$39;

    check-cast v8, Lkotlin/jvm/functions/Function0;

    .line 1888
    new-instance v9, Lexpo/modules/kotlin/types/AnyType;

    .line 1889
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v5, v8}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 1888
    invoke-direct {v9, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v9, v7, v6

    .line 1861
    new-instance v8, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$40;

    invoke-direct {v8, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$40;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 1896
    const-class v9, Ljava/lang/String;

    .line 1900
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_41

    .line 1906
    new-instance v9, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_11

    .line 1908
    :cond_41
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_42

    .line 1910
    new-instance v9, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_11

    .line 1912
    :cond_42
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_43

    .line 1914
    new-instance v9, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_11

    .line 1916
    :cond_43
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_44

    .line 1918
    new-instance v9, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_11

    .line 1920
    :cond_44
    const-class v10, Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_45

    .line 1922
    new-instance v9, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_11

    .line 1924
    :cond_45
    new-instance v9, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v9, v3, v7, v8}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v9, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 1926
    :goto_11
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "requestDirectoryPermissionsAsync"

    .line 1928
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 1930
    const-class v8, Ljava/lang/String;

    new-array v8, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 1934
    sget-object v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$1;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$1;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    .line 1935
    new-instance v10, Lexpo/modules/kotlin/types/AnyType;

    .line 1936
    new-instance v11, Lexpo/modules/kotlin/types/LazyKType;

    const-class v12, Ljava/lang/String;

    invoke-static {v12}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v12

    invoke-direct {v11, v12, v4, v9}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v11, Lkotlin/reflect/KType;

    .line 1935
    invoke-direct {v10, v11}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v10, v8, v5

    .line 1952
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$2;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$2;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1928
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 1953
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1952
    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 470
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "uploadAsync"

    .line 1955
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 1957
    const-class v8, Ljava/lang/String;

    .line 1958
    const-class v8, Ljava/lang/String;

    .line 1959
    const-class v8, Lexpo/modules/filesystem/FileSystemUploadOptions;

    new-array v8, v1, [Lexpo/modules/kotlin/types/AnyType;

    .line 1963
    sget-object v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$3;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$3;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    .line 1964
    new-instance v10, Lexpo/modules/kotlin/types/AnyType;

    .line 1965
    new-instance v11, Lexpo/modules/kotlin/types/LazyKType;

    const-class v12, Ljava/lang/String;

    invoke-static {v12}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v12

    invoke-direct {v11, v12, v5, v9}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v11, Lkotlin/reflect/KType;

    .line 1964
    invoke-direct {v10, v11}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v10, v8, v5

    .line 1972
    sget-object v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$4;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$4;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    .line 1973
    new-instance v10, Lexpo/modules/kotlin/types/AnyType;

    .line 1974
    new-instance v11, Lexpo/modules/kotlin/types/LazyKType;

    const-class v12, Ljava/lang/String;

    invoke-static {v12}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v12

    invoke-direct {v11, v12, v5, v9}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v11, Lkotlin/reflect/KType;

    .line 1973
    invoke-direct {v10, v11}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v10, v8, v4

    .line 1981
    sget-object v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$5;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$5;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    .line 1982
    new-instance v10, Lexpo/modules/kotlin/types/AnyType;

    .line 1983
    new-instance v11, Lexpo/modules/kotlin/types/LazyKType;

    const-class v12, Lexpo/modules/filesystem/FileSystemUploadOptions;

    invoke-static {v12}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v12

    invoke-direct {v11, v12, v5, v9}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v11, Lkotlin/reflect/KType;

    .line 1982
    invoke-direct {v10, v11}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v10, v8, v6

    .line 1990
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$6;

    invoke-direct {v9, p0, v2}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$6;-><init>(Lexpo/modules/filesystem/FileSystemModule;Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;)V

    check-cast v9, Lkotlin/jvm/functions/Function2;

    .line 1955
    invoke-direct {v7, v3, v8, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 1991
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1990
    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 499
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "uploadTaskStartAsync"

    .line 1993
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 1995
    const-class v8, Ljava/lang/String;

    .line 1996
    const-class v8, Ljava/lang/String;

    .line 1997
    const-class v8, Ljava/lang/String;

    .line 1998
    const-class v8, Lexpo/modules/filesystem/FileSystemUploadOptions;

    const/4 v8, 0x4

    new-array v9, v8, [Lexpo/modules/kotlin/types/AnyType;

    .line 2002
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$7;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$7;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2003
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2004
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2003
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v5

    .line 2011
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$8;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$8;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2012
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2013
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2012
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v4

    .line 2020
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$9;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$9;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2021
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2022
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2021
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v6

    .line 2029
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$10;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$10;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2030
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2031
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Lexpo/modules/filesystem/FileSystemUploadOptions;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2030
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v1

    .line 2038
    new-instance v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;

    invoke-direct {v10, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$11;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v10, Lkotlin/jvm/functions/Function2;

    .line 1993
    invoke-direct {v7, v3, v9, v10}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 2039
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2038
    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 551
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "downloadAsync"

    .line 2041
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 2043
    const-class v9, Ljava/lang/String;

    .line 2044
    const-class v9, Ljava/lang/String;

    .line 2045
    const-class v9, Lexpo/modules/filesystem/DownloadOptions;

    new-array v9, v1, [Lexpo/modules/kotlin/types/AnyType;

    .line 2049
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$12;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$12;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2050
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2051
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2050
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v5

    .line 2058
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$13;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$13;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2059
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2060
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v4, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2059
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v4

    .line 2067
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$14;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$14;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2068
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2069
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Lexpo/modules/filesystem/DownloadOptions;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2068
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v6

    .line 2076
    new-instance v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$15;

    invoke-direct {v10, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$15;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v10, Lkotlin/jvm/functions/Function2;

    .line 2041
    invoke-direct {v7, v3, v9, v10}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 2077
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2076
    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 613
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "networkTaskCancelAsync"

    .line 2079
    const-class v7, Ljava/lang/String;

    const-class v9, Lexpo/modules/kotlin/Promise;

    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_46

    .line 2080
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v9, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 2086
    new-instance v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$41;

    invoke-direct {v10, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$41;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v10, Lkotlin/jvm/functions/Function2;

    .line 2080
    invoke-direct {v7, v3, v9, v10}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_12

    .line 2088
    :cond_46
    const-class v7, Ljava/lang/String;

    new-array v7, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 2092
    sget-object v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$42;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$42;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    .line 2093
    new-instance v10, Lexpo/modules/kotlin/types/AnyType;

    .line 2094
    new-instance v11, Lexpo/modules/kotlin/types/LazyKType;

    const-class v12, Ljava/lang/String;

    invoke-static {v12}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v12

    invoke-direct {v11, v12, v5, v9}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v11, Lkotlin/reflect/KType;

    .line 2093
    invoke-direct {v10, v11}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v10, v7, v5

    .line 2082
    new-instance v9, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$43;

    invoke-direct {v9, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$43;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v9, Lkotlin/jvm/functions/Function1;

    .line 2111
    new-instance v10, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v10, v3, v7, v9}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    move-object v7, v10

    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 2139
    :goto_12
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v3, "downloadResumableStartAsync"

    .line 2141
    new-instance v7, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    .line 2143
    const-class v9, Ljava/lang/String;

    .line 2144
    const-class v9, Ljava/lang/String;

    .line 2145
    const-class v9, Ljava/lang/String;

    .line 2146
    const-class v9, Lexpo/modules/filesystem/DownloadOptions;

    .line 2147
    const-class v9, Ljava/lang/String;

    const/4 v9, 0x5

    new-array v9, v9, [Lexpo/modules/kotlin/types/AnyType;

    .line 2151
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$16;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$16;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2152
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2153
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2152
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v5

    .line 2160
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$17;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$17;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2161
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2162
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2161
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v4

    .line 2169
    sget-object v10, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$18;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$18;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    .line 2170
    new-instance v11, Lexpo/modules/kotlin/types/AnyType;

    .line 2171
    new-instance v12, Lexpo/modules/kotlin/types/LazyKType;

    const-class v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v13

    invoke-direct {v12, v13, v5, v10}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v12, Lkotlin/reflect/KType;

    .line 2170
    invoke-direct {v11, v12}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v11, v9, v6

    .line 2178
    sget-object v6, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$19;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$19;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 2179
    new-instance v10, Lexpo/modules/kotlin/types/AnyType;

    .line 2180
    new-instance v11, Lexpo/modules/kotlin/types/LazyKType;

    const-class v12, Lexpo/modules/filesystem/DownloadOptions;

    invoke-static {v12}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v12

    invoke-direct {v11, v12, v5, v6}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v11, Lkotlin/reflect/KType;

    .line 2179
    invoke-direct {v10, v11}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v10, v9, v1

    .line 2187
    sget-object v1, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$20;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$20;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    .line 2188
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 2189
    new-instance v10, Lexpo/modules/kotlin/types/LazyKType;

    const-class v11, Ljava/lang/String;

    invoke-static {v11}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    invoke-direct {v10, v11, v4, v1}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v10, Lkotlin/reflect/KType;

    .line 2188
    invoke-direct {v6, v10}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v6, v9, v8

    .line 2196
    new-instance v1, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;

    invoke-direct {v1, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunctionWithPromise$21;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    .line 2141
    invoke-direct {v7, v3, v9, v1}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    .line 2197
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2196
    check-cast v7, Lexpo/modules/kotlin/functions/AsyncFunction;

    .line 683
    move-object v0, v2

    check-cast v0, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;

    const-string v1, "downloadResumablePauseAsync"

    .line 2199
    const-class v3, Ljava/lang/String;

    const-class v6, Lexpo/modules/kotlin/Promise;

    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 2200
    new-instance v3, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;

    new-array v4, v5, [Lexpo/modules/kotlin/types/AnyType;

    .line 2206
    new-instance v5, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$44;

    invoke-direct {v5, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$44;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    .line 2200
    invoke-direct {v3, v1, v4, v5}, Lexpo/modules/kotlin/functions/AsyncFunctionWithPromiseComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V

    check-cast v3, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto/16 :goto_14

    .line 2208
    :cond_47
    const-class v3, Ljava/lang/String;

    new-array v3, v4, [Lexpo/modules/kotlin/types/AnyType;

    .line 2212
    sget-object v4, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$45;->INSTANCE:Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$45;

    check-cast v4, Lkotlin/jvm/functions/Function0;

    .line 2213
    new-instance v6, Lexpo/modules/kotlin/types/AnyType;

    .line 2214
    new-instance v7, Lexpo/modules/kotlin/types/LazyKType;

    const-class v8, Ljava/lang/String;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-direct {v7, v8, v5, v4}, Lexpo/modules/kotlin/types/LazyKType;-><init>(Lkotlin/reflect/KClass;ZLkotlin/jvm/functions/Function0;)V

    check-cast v7, Lkotlin/reflect/KType;

    .line 2213
    invoke-direct {v6, v7}, Lexpo/modules/kotlin/types/AnyType;-><init>(Lkotlin/reflect/KType;)V

    aput-object v6, v3, v5

    .line 2202
    new-instance v4, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$46;

    invoke-direct {v4, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$AsyncFunction$46;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    .line 2230
    const-class v5, Landroid/os/Bundle;

    .line 2234
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_48

    .line 2240
    new-instance v5, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;

    invoke-direct {v5, v1, v3, v4}, Lexpo/modules/kotlin/functions/IntAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    :goto_13
    move-object v3, v5

    goto :goto_14

    .line 2242
    :cond_48
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 2244
    new-instance v5, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;

    invoke-direct {v5, v1, v3, v4}, Lexpo/modules/kotlin/functions/BoolAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_13

    .line 2246
    :cond_49
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4a

    .line 2248
    new-instance v5, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;

    invoke-direct {v5, v1, v3, v4}, Lexpo/modules/kotlin/functions/DoubleAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_13

    .line 2250
    :cond_4a
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    .line 2252
    new-instance v5, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;

    invoke-direct {v5, v1, v3, v4}, Lexpo/modules/kotlin/functions/FloatAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_13

    .line 2254
    :cond_4b
    const-class v6, Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 2256
    new-instance v5, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;

    invoke-direct {v5, v1, v3, v4}, Lexpo/modules/kotlin/functions/StringAsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_13

    .line 2258
    :cond_4c
    new-instance v5, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;

    invoke-direct {v5, v1, v3, v4}, Lexpo/modules/kotlin/functions/AsyncFunctionComponent;-><init>(Ljava/lang/String;[Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function1;)V

    check-cast v5, Lexpo/modules/kotlin/functions/AsyncFunction;

    goto :goto_13

    .line 2259
    :goto_14
    invoke-virtual {v0}, Lexpo/modules/kotlin/objects/ObjectDefinitionBuilder;->getAsyncFunctions()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2261
    invoke-virtual {v2}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->getEventListeners()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Lexpo/modules/kotlin/events/EventName;->ON_ACTIVITY_RESULT:Lexpo/modules/kotlin/events/EventName;

    .line 2262
    new-instance v3, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;

    sget-object v4, Lexpo/modules/kotlin/events/EventName;->ON_ACTIVITY_RESULT:Lexpo/modules/kotlin/events/EventName;

    .line 2261
    new-instance v5, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$OnActivityResult$1;

    invoke-direct {v5, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$OnActivityResult$1;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    .line 2262
    invoke-direct {v3, v4, v5}, Lexpo/modules/kotlin/events/EventListenerWithSenderAndPayload;-><init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function2;)V

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2264
    invoke-virtual {v2}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->getEventListeners()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Lexpo/modules/kotlin/events/EventName;->MODULE_DESTROY:Lexpo/modules/kotlin/events/EventName;

    new-instance v3, Lexpo/modules/kotlin/events/BasicEventListener;

    sget-object v4, Lexpo/modules/kotlin/events/EventName;->MODULE_DESTROY:Lexpo/modules/kotlin/events/EventName;

    new-instance v5, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$OnDestroy$1;

    invoke-direct {v5, p0}, Lexpo/modules/filesystem/FileSystemModule$definition$lambda$48$$inlined$OnDestroy$1;-><init>(Lexpo/modules/filesystem/FileSystemModule;)V

    check-cast v5, Lkotlin/jvm/functions/Function0;

    invoke-direct {v3, v4, v5}, Lexpo/modules/kotlin/events/BasicEventListener;-><init>(Lexpo/modules/kotlin/events/EventName;Lkotlin/jvm/functions/Function0;)V

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1126
    invoke-virtual {v2}, Lexpo/modules/kotlin/modules/ModuleDefinitionBuilder;->buildModule()Lexpo/modules/kotlin/modules/ModuleDefinitionData;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2266
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v0
.end method
