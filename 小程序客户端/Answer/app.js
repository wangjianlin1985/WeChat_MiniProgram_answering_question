//app.js
App({
  serverUrl: "http://127.0.0.1:8088/cpsspbbc/",
  onLaunch: function () {
    var that=this;
    // 登录
    wx.login({
      success: res => {
        that.globalData.code = res.code;
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          
        }else{
          that.getWebUser(res);
        }
      }
    })

    /*
    wx.getUserInfo({
      success: res => {
        wx.request({
          url: that.serverUrl + 'onLogin',
          data: {
            code: that.globalData.code,
            encryptedData: res.encryptedData,
            iv: res.iv
          },
          header: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          method: 'POST',
          //服务端的回掉
          success: function (result) {
            that.globalData.systemUser = result.data.systemUser;
            that.globalData.userInfo = result.data.userInfo;
          }
        });
        // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
        // 所以此处加入 callback 以防止这种情况
        if (that.userInfoReadyCallback) {
          that.userInfoReadyCallback(res)
        }
      }
    })  */
  },
  formate_data: function (date) {
    let month_add = date.getMonth() + 1;
    var formate_result = date.getFullYear() + '年'
      + month_add + '月'
      + date.getDate() + '日'
      + ' '
      + date.getHours() + '点'
      + date.getMinutes() + '分';
    return formate_result;
  },

  getWebUser:function(res){
    // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
    
  },

  getUserInfo: function (cb) {
    var that = this;
    if (this.globalData.userInfo) {
      typeof cb == "function" && cb(this.globalData.userInfo)
    } else {
      wx.login({
        success: function () {
          wx.getUserInfo({
            success: function (res) {
              that.globalData.userInfo = res.userInfo;
              typeof cb == "function" && cb(that.globalData.userInfo)
            }
          })
        }
      });
    }
  },
  
  globalData: {
    userInfo: null,
    systemUser:null
  }
})