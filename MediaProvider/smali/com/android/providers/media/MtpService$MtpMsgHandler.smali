.class Lcom/android/providers/media/MtpService$MtpMsgHandler;
.super Landroid/os/Handler;
.source "MtpService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/providers/media/MtpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MtpMsgHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/providers/media/MtpService;


# direct methods
.method public constructor <init>(Lcom/android/providers/media/MtpService;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    .line 168
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 169
    return-void
.end method

.method private doQuitHandlerThread()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mServerFinished:Z
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$600(Lcom/android/providers/media/MtpService;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mServiceFinished:Z
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$1000(Lcom/android/providers/media/MtpService;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mHandlerThread:Landroid/os/HandlerThread;
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$1100(Lcom/android/providers/media/MtpService;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 210
    :cond_0
    return-void
.end method

.method private doStartMtpServer(Landroid/os/Bundle;)V
    .locals 12
    .parameter "bundle"

    .prologue
    const/4 v1, 0x0

    .line 213
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mBinder:Lcom/android/providers/media/IMtpService$Stub;
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$000(Lcom/android/providers/media/MtpService;)Lcom/android/providers/media/IMtpService$Stub;

    move-result-object v2

    monitor-enter v2

    .line 214
    :try_start_0
    iget-object v3, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    if-nez p1, :cond_0

    move v0, v1

    :goto_0
    #setter for: Lcom/android/providers/media/MtpService;->mPtpMode:Z
    invoke-static {v3, v0}, Lcom/android/providers/media/MtpService;->access$1202(Lcom/android/providers/media/MtpService;Z)Z

    .line 216
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    const-string v2, "MtpService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "starting MTP server in "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mPtpMode:Z
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$1200(Lcom/android/providers/media/MtpService;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "PTP mode"

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    const/4 v9, 0x0

    .line 219
    .local v9, subdirs:[Ljava/lang/String;
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mPtpMode:Z
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$1200(Lcom/android/providers/media/MtpService;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 220
    invoke-static {}, Lcom/android/providers/media/MtpService;->access$1300()[Ljava/lang/String;

    move-result-object v0

    array-length v6, v0

    .line 221
    .local v6, count:I
    new-array v9, v6, [Ljava/lang/String;

    .line 222
    const/4 v8, 0x0

    .local v8, i:I
    :goto_2
    if-ge v8, v6, :cond_2

    .line 223
    invoke-static {}, Lcom/android/providers/media/MtpService;->access$1300()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v8

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    .line 226
    .local v7, file:Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 227
    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v9, v8

    .line 222
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 214
    .end local v6           #count:I
    .end local v7           #file:Ljava/io/File;
    .end local v8           #i:I
    .end local v9           #subdirs:[Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v0, "ptp"

    const/4 v10, 0x0

    invoke-virtual {p1, v0, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0

    .line 216
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 217
    :cond_1
    const-string v0, "MTP mode"

    goto :goto_1

    .line 231
    .restart local v9       #subdirs:[Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    new-instance v2, Landroid/mtp/MtpDatabase;

    iget-object v3, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    const-string v10, "external"

    iget-object v11, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mVolumes:[Landroid/os/storage/StorageVolume;
    invoke-static {v11}, Lcom/android/providers/media/MtpService;->access$1400(Lcom/android/providers/media/MtpService;)[Landroid/os/storage/StorageVolume;

    move-result-object v11

    aget-object v1, v11, v1

    invoke-virtual {v1}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v10, v1, v9}, Landroid/mtp/MtpDatabase;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    #setter for: Lcom/android/providers/media/MtpService;->mDatabase:Landroid/mtp/MtpDatabase;
    invoke-static {v0, v2}, Lcom/android/providers/media/MtpService;->access$902(Lcom/android/providers/media/MtpService;Landroid/mtp/MtpDatabase;)Landroid/mtp/MtpDatabase;

    .line 233
    const/4 v4, -0x1

    .line 234
    .local v4, hostId:I
    const-string v5, ""

    .line 235
    .local v5, hostName:Ljava/lang/String;
    if-eqz p1, :cond_3

    .line 236
    const-string v0, "ActiveHostId"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 237
    const-string v0, "ActiveHostName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 238
    if-nez v5, :cond_3

    .line 239
    const-string v5, ""

    .line 242
    :cond_3
    iget-object v10, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    new-instance v0, Landroid/mtp/MtpServer;

    iget-object v1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mDatabase:Landroid/mtp/MtpDatabase;
    invoke-static {v1}, Lcom/android/providers/media/MtpService;->access$900(Lcom/android/providers/media/MtpService;)Landroid/mtp/MtpDatabase;

    move-result-object v1

    iget-object v2, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mPtpMode:Z
    invoke-static {v2}, Lcom/android/providers/media/MtpService;->access$1200(Lcom/android/providers/media/MtpService;)Z

    move-result v2

    iget-object v3, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    invoke-direct/range {v0 .. v5}, Landroid/mtp/MtpServer;-><init>(Landroid/mtp/MtpDatabase;ZLandroid/content/Context;ILjava/lang/String;)V

    #setter for: Lcom/android/providers/media/MtpService;->mServer:Landroid/mtp/MtpServer;
    invoke-static {v10, v0}, Lcom/android/providers/media/MtpService;->access$1502(Lcom/android/providers/media/MtpService;Landroid/mtp/MtpServer;)Landroid/mtp/MtpServer;

    .line 243
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mBinder:Lcom/android/providers/media/IMtpService$Stub;
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$000(Lcom/android/providers/media/MtpService;)Lcom/android/providers/media/IMtpService$Stub;

    move-result-object v1

    monitor-enter v1

    .line 244
    :try_start_2
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mMtpDisabled:Z
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$100(Lcom/android/providers/media/MtpService;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 245
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #calls: Lcom/android/providers/media/MtpService;->addStorageDevicesLocked()V
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$200(Lcom/android/providers/media/MtpService;)V

    .line 247
    :cond_4
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 249
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mServer:Landroid/mtp/MtpServer;
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$1500(Lcom/android/providers/media/MtpService;)Landroid/mtp/MtpServer;

    move-result-object v0

    iget-object v1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mMtpMsgHandler:Lcom/android/providers/media/MtpService$MtpMsgHandler;
    invoke-static {v1}, Lcom/android/providers/media/MtpService;->access$1600(Lcom/android/providers/media/MtpService;)Lcom/android/providers/media/MtpService$MtpMsgHandler;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/mtp/MtpServer;->setMtpServiceHandler(Landroid/os/Handler;)V

    .line 250
    iget-object v0, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mServer:Landroid/mtp/MtpServer;
    invoke-static {v0}, Lcom/android/providers/media/MtpService;->access$1500(Lcom/android/providers/media/MtpService;)Landroid/mtp/MtpServer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/mtp/MtpServer;->start()V

    .line 251
    return-void

    .line 247
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 173
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 201
    const-string v1, "MtpService"

    const-string v2, "Message not supported"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    :goto_0
    return-void

    .line 175
    :pswitch_0
    iget-object v1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #setter for: Lcom/android/providers/media/MtpService;->mServerFinished:Z
    invoke-static {v1, v3}, Lcom/android/providers/media/MtpService;->access$602(Lcom/android/providers/media/MtpService;Z)Z

    .line 176
    invoke-static {}, Lcom/android/providers/media/MtpService;->access$700()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 178
    :try_start_0
    invoke-static {}, Lcom/android/providers/media/MtpService;->access$800()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 181
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/Bundle;

    invoke-direct {p0, v1}, Lcom/android/providers/media/MtpService$MtpMsgHandler;->doStartMtpServer(Landroid/os/Bundle;)V

    .line 182
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/providers/media/MtpService;->access$802(Z)Z

    .line 188
    :goto_1
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 185
    :cond_0
    const v1, 0x10002

    :try_start_1
    invoke-virtual {p0, v1}, Lcom/android/providers/media/MtpService$MtpMsgHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 186
    .local v0, startMsg:Landroid/os/Message;
    const-wide/16 v3, 0x1f4

    invoke-virtual {p0, v0, v3, v4}, Lcom/android/providers/media/MtpService$MtpMsgHandler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 191
    .end local v0           #startMsg:Landroid/os/Message;
    :pswitch_1
    iget-object v1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #setter for: Lcom/android/providers/media/MtpService;->mServerFinished:Z
    invoke-static {v1, v2}, Lcom/android/providers/media/MtpService;->access$602(Lcom/android/providers/media/MtpService;Z)Z

    .line 192
    iget-object v1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #getter for: Lcom/android/providers/media/MtpService;->mDatabase:Landroid/mtp/MtpDatabase;
    invoke-static {v1}, Lcom/android/providers/media/MtpService;->access$900(Lcom/android/providers/media/MtpService;)Landroid/mtp/MtpDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/mtp/MtpDatabase;->cleanup()V

    .line 193
    invoke-direct {p0}, Lcom/android/providers/media/MtpService$MtpMsgHandler;->doQuitHandlerThread()V

    .line 194
    invoke-static {v2}, Lcom/android/providers/media/MtpService;->access$802(Z)Z

    goto :goto_0

    .line 197
    :pswitch_2
    iget-object v1, p0, Lcom/android/providers/media/MtpService$MtpMsgHandler;->this$0:Lcom/android/providers/media/MtpService;

    #setter for: Lcom/android/providers/media/MtpService;->mServiceFinished:Z
    invoke-static {v1, v2}, Lcom/android/providers/media/MtpService;->access$1002(Lcom/android/providers/media/MtpService;Z)Z

    .line 198
    invoke-direct {p0}, Lcom/android/providers/media/MtpService$MtpMsgHandler;->doQuitHandlerThread()V

    goto :goto_0

    .line 173
    :pswitch_data_0
    .packed-switch 0x10001
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
