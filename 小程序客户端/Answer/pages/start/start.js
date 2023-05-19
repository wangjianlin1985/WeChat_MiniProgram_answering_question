//login.js
//获取应用实例
var app = getApp();
Page({
  data: {
    remind: '加载中',
    angle: 0,
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    userInfo: {}
  },

  goToIndex: function () {
    wx.switchTab({
      url: '/pages/index/index',
    });
  },
  formSubmit: function(e){
    var param = {};
    param.loginName = e.detail.value.loginName;
    param.password = e.detail.value.password;
    param.openId = app.globalData.userInfo.openId;

    if (param.loginName == null || param.loginName ==''){
      wx.showToast({
        title: '请输入账户',
        icon: 'error',
        duration: 1000,
        mask: true
      })
      return;
    }

    if (param.password == null || param.password == '') {
      wx.showToast({
        title: '请输入密码',
        icon: 'error',
        duration: 1000,
        mask: true
      })
      return;
    }

    wx.request({
      url: app.serverUrl + 'bindUser',
      method: 'POST',
      data: {
        loginName: param.loginName, 
        openId: param.openId, 
        password: param.password
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        debugger
        wx.showToast({
          title: '绑定成功',
          icon: 'succes',
          duration: 1000,
          mask: true
        })
      }
    });

  },
  onLoad: function () {
    if (!app.globalData.userInfo) {
      this.setData({
        needLogin: true
      })
    } else {
      if (!app.globalData.systemUser) {
        this.setData({
          hasUserInfo: false,
          userInfo: app.globalData.userInfo
        })
      } else {
        this.setData({
          hasUserInfo: true,
          userInfo: app.globalData.userInfo
        })
      }
    }
  },
  onShow: function () {
    if (!app.globalData.userInfo){
      this.setData({
        needLogin: true
      })
    }else{
      if (!app.globalData.systemUser) {
        this.setData({
          hasUserInfo: false,
          userInfo: app.globalData.userInfo
        })
      } else {
        this.setData({
          hasUserInfo: true,
          userInfo: app.globalData.userInfo
        })
      }
    }
    
  },


  getUserProfile(e) { 
    var that = this;
    wx.getUserProfile({
      desc: '展示用户信息', 
      success: (res) => {  

        wx.request({
          url: app.serverUrl + 'onLogin',
          data: {
            code: app.globalData.code,
            encryptedData: res.encryptedData,
            iv: res.iv
          },
          header: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          method: 'POST',
          //服务端的回掉
          success: function (result) {
            app.globalData.systemUser = result.data.systemUser;
            app.globalData.userInfo = result.data.userInfo;
            that.setData({
              needLogin:false,
              userInfo: app.globalData.userInfo
            })
  
            if (!app.globalData.systemUser) {
              that.setData({
                hasUserInfo: false
              })
            }else{
              that.setData({
                hasUserInfo: true
              })
            }
          }
        });

      }
    });

    
  },
   
  /*
  bindGetUserInfo: function (e) {
    var that=this;
    
    if (e.detail.userInfo) {
      wx.request({
        url: app.serverUrl + 'onLogin',
        data: {
          code: app.globalData.code,
          encryptedData: e.detail.encryptedData,
          iv: e.detail.iv
        },
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        method: 'POST',
        //服务端的回掉
        success: function (result) {
          app.globalData.systemUser = result.data.systemUser;
          app.globalData.userInfo = result.data.userInfo;
          that.setData({
            needLogin:false,
            userInfo: app.globalData.userInfo
          })

          if (!app.globalData.systemUser) {
            that.setData({
              hasUserInfo: false
            })
          }else{
            that.setData({
              hasUserInfo: true
            })
          }
        }
      });
    } else {
      //用户按了拒绝按钮
    }
  },*/

  onReady: function () {
    var _this = this;
    setTimeout(function () {
      _this.setData({
        remind: ''
      });
    }, 1000);
    wx.onAccelerometerChange(function (res) {
      var angle = -(res.x * 30).toFixed(1);
      if (angle > 14) { angle = 14; }
      else if (angle < -14) { angle = -14; }
      if (_this.data.angle !== angle) {
        _this.setData({
          angle: angle
        });
      }
    });
  },
});