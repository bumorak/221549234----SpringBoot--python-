<template>
	<view class="content">
		<view class="box" :style='{"minHeight":"100vh","width":"100%","padding":"160rpx 44rpx 244rpx 44rpx","background":"url(http://clfile.zggen.cn/20231123/c6d484065a734fe1846d30e79a9f9574.jpg) no-repeat center top / 100% 100%","height":"100%"}'>
			<view :style='{"padding":"0px 48rpx 40rpx 48rpx","boxShadow":"0px 0px 0px #dddddd","margin":"0 0 244rpx 0","borderRadius":"24rpx","background":"none","display":"block","width":"100%","position":"relative","height":"auto"}'>
				<image :style='{"width":"160rpx","margin":"0 0 40rpx 0","borderRadius":"100%","objectFit":"cover","display":"none","height":"160rpx"}' src="http://clfile.zggen.cn/20231027/4b7b24d658fd400e849c8c2314e29d56.jpg" mode="aspectFill"></image>
				<view v-if="loginType==1" :style='{"width":"100%","margin":"0 0 24rpx 0","borderRadius":"40rpx","background":"#00000040","height":"auto"}' class="uni-form-item uni-column">
					<input v-model="username" :style='{"border":"2rpx solid #00000010","padding":"0px 24rpx 0 24rpx","margin":"0 0 0 0","color":"#999999","borderRadius":"40rpx","background":"#00000040","width":"100%","fontSize":"28rpx","height":"80rpx"}' type="text" class="uni-input" name="" placeholder="请输入账号" />
				</view>
				<view v-if="loginType==1" :style='{"width":"100%","margin":"0 0 24rpx 0","borderRadius":"40rpx","background":"#00000040","height":"auto"}' class="uni-form-item uni-column">
					<input v-model="password" :style='{"border":"2rpx solid #00000010","padding":"0px 24rpx 0 24rpx","margin":"0 0 0 0","color":"#999999","borderRadius":"40rpx","background":"#00000040","width":"100%","fontSize":"28rpx","height":"80rpx"}' type="password" class="uni-input" name="" placeholder="请输入密码" />
				</view>
				<view v-if="true && loginType==1" class="code" :style='{"width":"100%","margin":"0 0 24rpx 0","flexWrap":"wrap","justifyContent":"space-between","display":"flex","height":"auto"}'>
					<input :style='{"border":"2rpx solid #00000010","padding":"0 24rpx 0 24rpx","margin":"0 0 0 0","color":"#999999","borderRadius":"40rpx","background":"#00000040","width":"calc(100% - 188rpx)","fontSize":"28rpx","height":"80rpx"}' type="text" v-model="inputCode" placeholder="请输入验证码" />
					<view class="getCodeBt" :style='{"border":"2rpx solid #00000010","padding":"0 0 0 0","margin":"0 0 0 0","alignItems":"center","borderRadius":"60rpx","background":"#00000040","display":"flex","width":"168rpx","justifyContent":"center","height":"88rpx"}' @click="randomString(4)">
						<view v-for="(item, index) in codes" :key="index" :style="{color:item.color,transform:item.rotate,fontSize:item.size,padding: '0 3px',display:'inline-block'}">{{ item.num }}</view>
					</view>
				</view>
				<picker v-if="roleNum>1" :style='{"border":"2rpx solid #00000010","padding":"0 20rpx","margin":"0 0 24rpx 0","borderRadius":"40rpx","background":"#00000040","width":"100%","height":"auto"}' @change="optionsChange" :value="index" :range="options">
					<view class="uni-picker-type" :style='{"width":"100%","lineHeight":"80rpx","fontSize":"28rpx","color":"#999999"}'>{{options[index]}}</view>
				</picker>
				<button v-if="loginType==1" class="btn-submit" @tap="onLoginTap" type="primary" :style='{"border":"0","padding":"0 0 0 0","margin":"0 0 24rpx 0","color":"#ffffff","borderRadius":"60rpx","background":"#3da742","width":"100%","lineHeight":"80rpx","fontSize":"32rpx","height":"80rpx"}'>登录</button>
				<button v-if="loginType==2" class="btn-submit" @tap="onFaceLoginTap" type="primary" :style='{"border":"0","padding":"0 0 0 0","margin":"0 0 24rpx 0","color":"#ffffff","borderRadius":"60rpx","background":"#3da742","width":"100%","lineHeight":"80rpx","fontSize":"32rpx","height":"80rpx"}'>人脸识别登录</button>
				<view class="links" :style='{"width":"100%","margin":"0 0 24rpx 0","flexWrap":"wrap","display":"flex","height":"auto"}'>
					<view class="link-highlight" @tap="onRegisterTap('yonghu')" :style='{"color":"#999999","padding":"0 8rpx 0 8rpx","fontSize":"28rpx"}'>注册用户</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import menu from '@/utils/menu'
	export default {
		data() {
			return {
				username: '',
				password: '',
                loginType:1,
				codes: [{
				  num: 1,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}, {
				  num: 2,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}, {
				  num: 3,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}, {
				  num: 4,
				  color: '#000',
				  rotate: '10deg',
				  size: '16px'
				}],
				options: [
					'请选择登录用户类型',
				],
                optionsValues: [
					'',
                    'yonghu',
				],
                inputCode: '',
                validateCode:'',
				index: 1,
				roleNum:0,
			}
		},
		onLoad() {
			let options = ['请选择登录用户类型'];
			let menus = menu.list();
			this.menuList = menus;
			for(let i=0;i<this.menuList.length;i++){
				if(this.menuList[i].hasFrontLogin=='是'){
					options.push(this.menuList[i].roleName);
					this.roleNum++;
				}
			}
			if(this.roleNum==1) {
				this.index = 1;
			}	
			this.options = options;
			this.randomString(4)
			this.styleChange()
		},
		methods: {
			randomString(len = 4) {
			  const chars = [
			    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
			    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			    'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			    'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
			    '3', '4', '5', '6', '7', '8', '9'
			  ]
			  const colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
			  const sizes = ['28', '30', '32', '34', '36']
			
              this.validateCode = ''
			  for (let i = 0; i < len; i++) {
			    // 随机验证码
			    const key = Math.floor(Math.random() * chars.length)
			    this.codes[i].num = chars[key]
                this.validateCode = this.validateCode+chars[key]
			    // 随机验证码颜色
			    let code = '#'
			    for (let j = 0; j < 6; j++) {
			      const key = Math.floor(Math.random() * colors.length)
			      code += colors[key]
			    }
			    this.codes[i].color = code
			    // 随机验证码方向
			    let rotate = Math.floor(Math.random() * 30)
			    const plus = Math.floor(Math.random() * 2)
			    if (plus == 1) rotate = '-' + rotate
			    this.codes[i].rotate = 'rotate(' + rotate + 'deg)'
			    // 随机验证码字体大小
			    const size = Math.floor(Math.random() * sizes.length)
			    this.codes[i].size = sizes[size] +'rpx'
			  }
			},
			styleChange() {
				this.$nextTick(()=>{
					// document.querySelectorAll('.uni-input .uni-input-input').forEach(el=>{
					//   el.style.backgroundColor = this.loginFrom.content.input.backgroundColor
					// })
				})
			},
			onRegisterTap(tableName) {
                uni.setStorageSync("loginTable", tableName);
				this.$utils.jump('../register/register')
			},
			async onLoginTap() {
                if (!this.username) {
					this.$utils.msg('请输入用户名')
					return
				}
                if (!this.password) {
					this.$utils.msg('请输入用户密码')
					return
				}
                if (!this.optionsValues[this.index]) {
					this.$utils.msg('请选择登录用户类型')
					return
				}
                let inputCodeLower = JSON.parse(JSON.stringify(this.inputCode)).toLowerCase()
                let validateCodeLower = JSON.parse(JSON.stringify(this.validateCode)).toLowerCase()
                if(inputCodeLower!=validateCodeLower && true) {
                    this.$utils.msg('请输入正确的验证码')
                    return
                }
				let res = await this.$api.login(`${this.optionsValues[this.index]}`, {
					username: this.username,
					password: this.password
				});
                uni.removeStorageSync("useridTag");
				uni.setStorageSync("token", res.token);
				uni.setStorageSync("nickname",this.username);
				uni.setStorageSync("nowTable", `${this.optionsValues[this.index]}`);
				res = await this.$api.session(`${this.optionsValues[this.index]}`);
                if(res.data.touxiang) {
                    uni.setStorageSync('headportrait', res.data.touxiang);
                } else if(res.data.headportrait) {
                    uni.setStorageSync('headportrait', res.data.headportrait);
                }
				// 保存用户id
				uni.setStorageSync("userid", res.data.id);
				if(res.data.vip) {
					uni.setStorageSync("vip", res.data.vip);
				}
				uni.setStorageSync("appRole", `${this.options[this.index]}`);
				this.$utils.tab('../index/index');
			},
			optionsChange(e) {
				this.index = e.target.value
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
