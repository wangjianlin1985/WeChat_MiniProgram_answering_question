//获取应用实例
var app = getApp()
var Bmob = require("../../utils/bmob.js");
var common = require('../template/getCode.js')
var that;
Page({
  /**
   * 页面的初始数据
   */
  data: {
    notice_status: false,
    showTopTips: false,
    TopTips: '',
    noteMaxLen: 200,//备注最多字数
    content: "",
    noteNowLen: 0,//备注当前字数
  },

  tapNotice: function (e) {
    if (e.target.id == 'notice') {
      this.hideNotice();
    }
  },
  showNotice: function (e) {
    this.setData({
      'notice_status': true
    });
  },
  hideNotice: function (e) {
    this.setData({
      'notice_status': false
    });
  },


  //字数改变触发事件
  bindTextAreaChange: function (e) {
    var that = this
    var value = e.detail.value,
      len = parseInt(value.length);
    if (len > that.data.noteMaxLen)
      return;
    that.setData({
      content: value, noteNowLen: len
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    that = this;
    that.setData({//初始化数据
      src: "",
      isSrc: false,
      ishide: "0",
      autoFocus: true,
      isLoading: false,
      loading: true,
      isdisabled: false,
      systemUser: app.globalData.systemUser,
      problemId: options.id
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    wx.hideToast()
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var that = this;
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


    var myInterval = setInterval(getReturn, 500); ////半秒定时查询
    function getReturn() {
      wx.getStorage({
        key: 'user_openid',
        success: function (ress) {
          if (ress.data) {
            clearInterval(myInterval)
            that.setData({
              loading: true
            })
          }
        }
      })
    }
  },

  bindTypeChange: function (e) {
    this.setData({
      typeIndex: e.detail.value
    })
  },


  //表单验证
  showTopTips: function () {
    var that = this;
    this.setData({
      showTopTips: true
    });
    setTimeout(function () {
      that.setData({
        showTopTips: false
      });
    }, 3000);
  },
  //提交表单
  submitForm: function (e) {
    var that = this;

    var problemId= this.data.problem.id;
    var title = this.data.problem.title;
    var answer = e.detail.value.content;
    var userId = this.data.systemUser.userId;
    var createBy = this.data.systemUser.userName;

    //先进行表单非空验证
    if (answer == "") {
      this.setData({
        showTopTips: true,
        TopTips: '请输入回答内容'
      });
    } else {
      console.log('校验完毕');
      that.setData({
        isLoading: true,
        isdisabled: true
      })

      wx.request({
        url: app.serverUrl + 'module/answer/add',
        data: {
          problemId: problemId,
          title: title,
          answer: answer,
          userId: userId,
          createBy: createBy
        },
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        method: 'POST',
        //服务端的回掉
        success: function (result) {
          that.setData({
            isLoading: false,
            isdisabled: false
          })

          common.dataLoading("回答成功", "success", function () {
            //重置表单
            that.setData({
              title: '',
              typeIndex: 0,
              content: "",
              contactValue: '',
              noteNowLen: 0,
              showInput: false,
              src: "",
              isSrc: false,
              codeSrc: "",
              isCodeSrc: false

            })
          });

        }, error: function (result, error) {
          //添加失败
          console.log("发布失败=" + error);
          common.dataLoading("发起失败", "loading");
          that.setData({
            isLoading: false,
            isdisabled: false
          })
        }
      });
    }
    setTimeout(function () {
      that.setData({
        showTopTips: false
      });
    }, 1000);
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

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
