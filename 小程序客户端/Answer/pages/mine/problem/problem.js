// pages/mine/problem/problem.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    stars: [0, 1, 2, 3, 4],
    normalSrc: '../../../images/normal.png',
    selectedSrc: '../../../images/selected.png',
    halfSrc: '../../../images/half.png',
    key: 0,//评分
    userInfo: {},
    systemUser: {},
    problemId:null,
    problem:{},
    answerList:[],
    role: {}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    this.setData({
      userInfo: app.globalData.userInfo,
      systemUser: app.globalData.systemUser,
      role: app.globalData.systemUser.roles[0],
      problemId: options.id
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
    var that=this;
    wx.request({
      url: app.serverUrl + 'module/problem/list',
      data: {
        id: this.data.problemId
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      //服务端的回掉
      success: function (result) {
        var rows = result.data.rows;
        if (rows.length > 0) {
          that.setData({
            problem: rows[0]
          })
        }

      }
    });

    this.getAnswerList();
  },

  getAnswerList: function () {
    var that = this;
    wx.request({
      url: app.serverUrl + 'module/answer/list',
      data: {
        problemId: this.data.problemId
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      //服务端的回掉
      success: function (result) {
        if (result.data.rows) {
          that.setData({
            answerList: result.data.rows
          })
        }

      }
    });
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  bindItemTap: function () {

  },
  //点击左边,整颗星
  selectRight: function (event) {
    var that=this;
    var key = event.currentTarget.dataset.key;
    var id = event.currentTarget.dataset.id
    wx.request({
      url: app.serverUrl + 'module/answer/edit',
      data: {
        id: id,
        score: key
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      method: 'POST',
      //服务端的回掉
      success: function (result) {
        that.getAnswerList();

      }
    });
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  toAnswer: function (event) {
    var problemId = event.currentTarget.dataset.problemid;
    wx.navigateTo({
      url: '../../answer/answer?id=' + problemId
    })
  }
})