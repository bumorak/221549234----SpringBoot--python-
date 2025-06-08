// pages/edit/edit.js
const {
detail,
option,
update,
add,
list,
    follow,
    faceMatch,
    session,
    rubbish,
    baiduIdentify
} = require("../../api/index.js")

const des = require('../../utils/des.js')
const utils = require("../../utils/index.js")

Page({

/**
* 页面的初始数据
*/
data: {
    baseURL:'',
    sessionReadArr:[],

detailList: null,
id: "",
cross:"",
ruleForm:{},
userid:getApp().globalData.userInfo.id,
userInfo:getApp().globalData.userInfo,
ro:{
},

    fangjianmingcheng:"",
    fangjiantupian:"",
        fangjianleixingList:"单人间,大床房,双人间,三人间,标准套间,豪华套间".split(','),
        fangjianleixingIndex:null,
    yiwanjiage:"",
    fuwudianhua:"",
storeupnum: '0',
    minsumingcheng:"",
    minsudizhi:"",
        minsuleixingList:"${column.customize}".split(','),
        minsuleixingIndex:null,
},

    // 监听 yiwanjiage 字段的变化
    watch: {

    },
/**
* 生命周期函数--监听页面加载
*/
async onLoad(options) {
    if(!this.data.userid){
        let nowTable = wx.getStorageSync("nowTable");
        const res = await session(nowTable)
        getApp().globalData.userInfo=res.data
    }
    let baseURL =wx.getStorageSync('baseURL') + '/'
const id = getApp().globalData.detailId
    this.setData({
        refid:id,
        baseURL
    })
//人脸识别
this.setData({
        fangjianleixingList:  "单人间,大床房,双人间,三人间,标准套间,豪华套间".split(',')
})

const minsuleixingres = await option('minsuleixing/minsuleixing')
        minsuleixingres.data.unshift('请选择民宿类型')
this.setData({
        minsuleixingList: minsuleixingres.data
})


let  ro=this.data.ro
if(options?.cross){
var obj = wx.getStorageSync('crossObj');
for (var o in obj){
if(o=='fangjianmingcheng'){
this.setData({
  'ruleForm.fangjianmingcheng' : obj[o],
})
ro.fangjianmingcheng = true;
continue;
}
if(o=='fangjiantupian'){
this.setData({
  fangjiantupianPath :baseURL+ obj[o].split(",")[0],
})
ro.fangjiantupian = true;
continue;
}
if(o=='fangjianleixing'){
this.setData({
  'ruleForm.fangjianleixing' : obj[o],
})
ro.fangjianleixing = true;
continue;
}
if(o=='yiwanjiage'){
this.setData({
  'ruleForm.yiwanjiage' : obj[o],
})
ro.yiwanjiage = true;
continue;
}
if(o=='fuwudianhua'){
this.setData({
  'ruleForm.fuwudianhua' : obj[o],
})
ro.fuwudianhua = true;
continue;
}
if(o=='fangneisheshi'){
this.setData({
  'ruleForm.fangneisheshi' : obj[o],
})
ro.fangneisheshi = true;
continue;
}
if(o=='storeupnum'){
this.setData({
  'ruleForm.storeupnum' : obj[o],
})
ro.storeupnum = true;
continue;
}
if(o=='minsumingcheng'){
this.setData({
  'ruleForm.minsumingcheng' : obj[o],
})
ro.minsumingcheng = true;
continue;
}
if(o=='minsudizhi'){
this.setData({
  'ruleForm.minsudizhi' : obj[o],
})
ro.minsudizhi = true;
continue;
}
if(o=='minsuleixing'){
this.setData({
  'ruleForm.minsuleixing' : obj[o],
})
ro.minsuleixing = true;
continue;
}
}
  let  statusColumnName=wx.getStorageSync('statusColumnName');
    statusColumnName=statusColumnName.replace('[',"").replace(']',"");
    this.setData({
        ro,
        cross:options?.cross,
        statusColumnName
    })
}

if(id){
// 如果上一级页面传递了id，获取改id数据信息
const   data=getApp().globalData.detailList
const  def_3= null  ;
    this.data.fangjianleixingList.map((v, index) => {
        if (v == data.fangjianleixing|| (v == def_3 && def_3 !=null)) {
            this.setData({
                    fangjianleixingIndex: index,
                    fangjianleixing: v
            })
        }else if (this.data.fangjianleixingList.length == 1) {
            this.setData({
                    fangjianleixingIndex: 0,
                    fangjianleixing: v,
                    fangjianleixingList:[def_3]
            })
        }
    })


        minsuleixingres.data.map((item, index) => {
        if (item == data.minsuleixing) {
            this.setData({
                    minsuleixingIndex: index,
                    minsuleixing: item
            })
        }else if (this.data.minsuleixingList.length == 1) {
            this.setData({
                    minsuleixingIndex: 0,
                    minsuleixing: v
            })
        }
    })




const url = wx.getStorageSync("baseURL") + "/"
const detailList = data
this.setData({
detailList,
     fangjianmingcheng: data.fangjianmingcheng,
        fangjiantupian:data?.fangjiantupian?.split(',')[0],
        fangjiantupianPath:baseURL+data?.fangjiantupian?.split(',')[0],
     yiwanjiage: data.yiwanjiage,
     fuwudianhua: data.fuwudianhua,
     fangneisheshi: data.fangneisheshi,
        storeupnum: '0',

     minsumingcheng: data.minsumingcheng,
     minsudizhi: data.minsudizhi,

});
//ss读取
let c = this.data
this.setData({
});

}else {
    this.setData({
    })
}



// ss读取
let sessionReadArr=[]

this.setData({
cross:options?.cross,
ro,
id,
 sessionReadArr

})




},

getUUID () {
return new Date().getTime();
},
onUnload: function () {
console.log('页面被卸载，执行销毁操作');
},
onShow() {










},





















uploadfangjiantupian() {
wx.chooseImage({
count: 1,
sizeType: ['compressed'],
sourceType: ['album', 'camera'],
success: async (res) => {
    const tempFilePaths = res.tempFilePaths;
    // 本地临时图片的路径
    this.setData({
            fangjiantupianPath: tempFilePaths[0]
    })
    let _this = this;
    // 上传网络图片
    const baseURL = wx.getStorageSync('baseURL')
    wx.uploadFile({
        url: `${baseURL}/file/upload`,
        filePath: res.tempFilePaths[0],
        name: 'file',
        header: {
            'Token': wx.getStorageSync('token')
        },
        success: (uploadFileRes) => {
            let result = JSON.parse(uploadFileRes.data);
            // result.file是上传成功为网络图片的名称
            if (result.code == 0) {
                this.setData({
                        fangjiantupian: 'file/' + result.file
                })
            } else {
                wx.showToast({
                    title: result.msg,
                    icon: 'none',
                    duration: 2000
                });
            }
        }
    })

    this.setData({
        face: tempFilePaths[0]
    });

}
})
},








async fangjianleixingChange(e) {
    const selectedIndex = e.detail.value;
    let  fangjianleixing=this.data.fangjianleixingList[selectedIndex]
    this.setData({
            fangjianleixingIndex: selectedIndex,
            fangjianleixing
    });},
























































async minsuleixingChange(e) {
    const selectedIndex = e.detail.value;
    let  minsuleixing=this.data.minsuleixingList[selectedIndex]
    this.setData({
            minsuleixingIndex: selectedIndex,
            minsuleixing
    });},






async submit() {
    let that = this
    var query = wx.createSelectorQuery();











    const baseURL = wx.getStorageSync('baseURL') + "/"
    const regex = new RegExp(baseURL, "g");
const obj={
    fangjianmingcheng: this.data. fangjianmingcheng,
        fangjiantupian:this.data.fangjiantupian?.replace(regex, ""),
    fangjianleixing: this.data. fangjianleixing,
    yiwanjiage: this.data. yiwanjiage,
    fuwudianhua: this.data. fuwudianhua,
        fangneisheshi: getApp().globalData.editorContent,
    storeupnum: this.data. storeupnum,
    minsumingcheng: this.data. minsumingcheng,
    minsudizhi: this.data. minsudizhi,
    minsuleixing: this.data. minsuleixing,
}
const detailId= getApp().globalData.detailId
const tableName= `minsuxinxi`

//跨表计算判断
    var obj2;
    var  ruleForm=obj
    obj2 = ruleForm
    this.data.refid==""? ruleForm['refid']= getApp().globalData.detailId:""
    ruleForm['userid']=getApp().globalData.userInfo.id
    var userInfo=getApp().globalData.userInfo


const sessionReadArr=this.data.sessionReadArr
                            ruleForm['fangjianmingcheng']=this.data.fangjianmingcheng











                            ruleForm['fangjianleixing']=this.data.fangjianleixing



    if(this.data.fangjianleixingList[this.data.fangjianleixingIndex]==undefined ){
        wx.showToast({
            icon: "none",
            title: `房间类型不能为空`,
        })
        return
    }




                            ruleForm['yiwanjiage']=this.data.yiwanjiage















   let fangneisheshi=  getApp().globalData.editorContent
    ruleForm['fangneisheshi']=getApp().globalData.editorContent
    if(fangneisheshi==='' ){
        wx.showToast({
            icon: "none",
            title: `房内设施不能为空`,
        })
        return
    }




                            ruleForm['minsumingcheng']=this.data.minsumingcheng







                            ruleForm['minsudizhi']=this.data.minsudizhi







    if(this.data.minsuleixingList[this.data.minsuleixingIndex]==undefined ){
        wx.showToast({
            icon: "none",
            title: `民宿类型不能为空`,
        })
        return
    }







    //更新跨表属性
    var crossuserid;
    var crossrefid;
    var crossoptnum;

    if(this.data.cross) {
        wx.setStorageSync('crossCleanType', true);
        var statusColumnName = wx.getStorageSync('statusColumnName');
        if (statusColumnName != '') {
                obj2 = wx.getStorageSync('crossObj');
            if (!statusColumnName.startsWith("[")) {
                for (var o in obj2) {
                    if (o == statusColumnName) {
                        obj2[o] = statusColumnValue;
                    }

                }
                var table = wx.getStorageSync('crossTable');
                 await update(table, obj2)
            } else {

                crossuserid =getApp().globalData.userInfo.id
                crossrefid =  this.data.id
                crossoptnum = wx.getStorageSync('statusColumnName');
                crossoptnum = crossoptnum.replace(/\[/, "").replace(/\]/, "");
                            }
        }
    }
    this.data.cross ? (crossrefid = this.data.id, crossuserid = getApp().globalData.userInfo.id) : ""

        if(crossrefid && crossuserid) {
            ruleForm['crossuserid'] = getApp().globalData.userInfo.id
            ruleForm['crossrefid'] =this.data.id

            this.setData({
                ruleForm
            })
            let params = {
                page: 1,
                limit: 10,
                crossuserid: crossuserid,
                crossrefid: crossrefid,
            }
                        const tips = wx.getStorageSync('tips')
            let corssRes = await list(`minsuxinxi`, params)
            crossoptnum = wx.getStorageSync('statusColumnName');
            crossoptnum = crossoptnum.match(/\d+/g);
            if (corssRes.data.total >= parseInt(crossoptnum)) {
                wx.showToast({
                    icon: "none",
                    title: tips,
                })
                                wx.removeStorageSync('crossCleanType');
                return ;
            }
            else {


//跨表计算










if (ruleForm.id) {
await update(`minsuxinxi`, ruleForm)
}
else {
await add(`minsuxinxi`, ruleForm)
            }
        }


        }
        else {


//跨表计算
if (ruleForm.id) {
await update(`minsuxinxi`, ruleForm)
}
else {
await add(`minsuxinxi`, ruleForm)
            }
        }
getApp().globalData.editorContent=''
wx.showToast({
title: '提交成功',
icon: "none"
})
    const preId = getApp().globalData.detailId


        let res = await detail(table, preId)
    if(res){
        getApp().globalData.detailList = res.data
    }


            wx.navigateBack({
                delta: 1,
                complete: () => {
                    // 触发事件通知，传递需要更新的数据
                    const pages = getCurrentPages();
                    if (pages.length >= 1) {
                        const prePage = pages[pages.length - 1];
                        prePage.onLoad(); //
                    }
                }
            })













 },

onHide() {

},

/**
* 生命周期函数--监听页面卸载
*/
onUnload() {

},


/**
* 页面相关事件处理函数--监听用户下拉动作
*/
onPullDownRefresh() {

},

/**
* 页面上拉触底事件的处理函数
*/
onReachBottom() {

},

/**
* 用户点击右上角分享
*/
onShareAppMessage() {

}
})