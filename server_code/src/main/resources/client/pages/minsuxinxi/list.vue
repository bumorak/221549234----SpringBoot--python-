<template>
<mescroll-uni @init="mescrollInit" :up="upOption" :down="downOption" @down="downCallback" @up="upCallback">
	<view class="content">
		<view :style='{"minHeight":"100vh","width":"100%","padding":"20rpx 0 0 0","position":"relative","background":"#ffffff","height":"100%"}'>
			<view :style='{"width":"calc(98% - 120rpx)","position":"relative","alignItems":"center","justifyContent":"space-between","display":"flex"}'>
				<view :style='{"backgroundColor":"#f5f5f5","margin":"0 30rpx 0 30rpx","color":"#333333","alignItems":"center","borderRadius":"40rpx","flex":"1","display":"flex","lineHeight":"64rpx","fontSize":"24rpx","height":"64rpx"}'>
					<text class="iconfont icon-sousuo1" :style='{"margin":"0 16rpx 0 16rpx"}'></text>
					<input v-model="searchForm.fangjianmingcheng" type="text" placeholder="房间名称" :style='{"background":"transparent","height":"100%"}'></input>
				</view>
				<button @tap="search" :style='{"border":"0px","padding":"0 40rpx 0 40rpx","margin":"0 20rpx 0 0px","borderRadius":"40rpx","color":"#fff","background":"#3da742","fontSize":"28rpx","lineHeight":"64rpx","height":"64rpx"}'>搜索</button>
			</view>
			<view :style='{"width":"100%","flexWrap":"wrap","background":"#ffffff","justifyContent":"space-between","display":"flex","height":"auto"}'>

			
			<!-- 样式2 -->
			<view class="list" :style='{"width":"100%","padding":"40rpx 24rpx 24rpx 24rpx","margin":"20rpx 0 0 0","flex":"1","height":"auto"}'>
				<view @tap="onDetailTap(product)" class="listm flex flex-between" :style='{"boxShadow":"0 0px 0px #00000020","padding":"0 0 20rpx 0","margin":"0 0 40rpx 0","borderColor":"#cccccc","flexWrap":"wrap","borderWidth":"0 0 2rpx 0","display":"flex","width":"100%","borderStyle":"dashed","justifyContent":"space-between","height":"auto"}' v-for="(product,index) in list" :key="index">
				  <image :style='{"margin":"0 20rpx 0 0","objectFit":"cover","borderRadius":"8rpx","display":"block","width":"200rpx","height":"200rpx","order":"2"}' mode="aspectFill" class="listmpic" v-if="preHttp(product.fangjiantupian)" :src="product.fangjiantupian.split(',')[0]"></image>
				  <image :style='{"margin":"0 20rpx 0 0","objectFit":"cover","borderRadius":"8rpx","display":"block","width":"200rpx","height":"200rpx","order":"2"}' mode="aspectFill" class="listmpic" v-else :src="product.fangjiantupian?baseUrl+product.fangjiantupian.split(',')[0]:''"></image>

				  <view class="listmr" :style='{"width":"calc(100% - 240rpx)","padding":"0 0 0 0","margin":"20rpx 0 0 0","height":"auto"}'>
					<view class="col3 f30 elip mb15" :style='{"padding":"0 20rpx 0 20rpx","margin":"0 0 12rpx","overflow":"hidden","whiteSpace":"nowrap","color":"#333","borderRadius":"8rpx","background":"#ffffff","width":"100%","lineHeight":"60rpx","fontSize":"28rpx","textOverflow":"ellipsis","height":"60rpx"}'>{{product.fangjianmingcheng}}</view>
					<view class="col3 f30 elip mb15" :style='{"padding":"0 20rpx 0 20rpx","margin":"0 0 12rpx","overflow":"hidden","whiteSpace":"nowrap","color":"#333","borderRadius":"8rpx","background":"#ffffff","width":"100%","lineHeight":"60rpx","fontSize":"28rpx","textOverflow":"ellipsis","height":"60rpx"}'>一晚价格:{{product.yiwanjiage}}</view>
					<view class="col3 f30 elip mb15" :style='{"padding":"0 20rpx 0 20rpx","margin":"0 0 12rpx","overflow":"hidden","whiteSpace":"nowrap","color":"#333","borderRadius":"8rpx","background":"#ffffff","width":"100%","lineHeight":"60rpx","fontSize":"28rpx","textOverflow":"ellipsis","height":"60rpx"}'>民宿名称:{{product.minsumingcheng}}</view>
				  </view>

					<view :style='{"width":"100%","padding":"40rpx 20rpx 40rpx 20rpx","justifyContent":"space-between","display":"flex","height":"auto","order":"5"}'>
						<view :style='{"display":"flex"}' v-if="(userid && isAuth('minsuxinxi','修改')) || (!userid && isAuthFront('minsuxinxi','修改'))" @click.stop="onUpdateTap(product.id)">
							<text :style='{"margin":"0 8rpx 0 0","fontSize":"28rpx","lineHeight":"1","color":"#3da742","display":"inline-block"}' class="iconfont icon-xiugai2" ></text>
							<text :style='{"fontSize":"28rpx","lineHeight":"1","color":"#3da742","display":"inline-block"}'>修改</text>
						</view>
						<view :style='{"display":"flex"}' v-if="(userid && isAuth('minsuxinxi','删除')) || (!userid && isAuthFront('minsuxinxi','删除'))" @click.stop="onDeleteTap(product.id)">
							<text :style='{"margin":"0 8rpx 0 0","fontSize":"28rpx","lineHeight":"1","color":"#cc0000","display":"inline-block"}' class="iconfont icon-shanchu4" ></text>
							<text :style='{"fontSize":"28rpx","lineHeight":"1","color":"#cc0000","display":"inline-block"}'>删除</text>
						</view>
					</view>
				</view>
			</view>
			
			
			
			

			<scroll-view scroll-y="true" class="category-three" :style='{"minHeight":"100vh","width":"200rpx","margin":"40rpx 0 0 20rpx","background":"#3da74210","height":"100%","order":"2"}'>
				<view :class='categoryName === item.minsuleixing ? "active" : ""' class="tab" v-for="(item,index) in categoryList" :key="index" @tap="categoryClick(item.minsuleixing)">{{item.minsuleixing}}</view>
			</scroll-view>
			</view>
			
			
			
		</view>
		<button :style='{"margin":"20rpx 2% 0 0","borderColor":"#eeeeee","borderRadius":"40rpx","textAlign":"center","background":"#ffffff","borderWidth":"2rpx 2rpx 2rpx 2rpx","width":"100rpx","lineHeight":"64rpx","fontSize":"28rpx","borderStyle":"solid","height":"64rpx"}' class="add-btn" @click="screenBoxShow=true">筛选</button>
		<button :style='{"border":"0","boxShadow":"0 0px 0px #cccccc","color":"#ffffff","bottom":"120rpx","right":"120rpx","outline":"none","borderRadius":"100%","background":"#3da742","width":"80rpx","lineHeight":"80rpx","fontSize":"26rpx","position":"fixed","height":"80rpx","zIndex":"999"}' v-if="userid && isAuth('minsuxinxi','新增')" class="add-btn" @click="onAddTap()">新增</button>
		<button :style='{"border":"0","boxShadow":"0 0px 0px #cccccc","color":"#ffffff","bottom":"120rpx","right":"120rpx","outline":"none","borderRadius":"100%","background":"#3da742","width":"80rpx","lineHeight":"80rpx","fontSize":"26rpx","position":"fixed","height":"80rpx","zIndex":"999"}' v-if="!userid && isAuthFront('minsuxinxi','新增')" class="add-btn" @click="onAddTap()">新增</button>
	</view>
	<view class="screenBoxBG" v-if="screenBoxShow" @click="screenBoxShow=false"></view>
	<view :style='{"width":"80%","padding":"40rpx 20rpx","background":"#d1f1ed"}' class="screenBox" :class="screenBoxShow?'screenBoxActive':''">
		<view :style='{"width":"100%","padding":"20rpx 0 20rpx 0"}'>
			<view :style='{"width":"100%","padding":"0 0 20rpx 20rpx","fontSize":"24rpx"}'>房间类型</view>
			<view :style='{"width":"100%","flexWrap":"wrap","justifyContent":"space-around","display":"flex"}'>
				<view @click="fangjianleixingChange(item)" v-for="(item,index) in fangjianleixingOptions" :key="index" class="screenTab" :class="searchForm.fangjianleixing==item?'screenTabActive':''">{{item}}</view>
			</view>
		</view>
		<view :style='{"width":"100%","padding":"0 24rpx 0 24rpx","margin":"110rpx 0 0 0","alignItems":"center","justifyContent":"flex-start","display":"flex"}'>
			<button :style='{"margin":"0 20rpx 0 0","color":"#888888","borderRadius":"60rpx","textAlign":"center","background":"#ffffff","width":"30%","lineHeight":"60rpx","height":"60rpx","order":"2"}' @click="screenReset">重置</button>
			<button :style='{"margin":"0 20rpx 0 0","color":"#333333","borderRadius":"60rpx","textAlign":"center","background":"#75ebde","width":"30%","lineHeight":"60rpx","height":"60rpx","order":"1"}' @click="search">确定</button>
		</view>
	</view>
