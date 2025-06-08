<template>
<view class="content">
	<view :style='{"width":"100%","flexWrap":"wrap","background":"#ffffff","display":"flex","height":"100%"}'>
		<swiper :style='{"width":"100%","margin":"0 0 20rpx 0","background":"#ffffff","height":"360rpx"}' class="swiper" :indicator-dots='true' :autoplay='true' :circular='true' indicator-active-color='#6484ff' indicator-color='#6484ff30' :duration='500' :interval='5000' :vertical='false'>
			<swiper-item :style='{"width":"100%","background":"#ffffff","height":"100%"}' v-for="(swiper,index) in swiperList" :key="index" @tap="onSwiperTap(swiper)">
				<image :style='{"width":"100%","objectFit":"cover","display":"block","height":"100%"}' mode="aspectFill" :src="baseUrl+swiper.img"></image>
				<view v-if="false" :style='{"width":"100%","padding":"0 8rpx 0 8rpx","lineHeight":"60rpx","fontSize":"28rpx","color":"#333333","background":"#ffffff"}'>{{ swiper.title }}</view>
			</swiper-item>
		</swiper>


		<!-- menu -->
		<view v-if="true" class="menu" :style='{"padding":"20rpx 20rpx 20rpx 40rpx","margin":"40rpx 24rpx 20rpx 24rpx","borderColor":"#eee","borderRadius":"8rpx","flexWrap":"wrap","background":"#ffffff","borderWidth":"8rpx 2rpx 4rpx 2rpx","display":"flex","width":"calc(100% - 48rpx)","borderStyle":"solid","height":"auto"}'>
            <block v-for="item in menuList" v-bind:key="item.roleName">
                <block v-if="role==item.roleName" v-bind:key="index" v-for=" (menu,index) in item.frontMenu">
					<view v-if="menu.childs.length" :style='{"width":"calc(25% - 40rpx)","padding":"12rpx 0 12rpx 0","margin":"0px 40rpx 20rpx 0","borderRadius":"16rpx","height":"auto"}' class="menu-list" @tap="menuClick(menu,index)">
						<view class="iconarr" :class="menu.fontClass" :style='{"padding":"0 0 0 0","boxShadow":"2rpx 4rpx 8rpx #dddddd","margin":"0 auto 0 auto","color":"#3da742","borderRadius":"100%","textAlign":"center","background":"#f6f6f6","display":"block","width":"96rpx","lineHeight":"96rpx","fontSize":"64rpx","height":"96rpx"}'></view>
						<view :style='{"padding":"0 0 0 0","margin":"0px auto 0 auto","color":"#333333","textAlign":"center","width":"100%","lineHeight":"60rpx","fontSize":"28rpx"}'>{{menu.menu}}</view>
					</view>
                </block>
            </block>
		</view>
		<!-- menu -->
		
		

		<!-- 商品推荐 -->
		<!-- 商品推荐 -->
		
		

		<!-- 商品列表 -->
																										<view class="listBox list" :style='{"width":"100%","margin":"40rpx 0 40rpx 0","background":"#ffffff","order":"4"}'>
			<view v-if="false && 3 == 1" class="idea listIdea" :style='{"width":"100%","padding":"40rpx","flexWrap":"wrap","background":"url(http://codegen.caihongy.cn/20230815/1b3e2caf374142fcb4d5bdb9448d4e01.png) no-repeat center bottom / cover","display":"block","height":"360rpx"}'>
				<view :style='{"width":"100%","margin":"100rpx 0 0 0","textAlign":"center","background":"none","display":"block","height":"48rpx"}' class="box box1">不后悔过往，不浪费现在</view>
				<view :style='{"width":"100%","textAlign":"center","background":"none","display":"block","height":"48rpx"}' class="box box2">满怀梦想，面对未来</view>
				<view :style='{"width":"20%","background":"#ffffff","display":"none","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#ffffff","display":"none","height":"160rpx"}' class="box box4"></view>
			</view>
		  
			<view class="title" :style='{"width":"calc(100% - 48rpx)","padding":"36rpx 32rpx 0 32rpx","margin":"0 24rpx 24rpx 24rpx","textAlign":"center","background":"url(http://clfile.zggen.cn/20231028/74e78759bf154422b3874986fcd108c1.png) no-repeat center top","height":"auto"}'>
				<view :style='{"padding":"12rpx 60rpx 8rpx 60rpx","color":"#fff","borderRadius":"8rpx","background":"#3da742","display":"inline-block","fontSize":"32rpx","lineHeight":"48rpx","minWidth":"300rpx","fontWeight":"500"}'>民宿信息</view>
				<text :style='{"width":"100%","margin":"20rpx 0 0 0","fontSize":"28rpx","lineHeight":"48rpx","color":"#666","display":"block"}' @tap="onPageTap('minsuxinxi')">查看更多</text>
			</view>
			
			<view v-if="false && 3 == 2" class="idea listIdea" :style='{"width":"100%","padding":"40rpx","flexWrap":"wrap","background":"url(http://codegen.caihongy.cn/20230815/1b3e2caf374142fcb4d5bdb9448d4e01.png) no-repeat center bottom / cover","display":"block","height":"360rpx"}'>
				<view :style='{"width":"100%","margin":"100rpx 0 0 0","textAlign":"center","background":"none","display":"block","height":"48rpx"}' class="box box1">不后悔过往，不浪费现在</view>
				<view :style='{"width":"100%","textAlign":"center","background":"none","display":"block","height":"48rpx"}' class="box box2">满怀梦想，面对未来</view>
				<view :style='{"width":"20%","background":"#ffffff","display":"none","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#ffffff","display":"none","height":"160rpx"}' class="box box4"></view>
			</view>
			
		  		  <!-- 样式1 -->
		  <view class="list-box style1" :style='{"padding":"24rpx 24rpx 24rpx 24rpx","margin":"0 0 0 0","flexWrap":"wrap","display":"flex","width":"100%","justifyContent":"space-between","height":"auto"}'>
			<view @tap="onDetailTap('minsuxinxi',product.id)" v-for="(product,index) in homeminsuxinxilist" :key="index" class="list-item" :style='{"border":"2rpx solid #3da74250","boxShadow":"0 0px 0px #cccccc","padding":"20rpx","margin":"0 0 40rpx 0","backgroundColor":"#ffffff","borderRadius":"8rpx","textAlign":"center","flexWrap":"wrap","display":"flex","width":"48%","justifyContent":"center","height":"auto"}'>
			                			  <view :style='{"padding":"0px 20rpx 0px 20rpx","margin":"0 0 20rpx 0","overflow":"hidden","whiteSpace":"nowrap","color":"#333333","borderRadius":"0px","width":"100%","fontSize":"28rpx","lineHeight":"48rpx","textOverflow":"ellipsis","height":"48rpx"}' class="list-item-title ">{{product.fangjianmingcheng}}</view>
			  			  			  			                			  			  <image :style='{"padding":"0 0 0 0","margin":"0 0 20rpx 0","objectFit":"cover","borderRadius":"0px","display":"inline-block","width":"100%","height":"200rpx"}' class="list-item-image" mode="aspectFill" v-if="product.fangjiantupian.substring(0,4)=='http'" :src="product.fangjiantupian"></image>
			  <image :style='{"padding":"0 0 0 0","margin":"0 0 20rpx 0","objectFit":"cover","borderRadius":"0px","display":"inline-block","width":"100%","height":"200rpx"}' class="list-item-image" mode="aspectFill" v-else :src="product.fangjiantupian?baseUrl+product.fangjiantupian.split(',')[0]:''"></image>
			  			  			                			  			  			                			  <view :style='{"padding":"0px 20rpx 0px 20rpx","margin":"0 0 20rpx 0","overflow":"hidden","whiteSpace":"nowrap","color":"#333333","borderRadius":"0px","width":"100%","fontSize":"28rpx","lineHeight":"48rpx","textOverflow":"ellipsis","height":"48rpx"}' class="list-item-title ">一晚价格:{{product.yiwanjiage}}</view>
			  			  			  			                			  			  			                			  			  			                			  			  			                			  <view :style='{"padding":"0px 20rpx 0px 20rpx","margin":"0 0 20rpx 0","overflow":"hidden","whiteSpace":"nowrap","color":"#333333","borderRadius":"0px","width":"100%","fontSize":"28rpx","lineHeight":"48rpx","textOverflow":"ellipsis","height":"48rpx"}' class="list-item-title ">民宿名称:{{product.minsumingcheng}}</view>
			  			  			  			                			  			  			                			  			  			  			</view>
		  </view>
		  		  
		  		  
		  		  
		  		  
		  		  
		  		  
		  		  
		  		  
		  		  
			<view v-if="false && 3 == 3" class="idea listIdea" :style='{"width":"100%","padding":"40rpx","flexWrap":"wrap","background":"url(http://codegen.caihongy.cn/20230815/1b3e2caf374142fcb4d5bdb9448d4e01.png) no-repeat center bottom / cover","display":"block","height":"360rpx"}'>
				<view :style='{"width":"100%","margin":"100rpx 0 0 0","textAlign":"center","background":"none","display":"block","height":"48rpx"}' class="box box1">不后悔过往，不浪费现在</view>
				<view :style='{"width":"100%","textAlign":"center","background":"none","display":"block","height":"48rpx"}' class="box box2">满怀梦想，面对未来</view>
				<view :style='{"width":"20%","background":"#ffffff","display":"none","height":"160rpx"}' class="box box3"></view>
				<view :style='{"width":"20%","background":"#ffffff","display":"none","height":"160rpx"}' class="box box4"></view>
			</view>
		</view>
																						<!-- 商品列表 -->
		
		
		<!-- 新闻资讯 -->
																																												<!-- 新闻资讯 -->
				
		<!-- 系统简介 -->
		<view :style='{"padding":"0 24rpx 60rpx 24rpx","margin":"40rpx 0 40rpx 0","flexWrap":"wrap","background":"#ffffff","display":"flex","width":"100%","justifyContent":"center","height":"auto","order":"3"}'>
		  <view :style='{"padding":"8rpx 60rpx 8rpx 60rpx","margin":"0 0 40rpx 0","color":"#fff","borderRadius":"8rpx","textAlign":"left","background":"#3da742","display":"inline-block","width":"auto","lineHeight":"48rpx","fontSize":"32rpx","fontWeight":"500","order":"1"}'>{{systemIntroductionDetail.title}}</view>
		  <view :style='{"margin":"12rpx 0 20rpx 0","color":"#999999","textAlign":"center","display":"none","width":"100%","lineHeight":"1.5","fontSize":"32rpx"}'>{{systemIntroductionDetail.subtitle}}</view>
		  <view :style='{"padding":"0","margin":"0 2% 0 0","flexWrap":"wrap","display":"flex","width":"40%","float":"left","height":"auto","order":"3"}'>
		    <img :style='{"width":"100%","margin":"0","objectFit":"cover","borderRadius":"8rpx","display":"block","height":"336rpx"}' v-if="systemIntroductionDetail.picture1" :src="baseUrl+systemIntroductionDetail.picture1">
		    <img :style='{"margin":"0 10rpx 0 10rpx","objectFit":"cover","flex":1,"display":"none","height":"160rpx"}' v-if="systemIntroductionDetail.picture2" :src="baseUrl+systemIntroductionDetail.picture2">
		    <img :style='{"margin":"0 10rpx 0 10rpx","objectFit":"cover","flex":1,"display":"none","height":"160rpx"}' v-if="systemIntroductionDetail.picture3" :src="baseUrl+systemIntroductionDetail.picture3">
		  </view>
		  <view :style='{"padding":"0 0 0 0","margin":"0 0 0 0","overflow":"hidden","color":"#666666","background":"#fff","width":"58%","lineHeight":"48rpx","fontSize":"28rpx","float":"left","order":"4","height":"336rpx"}' v-html="systemIntroductionDetail.content"></view>
		  <view :style='{"width":"100%","background":"url(http://clfile.zggen.cn/20231028/74e78759bf154422b3874986fcd108c1.png) no-repeat center top","display":"block","height":"36rpx"}' />
		  <view :style='{"width":"100%","background":"#fff","display":"block","height":"2rpx","order":"2"}' />
		</view>

	</view>
