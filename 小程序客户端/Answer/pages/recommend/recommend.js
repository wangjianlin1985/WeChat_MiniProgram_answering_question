//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    userInfo: {},
    systemUser: {},
    problemList: {}
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      userInfo: app.globalData.userInfo,
      systemUser: app.globalData.systemUser,
      role: app.globalData.systemUser.roles[0]
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var that = this;
    wx.request({
      url: app.serverUrl + 'module/problem/list',
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      data: { dictLabel: app.globalData.systemUser.dictLabel },
      //服务端的回掉
      success: function (result) {
        if (result.data.rows) {
          that.setData({
            problemList: result.data.rows
          })
        }

      }
    });
  },
  refresh: function () {
    var that = this;
    wx.request({
      url: app.serverUrl + 'module/problem/list',
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      data: { dictLabel: app.globalData.systemUser.dictLabel },
      //服务端的回掉
      success: function (result) {
        if (result.data.rows) {
          that.setData({
            problemList: result.data.rows
          })
        }

      }
    });
  },
  checkAnswer: function (event) {
    var problemId = event.currentTarget.dataset.problemid;
    wx.navigateTo({
      url: '../mine/problem/problem?id=' + problemId
    })
  },
  toAnswer: function (event) {
    var problemId = event.currentTarget.dataset.problemid;
    wx.navigateTo({
      url: '../answer/answer?id=' + problemId
    })
  }
})