</mescroll-uni>
</template>

<script>
	export default {
		data() {
			return {
				btnColor: ['#409eff','#67c23a','#909399','#e6a23c','#f56c6c','#356c6c','#351c6c','#f093a9','#a7c23a','#104eff','#10441f','#a21233','#503319'],
				fangjianleixingOptions:[],
				list: [],
				lists: [],
                userid: '',
				mescroll: null, //mescroll实例对象
				downOption: {
					auto: false //是否在初始化后,自动执行下拉回调callback; 默认true
				},
				upOption: {
					noMoreSize: 5, //如果列表已无数据,可设置列表的总数量要大于半页才显示无更多数据;避免列表数据过少(比如只有一条数据),显示无更多数据会不好看; 默认5
					textNoMore: '~ 没有更多了 ~',
				},
				hasNext: true,
				searchForm:{},
				categoryList:[],
				categoryName :'全部',
				CustomBar: '0',
				screenBoxShow:false
			};
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			}
		},
		async onShow() {
            if(uni.getStorageSync("useridTag")==1){
                this.userid=uni.getStorageSync("useridTag");
                uni.removeStorageSync("useridTag");
            } else {
                this.userid = "";
            }
			this.btnColor = this.btnColor.sort(()=> {
                                return (0.5-Math.random());
                        });
            let res = {};
            if(this.userid) {
                res = await this.$api.page('minsuleixing', {page:1,limit:100});
            } else {
                res = await this.$api.list('minsuleixing', {page:1,limit:100});
            }
			res.data.list.splice(0,0,{id:0,minsuleixing:'全部'})
			this.categoryList = res.data.list;
			this.hasNext = true
			// 重新加载数据
			if (this.mescroll) this.mescroll.resetUpScroll()
		},
		async onLoad(options) {
            if(uni.getStorageSync("useridTag")==1){
                this.userid=uni.getStorageSync("useridTag");
                uni.removeStorageSync("useridTag");
            } else {
                this.userid = "";
            }
			this.hasNext = true
			// 重新加载数据
			if (this.mescroll) this.mescroll.resetUpScroll()
			let res = {};
			this.fangjianleixingOptions = '单人间,大床房,双人间,三人间,标准套间,豪华套间'.split(',')
		},
		methods: {
			
			fangjianleixingChange(e){
				this.searchForm.fangjianleixing = e
				this.$forceUpdate()
			},
			screenReset(){
				this.searchForm = {}
				this.$forceUpdate()
			},
            priceChange(price) {
                return Number(price).toFixed(2);
            },
            preHttp(str) {
                return str && str.substr(0,4)=='http';
            },
			//查询条件切换
			queryChange(e) {
				this.queryIndex=e.detail.value;
				this.searchForm.fangjianmingcheng="";
				this.searchForm.fangjianleixing="";
			},
			//类别搜索
			categoryClick(categoryName){
				this.categoryName = categoryName;
				this.mescroll.resetUpScroll();
			},
			// mescroll组件初始化的回调,可获取到mescroll对象
			mescrollInit(mescroll) {
				this.mescroll = mescroll;
			},
			/*下拉刷新的回调 */
			downCallback(mescroll) {
				this.hasNext = true
				// 重置分页参数页数为1
				mescroll.resetUpScroll()
			},
			/*上拉加载的回调: mescroll携带page的参数, 其中num:当前页 从1开始, size:每页数据条数,默认10 */
			async upCallback(mescroll) {
				let params = {
					page: mescroll.num,
					limit: mescroll.size
				}

				if(this.categoryName!='全部'){
					params.minsuleixing = '%' + this.categoryName + '%'
				}

				if(this.searchForm.fangjianmingcheng){
					params['fangjianmingcheng'] = '%' + this.searchForm.fangjianmingcheng + '%'
				}
				if(this.searchForm.fangjianleixing){
					params['fangjianleixing'] = '%' + this.searchForm.fangjianleixing + '%'
				}



                let res = {}
                if(this.userid) {
                    res = await this.$api.page(`minsuxinxi`, params);
                } else {
                    res = await this.$api.list(`minsuxinxi`, params);
                }
				// 如果是第一页数据置空
				if (mescroll.num == 1) this.list = [];
				this.list = this.list.concat(res.data.list);
				let length = Math.ceil(this.list.length/6)
				let arr = [];
				for (let i = 0; i<length; i++){
					arr[i] = this.list.slice(i*6, (i+1)*6)
				}
				this.lists = arr
				if (res.data.list.length == 0) this.hasNext = false;
				mescroll.endSuccess(mescroll.size, this.hasNext);
			},
			// 详情
			onDetailTap(item) {
                uni.setStorageSync("useridTag",this.userid);
				this.$utils.jump(`./detail?id=${item.id}&userid=`+this.userid)
			},
			// 修改
			onUpdateTap(id){
                uni.setStorageSync("useridTag",this.userid);
				this.$utils.jump(`./add-or-update?id=${id}`)
			},
			// 添加
			onAddTap(){
                uni.setStorageSync("useridTag",this.userid);
				this.$utils.jump(`./add-or-update`)
			},
			onDeleteTap(id){
				var _this = this;
				uni.showModal({
					title: '提示',
					content: '是否确认删除',
					success: async function(res) {
						if (res.confirm) {
							await _this.$api.del('minsuxinxi', JSON.stringify([id]));
							_this.hasNext = true
							// 重置分页参数页数为1
							_this.mescroll.resetUpScroll()
						}
					}
				});
			},
			// 搜索
			async search(){
				this.mescroll.num = 1
				let searchForm = {
					page: this.mescroll.num,
					limit: this.mescroll.size
				}
				if(this.searchForm.fangjianmingcheng){
					searchForm['fangjianmingcheng'] = '%' + this.searchForm.fangjianmingcheng + '%'
				}
				if(this.searchForm.fangjianleixing){
					searchForm['fangjianleixing'] = this.searchForm.fangjianleixing
				}
                let res = {};
                if(this.userid) {
                    res = await this.$api.page(`minsuxinxi`, searchForm);
                } else {
                    res = await this.$api.list(`minsuxinxi`, searchForm);
                }
				// 如果是第一页数据置空
				if (this.mescroll.num == 1) this.list = [];
				this.list = this.list.concat(res.data.list);
				let length = Math.ceil(this.list.length/6)
				let arr = [];
				for (let i = 0; i<length; i++){
					arr[i] = this.list.slice(i*6, (i+1)*6)
				}
				this.lists = arr
				if (res.data.list.length == 0) this.hasNext = false;
				this.mescroll.endSuccess(this.mescroll.size, this.hasNext);
				this.screenBoxShow = false
			}
		}
	};