</view>
</template>

<script>
    import menu from '@/utils/menu'
	import '@/assets/css/global-restaurant.css'
	import uniIcons from "@/components/uni-ui/lib/uni-icons/uni-icons.vue"
	export default {
		components: {
			uniIcons
		},
		data() {
			return {
				options2: {
					effect: 'flip',
					loop : true
				},
				options3: {
					effect: 'cube',
					loop : true,
					cubeEffect: {
						shadow: true,
						slideShadows: true,
						shadowOffset: 20,
						shadowScale: 0.94,
					}
				},
				rows: 2,
				column: 4,
                role : '',
                systemIntroductionDetail: {},
                menuList: [],
                swiperMenuList:[],
                user: {},
                tableName:'',

				//轮播
				swiperList: [],
				homeminsuxinxilist: [],
				news: [],
			}
		},
		computed: {
			baseUrl() {
				return this.$base.url;
			}
		},
        async onLoad(){
            this.role = uni.getStorageSync("appRole");
            let table = uni.getStorageSync("nowTable");
            let res = await this.$api.session(table);
            this.user = res.data;
            this.tableName = table;
            let menus = menu.list();
            this.menuList = menus;
            this.menuList.forEach((item,key) => {
                if(this.role==item.roleName) {
                    item.frontMenu.forEach((item2,key2) => {
						if(item2.child.length) {
							item2.childs = []
						    item2.child.forEach((item3,key3)=>{
								if(item3.buttons.indexOf("查看")>-1){
									item2.childs.push(item3)
									this.swiperMenuList.push(item3);
								}
							})
						}
                        
                    })
                }
            })
        },
		async onShow() {
            let res;
			// 轮播图
			let swiperList = []
			res = await this.$api.list('config', {
				page: 1,
				limit: 5
			});
			for (let item of res.data.list) {
				if (item.value && item.value!="" && item.value!=null ) {
					swiperList.push({
						img: item.value,
                        title: item.name
					});
				}
			}
			if (swiperList) {
				this.swiperList = swiperList;
			}
            this.getSystemIntroduction();


			res = await this.$api.list('minsuxinxi', {
				page: 1,

				limit: 4
			});
			this.homeminsuxinxilist = res.data.list
		},

		methods: {

			//轮播图跳转
			onSwiperTap(e) {

			},
            async getSystemIntroduction() {
                let res = await this.$api.info('systemintro', 1)
                this.systemIntroductionDetail = res.data;
            },
			// 新闻详情
			onNewsDetailTap(id) {
				this.$utils.jump(`../news-detail/news-detail?id=${id}`)
			},
			// 推荐列表点击详情
			onDetailTap(tableName, id) {
				this.$utils.jump(`../${tableName}/detail?id=${id}`)
			},
			onPageTap(tableName){
				if(tableName=='news'){
					uni.navigateTo({
						url: `../news-list/news-list`,
						fail: function(){
							uni.switchTab({
								url: `../news-list/news-list`
							});
						}
					});
					return false
				}

				uni.navigateTo({
					url: `../${tableName}/list`,
					fail: function(){
						uni.switchTab({
							url: `../${tableName}/list`
						});
					}
				});
				// this.$utils.jump(`../${tableName}/list`)
			},
			menuClick(menu, index) {
				if (menu.childs.length > 0 && menu.childs.length == 1) {
					uni.navigateTo({
						url: `../${menu.childs[0].tableName}/list`,
						fail: function() {
							uni.switchTab({
								url: `../${menu.childs[0].tableName}/list`
							});
						}
					});
				} else if (menu.childs.length > 1) {
					let arr = []
					for(let x in menu.childs){
						arr.push(menu.childs[x].menu.length>6?menu.childs[x].menu.substring(0,6):menu.childs[x].menu)
					}
					uni.showActionSheet({
						itemList: arr,
						success: function (res) {
							uni.navigateTo({
								url: `../${menu.childs[res.tapIndex].tableName}/list`,
								fail: function() {
									uni.switchTab({
										url: `../${menu.childs[res.tapIndex].tableName}/list`
									});
								}
							});
						}
					});
				}
			},
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		min-height: calc(100vh - 44px);
		box-sizing: border-box;
	}
</style>