</script>

<style lang="scss" scoped>
	.content {
		min-height: calc(100vh - 44px);
		box-sizing: border-box;
	}
	
	.category-one .tab {
		cursor: pointer;
		padding: 0 20rpx 0 20rpx;
		color: #333333;
		background: #ffffff;
		display: inline-block;
		width: auto;
		font-size: 28rpx;
		line-height: 80rpx;
		height: 80rpx;
	}
	
	.category-one .tab.active {
		cursor: pointer;
		padding: 0 20rpx 0 20rpx;
		color: #ffffff;
		background: #1D5DCA;
		display: inline-block;
		width: auto;
		font-size: 28rpx;
		line-height: 80rpx;
	}
	
	.category-two .tab {
		cursor: pointer;
		padding: 0 0 0 0;
		margin: 0 0 24rpx;
		color: #333;
		background: url(http://chy2.gdnxeco.com/20230914/9a307f891d964f0cb446d562b4d23d72.png) no-repeat right center,#06988830;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
		height: 80rpx;
	}
	
	.category-two .tab.active {
		cursor: pointer;
		padding: 0 0 0 0;
		margin: 0 0 24rpx;
		color: #fff;
		background: url(http://chy2.gdnxeco.com/20230914/9a307f891d964f0cb446d562b4d23d72.png) no-repeat right center,#069888;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
	}
	
	.category-three .tab {
		cursor: pointer;
		padding: 0 20rpx;
		margin: 0 0 24rpx;
		color: #333;
		background: none;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
		height: 80rpx;
	}
	
	.category-three .tab.active {
		cursor: pointer;
		padding: 0 20rpx;
		margin: 0 0 24rpx;
		color: #fff;
		background: #3da742;
		display: inline-block;
		width: 100%;
		font-size: 28rpx;
		line-height: 80rpx;
		text-align: center;
	}
	.screenBoxBG {
		position: fixed;
		width: 100%;
		height: 100%;
		z-index: 665;
		top: 0;
		left: 0;
		background: rgba(0, 0, 0, .3);
	}
	
	.screenBox {
		width: 80%;
		position: fixed;
		height: 100%;
		right: 0;
		top: 0;
		z-index: 666;
		-webkit-transform: translate3d(100%, 0, 0);
		transform: translate3d(100%, 0, 0);
		transition: transform .3s;
		overflow-y: scroll;
		.screenTab{
			border-radius: 40rpx;
			margin: 10rpx 0 10rpx 0;
			color: #666666;
			background: #ffffff;
			width: calc(100% / 3 - 24rpx);
			line-height: 72rpx;
			text-align: center;
		}
		.screenTabActive{
			border-radius: 40rpx;
			margin: 10rpx 0 10rpx 0;
			color: #333333;
			background: #75ebde;
			width: calc(100% / 3 - 20rpx);
			line-height: 72rpx;
			text-align: center;
		}
	}
	
	.screenBoxActive {
		-webkit-transform: translate3d(0%, 0, 0);
		transform: translate3d(0%, 0, 0);
	}
</style>
